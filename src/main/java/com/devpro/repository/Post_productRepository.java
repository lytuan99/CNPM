package com.devpro.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.devpro.entities.Post_Product_detail;

public interface Post_productRepository extends JpaRepository<Post_Product_detail, Integer> {

}
