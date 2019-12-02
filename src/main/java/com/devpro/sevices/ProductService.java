package com.devpro.sevices;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devpro.entities.Post_Product_detail;
import com.devpro.repository.CategoryRepository;
import com.devpro.repository.Post_productRepository;
import com.devpro.repository.SignUpRepository;
import javax.persistence.Query;
@Service
public class ProductService {

	@Autowired CategoryRepository categoryRepository;
	@Autowired Post_productRepository productRepository;
	@Autowired SignUpRepository userRepository;
	
	
	@PersistenceContext EntityManager entityManager;
	
	@SuppressWarnings("unchecked")
	public List<Post_Product_detail> search(String name_category){
//		String jpql1 = "select p.* from post_product_detail p, category c where p.id_category = c.id and c.name = 'Áo thun' ";

		String jpql = "select p from Post_Product_detail p, Category c where c.id = p.category.id"; // JPQL: lấy tất cả Post trong db.

		
			jpql += " and c.name =" + name_category; // select p from Post p where 1=1 and p.category.id=1

		
		Query query = entityManager.createQuery(jpql, Post_Product_detail.class);

		
		
		return query.getResultList();
	}
	
	// lấy ra danh sách các sản phẩm là quần áo
	@SuppressWarnings("unchecked")
	public List<Post_Product_detail> searchQO(){

		String jpql = "select p from Post_Product_detail p, Category c where c.id = p.category.id and c.id in (5,6,7,8,10)"; 

		
		Query query = entityManager.createQuery(jpql, Post_Product_detail.class);

		
		
		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<Post_Product_detail> searchGiay(){

		String jpql = "select p from Post_Product_detail p, Category c where c.id = p.category.id and c.id in (9,12,13)"; 

		
		Query query = entityManager.createQuery(jpql, Post_Product_detail.class);

		
		
		return query.getResultList();
	}

	
	
}
