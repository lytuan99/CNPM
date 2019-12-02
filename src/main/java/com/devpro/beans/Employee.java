package com.devpro.beans;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/* Bean thường*/
@Component
public class Employee {

	@Autowired Address address;   /* @Autowired để inject 1 bean vào trong 1 bean khác*/
	public String name = "TuanLB";
	
	public Address getAddress() {
		 return address;
	}
	
	
	
}
