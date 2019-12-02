package com.devpro;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.devpro.beans.Employee;



@SpringBootApplication  /** điểm vào của spring-boot. */
public class StartSever implements CommandLineRunner {
	@Autowired private Employee employee;
	
	@Value("${server.port}") private Integer port; 
	@Override
	public void run(String... args) throws Exception {
		System.out.println("---------------- code execute--------------");
		System.out.println(" DAY LA WEBSITE BAN HANG Name: " + employee.name);
		System.out.println("Address: " +  employee.getAddress().address1 + employee.getAddress().address2);
	}
	
	
	public static void main(String[] args) {
		SpringApplication.run(StartSever.class, args);
		
	}

}
