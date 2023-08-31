package com.poly.service;

import java.util.List;

import com.fasterxml.jackson.databind.JsonNode;
import com.poly.entity.Order;
import com.poly.entity.Product;

public interface OrderService {

	Order create(JsonNode orderData);


	List<Order> findByUsername(String username);

	Order findById(Long id);

	void delete(Order order);

	
	List<Order> findAll();


	void save(Order order);


	Order update(Order order);



}
