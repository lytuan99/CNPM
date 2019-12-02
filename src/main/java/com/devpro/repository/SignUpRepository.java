package com.devpro.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.devpro.entities.SignUp;
//lý tuấn 
@Repository
public interface SignUpRepository extends JpaRepository<SignUp, Integer> { }
