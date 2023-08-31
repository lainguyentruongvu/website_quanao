package com.poly.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.poly.service.SessionService;
@Controller
public class LogOutController {	
	@Autowired
	SessionService sessionService;
	@RequestMapping("logout")
	public String logout(Model model) {
		sessionService.removeAttribute("user");
		return "redirect:";
	}

}
