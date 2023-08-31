package com.poly.dao;




import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.entity.Product;




public interface ProductsDAO  extends JpaRepository<Product, Integer> {

	
	@Query("SELECT p FROM Product p WHERE p.category.id=?1")
	List<Product> findByCategory(String cid);
	

}
