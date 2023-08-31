package com.poly.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class DetailController {
	@RequestMapping("/detail")
	public String index(Model model) {
		return "product/detail";
	}

}
