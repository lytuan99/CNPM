package com.devpro;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;



@SpringBootApplication  /** điểm vào của spring-boot. */
public class StartSever_fiveStars implements CommandLineRunner {

	
	@Value("${server.port}") private Integer port; 
	@Override
	public void run(String... args) throws Exception {
		System.out.println("---------------- code execute--------------");
		System.out.println(" DAY LA WEBSITE BAN HANG CUA NHOM 5-Stars ");
		
	}
	
	
	public static void main(String[] args) {
		SpringApplication.run(StartSever_fiveStars.class, args);
		
	}

}
