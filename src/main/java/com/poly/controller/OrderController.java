package com.poly.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.OrderDetailsDAO;
import com.poly.entity.Order;
import com.poly.entity.OrderDetail;
import com.poly.service.OrderDetailService;
import com.poly.service.OrderService;

@Controller
public class OrderController {
	@Autowired
	OrderService orderService;
	@Autowired
	OrderDetailService orderdetailService;
	@Autowired
	OrderDetailsDAO orderdetailDao;
		
	@RequestMapping("/order/checkout")
	public String checkout(Model model) {
		return "order/checkout";
	}

	@RequestMapping("/order/list")
	public String list(Model model, HttpServletRequest request) {
		String username = request.getRemoteUser();
		model.addAttribute("orders",orderService.findByUsername(username));
		return "order/list";
	}
	@RequestMapping("/order/detail/{id}")
	public String detail(@PathVariable("id") Long id, Model model) {
		model.addAttribute("order", orderService.findById(id));
		return "order/orderdetail";
	}
	
	@RequestMapping("delete/{id}")	
	public String Delete(Model model ,@PathVariable("id") Long id) {					
		Order order=orderService.findById(id);	
		
		List<OrderDetail> ordertail=orderdetailService.findByOrder(order);
		for (OrderDetail orderdetail : ordertail) {
			orderdetailDao.delete(orderdetail);
		}
		orderService.delete(order);				
		return "redirect:/order/list";
	}
	@RequestMapping("order/orders")
	public String listAll(Model model) {
		model.addAttribute("ordersall", orderService.findAll());
		return "order/orders";
	}

//	@RequestMapping("update")
//	public String Update(Model model, @RequestParam("id") Long id, @RequestParam("status") String newStatus) {
//		Order order = orderService.findById(id);
//		String sa = newStatus.substring(0,newStatus.length() - 1);
//		order.setStatus(sa);
//		orderService.save(order);
//		return "redirect:order/orders";
//	}
	@RequestMapping("update")
	public String Update(Model model, @RequestParam("id") Long id, @RequestParam("status") String newStatus) {
		Optional<Order> oporder = Optional.of(orderService.findById(id));
		if(oporder.isPresent()) {
			Order order=oporder.get();
			order.setStatus(newStatus);
			orderService.save(order);
		}
		
		return "redirect:order/orders";
	}
	
	
	
}
