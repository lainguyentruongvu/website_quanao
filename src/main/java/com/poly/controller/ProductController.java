package com.poly.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.CategoryDAO;
import com.poly.entity.Category;
import com.poly.entity.Product;
import com.poly.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	ProductService productService;
	@Autowired
	CategoryDAO categoryDao;

	@RequestMapping("/")
	public String index(Model model,@RequestParam("cid") Optional<String>cid) {
		if(cid.isPresent()) {
			List<Product> list=productService.findByCategory(cid.get());
			model.addAttribute("items",list);
		}else {
			List<Product> list=productService.findAll();
			model.addAttribute("items",list);
		}	
		return "product/index";
	}
	
	@RequestMapping("/product/detail/{id}")
	public String detail(Model model,@PathVariable("id") Integer id) {
		Product item=productService.findById(id);
		model.addAttribute("item",item);
		return "product/detail";
	}
	@RequestMapping("/category")
	public String category(Model model) {
		model.addAttribute("cate",categoryDao.findAll());
		return "product/index";
	}

}