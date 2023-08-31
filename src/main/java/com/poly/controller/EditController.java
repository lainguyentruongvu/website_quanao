package com.poly.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.poly.dao.AccountDAO;
import com.poly.entity.Account;


@Controller
public class EditController {
	@Autowired
	ServletContext app;
	@Autowired
	HttpSession session;
	@Autowired
	AccountDAO accdao;
	
	@RequestMapping("/edit/profile")
	public String home(Model model,Account user) {
		model.addAttribute("user", user);
		Account acc= (Account) session.getAttribute("user");
		model.addAttribute("acc",acc);
		return "auth/profile";
	}
	
	@RequestMapping("/edit/{id}")
	public String edit(Model model , @PathVariable("id") String id) {
		Account item = accdao.findById(id).get();
		model.addAttribute("acc", item);
		List<Account> items = accdao.findAll();
		model.addAttribute("items", items);
		return "auth/profile";
	}
	
	

	@RequestMapping("edit/update")
	public String update(Model model, Account acc,  @RequestParam("photo_file") MultipartFile img )
			throws IllegalStateException, IOException {

		Account user = accdao.findById(acc.getUsername()).get();	
		if (img.isEmpty()) {
			acc.setImages(user.getImages());
			accdao.save(acc);
		} else {
			String filename = img.getOriginalFilename();
			File file = new File(app.getRealPath("/img/user/" + filename));
			img.transferTo(file);
			acc.setImages(filename);
			accdao.save(acc);
			
		}
		
		return "redirect:/edit/" + acc.getUsername();
	}
	

}
