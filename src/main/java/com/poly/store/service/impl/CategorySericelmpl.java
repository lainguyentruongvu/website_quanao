package com.poly.store.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.dao.CategoryDAO;
import com.poly.dao.ProductsDAO;
import com.poly.entity.Category;
import com.poly.entity.Product;
import com.poly.service.CategoryService;
import com.poly.service.ProductService;
@Service
public class CategorySericelmpl implements CategoryService {
		@Autowired
		CategoryDAO categorydao;

		@Override
		public List<Category> findAll() {	
			return categorydao.findAll();
		}

	
}
