package com.poly.store.service.impl;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.poly.dao.OrderDAO;
import com.poly.dao.OrderDetailsDAO;
import com.poly.entity.Order;
import com.poly.entity.OrderDetail;
import com.poly.service.OrderDetailService;


@Service
public class OrderDetailsServicelmpl implements OrderDetailService {

	@Autowired
	OrderDAO dao;

	@Autowired
	OrderDetailsDAO ddao;

	@Override
	public List<OrderDetail> findByOrder(Order order) {
		
		return ddao.findAll();
	}





}
