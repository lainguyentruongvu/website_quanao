package com.poly.store.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.dao.ProductsDAO;
import com.poly.entity.Product;
import com.poly.service.ProductService;

@Service
public class ProductSericelmpl implements ProductService {
	@Autowired
	ProductsDAO productdao;

	@Override
	public List<Product> findAll() {
		return productdao.findAll();
	}

	@Override
	public Product findById(Integer id) {
		return productdao.findById(id).get();
	}

	@Override
	public List<Product> findByCategory(String cid) {

		return productdao.findByCategory(cid);
	}

	@Override
	public Product create(Product product) {
		return productdao.save(product);
	}

	@Override
	public Product update(Product product) {
		
		return productdao.save(product);
	}

	@Override
	public void delete(Integer id) {
	
		 productdao.deleteById(id);
	}
}
