package com.poly.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.poly.entity.Account;
import com.poly.entity.Product;
import com.poly.service.AccountService;
import com.poly.service.ProductService;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/accounts")
public class UserRestController {
	@Autowired
	AccountService accountService;

	@GetMapping()
	public List<Account> getAll() {
		return accountService.findAll();
	}

	@GetMapping("{username}")
	public Account getOne(@PathVariable("username") String username) {
		return accountService.findByUsername(username);
	}
	
	@PostMapping
	public Account create(@RequestBody Account account) {
		
		return accountService.create(account);
	}
	
	 
	  @PutMapping("{username}")
	  public Account update(@PathVariable("username") String username
	  ,@RequestBody Account account) {
	
		  return accountService.update(account);
		 }
	  
	  @DeleteMapping("{username}")
	  public void delete(@PathVariable("username") String username) {
	
		  accountService.delete(username);
		 }
	 

}
