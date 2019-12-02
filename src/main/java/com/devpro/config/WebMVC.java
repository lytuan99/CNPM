package com.devpro.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

/**
 * đây là file cấu hình MVC trong project
 * 
 * @author lytuan
 * */

@Configuration // báo hiệu cho spring-boot biết đây là file cấu hình
@EnableWebMvc  //  file cấu hình này dùng cho web-MVC
@ComponentScan(basePackages = {"com.devpro"})  //  chỉ cho spring MVC nơi chứa các controller

public class WebMVC implements WebMvcConfigurer {
	// giá trị return của hàm chính là kiểu dữ liệu của bean đấy
	/**
	 * 
	 * chỉ cho spring mvc biết nơi chứa các view dã tạo ở phần 1 : front end
	 * 
	 * */
	@Bean 
	public ViewResolver viewResolver() {
		
		System.out.println(" ___________MVC_____________-");
		InternalResourceViewResolver bean = new InternalResourceViewResolver();

		bean.setViewClass(JstlView.class);

		bean.setPrefix("/WEB-INF/view/");
		bean.setSuffix(".jsp");

		return bean;
	}
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/css/**").addResourceLocations("classpath:/META-INF/css/");
		registry.addResourceHandler("/js/**").addResourceLocations("classpath:/META-INF/js/");
		registry.addResourceHandler("/image/**").addResourceLocations("classpath:/META-INF/image/");
		registry.addResourceHandler("/summernote/**").addResourceLocations("classpath:/META-INF/summernote/");
		registry.addResourceHandler("/glyphicon/**").addResourceLocations("classpath:/META-INF/glyphicon/");
//		registry.addResourceHandler("/summernote/**").addResourceLocations("classpath:/META-INF/resources/summernote/");
//		registry.addResourceHandler("/files/**").addResourceLocations("file:E:/eclipse-workspace/Javaweb1903BE/upload/");
		registry.addResourceHandler("/files/**").addResourceLocations("file:E:/java-web/java_web_devpro_maven/TMDT/upload/");
	}
	
}
