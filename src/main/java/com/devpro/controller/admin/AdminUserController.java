package com.devpro.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.entities.Bill_Customer;
import com.devpro.entities.SignUp;
import com.devpro.repository.Bill_CustomerRepository;
import com.devpro.repository.SignUpRepository;

@Controller
public class AdminUserController {

	@Autowired SignUpRepository signUpRepository;
	@Autowired Bill_CustomerRepository customerRepository;
	
	@RequestMapping(value = { "/admin/orders" }, method = { RequestMethod.GET })
	public String listUserBill(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		List<Bill_Customer> customers = customerRepository.findAll();
		
		model.addAttribute("customers", customers);
		
		// trả về tên view.
		return "list_muaHang";
	}
	
	
	
	@RequestMapping(value = { "/admin/list-user" }, method = { RequestMethod.GET })
	public String listUser(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		List<SignUp> users = signUpRepository.findAll();
		
		model.addAttribute("users", users);
		
		// trả về tên view.
		return "admin/list_user";
	}
	
	
	
	@RequestMapping(value = { "/admin/edit-user/{userId}" }, method = { RequestMethod.GET })
	public String editUser(@PathVariable int userId, final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		SignUp user = signUpRepository.getOne(userId);
		model.addAttribute("user", user);
		
		// trả về tên view.
		return "admin/edit_user";
	}
	
	@RequestMapping(value = { "/admin/edit-user" }, method = { RequestMethod.POST })
	public String saveUserUpdate(@ModelAttribute("user1") SignUp user1 ,
								final ModelMap model,         //user này sẽ tự động gắp với user đang cần update để lưu lại (post)
								final HttpServletRequest request, final HttpServletResponse response) {
		
		signUpRepository.save(user1);
		
		return listUser(model, request, response);
	}
}
