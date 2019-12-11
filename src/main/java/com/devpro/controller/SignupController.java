package com.devpro.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.devpro.entities.SignUp;
import com.devpro.repository.SignUpRepository;



@Controller 
public class SignupController {
	
	@RequestMapping(value = {"/signUp"},method = {RequestMethod.GET})
	public String dang_ky(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		
		SignUp sign = new SignUp();
//		signUp.setFullName("Lý Bá Tuấn");
//		signUp.setEmail("lytuan99@gmail.com");
//		signUp.setContent("học học nữa học mãi");
//		signUp.setNumberPhone("0969661620");
//		signUp.setPassword("lytuan99");
		model.addAttribute("signUp",sign);
		
		return "signUp";
	}
	
//	@RequestMapping(value = {"/dang_ky"}, method = {RequestMethod.POST})
//	public String saveSignUp(@ModelAttribute("signUp") SignUp signUp,
//			final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
//		System.out.println(signUp.getFullName());
//		System.out.println(signUp.getEmail());
//		
//		//lấy dữ liệu về database xong phải thông báo cho người dùng là đã lưu thành công
//		model.addAttribute("status","failed");
//		return"dang_ky";
//	}
	
	@Autowired SignUpRepository signUpRepository;
	
	
	@RequestMapping(value = {"/signUp"}, method = {RequestMethod.POST})
	public String saveSignUpBySpring(@ModelAttribute("signUp") SignUp signUp,
			final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
	
		if(signUp.getCity() == null || signUp.getEmail() == null || signUp.getFullName() == null || signUp.getPassword() == null
				 || signUp.getNumberPhone() == null || signUp.getAccount() == null) {
			model.addAttribute("status", "failed");
			model.addAttribute("signUp", signUp);
			return "signUp";
		}
		
		else if(signUp.getEmail().contains("@gmail.com") == false) {
			model.addAttribute("status", "failedMail");
			model.addAttribute("signUp", signUp);
			return "signUp";
		}
		
		else if(signUp.getPassword().length() < 8) {
			model.addAttribute("status", "failedPass");
			model.addAttribute("signUp", signUp);
			return "signUp";
		}
		else {
			signUpRepository.save(signUp);
			 
			//lấy dữ liệu về database xong phải thông báo cho người dùng là đã lưu thành công
			model.addAttribute("status","success");
			model.addAttribute("signUp", signUp);
			return "signUp";
		}
		
		
	}
	
	@RequestMapping(value = {"/signUp_normal"}, method = {RequestMethod.POST})
	public String saveSignUpNormal(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		String fullName = request.getParameter("fullName");
		String email = request.getParameter("mail");
		
		SignUp signUp = new SignUp();
		signUp.setEmail(email);
		signUp.setFullName(fullName);
		System.out.println(email);
		System.out.println(fullName);
	
		model.addAttribute("signUp", signUp);
		
		
	
	return"signUp";
	
	
	}
}
