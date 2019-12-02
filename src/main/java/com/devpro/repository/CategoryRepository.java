package com.devpro.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.devpro.entities.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer> {

}
