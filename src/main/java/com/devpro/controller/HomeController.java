package com.devpro.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.entities.Bill_Customer;
import com.devpro.entities.CartUtil;
import com.devpro.entities.RestResponse;
import com.devpro.repository.Bill_CustomerRepository;
import com.devpro.repository.CategoryRepository;
import com.devpro.repository.Post_productRepository;
import com.devpro.sevices.ProductService;

/***
 * 
 * trang mặc định khi truy cập trang website..có nhiều endpoint trên một view
 * 
 * */
@Controller
public class HomeController {
	
	@Autowired Post_productRepository post_productRepository;
	@Autowired CategoryRepository categoryRepository;
	@Autowired ProductService productService;
	@Autowired Bill_CustomerRepository bill_CustomerRepository;
	
	@RequestMapping(value = { "/logoutSuccessful" }, method = { RequestMethod.GET })
	public String logout(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		return "logOut";
	}
	@RequestMapping(value = { "/login" }, method = { RequestMethod.GET })
	public String login(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		return "login";
	}
	
	private Integer id_customer;
	
	@RequestMapping(value = { "/hoanTat" }, method = { RequestMethod.POST })
	public String hoanTat(@ModelAttribute("hoanTat") Bill_Customer bill_customer,
			final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		bill_customer.setCreatedDate(new Date());
		bill_CustomerRepository.save(bill_customer);
		
	//	System.out.println(bill_customer.getId() + "===================================================");
		id_customer = bill_customer.getId();
		model.addAttribute("status", "success");
		
		
		return "bill";
	}
	
	@RequestMapping(value = { "/hoanTat" }, method = { RequestMethod.GET })
	public String showBill(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		model.addAttribute("hoanTat", new Bill_Customer());         // dòng này quan trọng...
		model.addAttribute("_payment",CartUtil.payment(request));
		return "bill";
	}
	
	@RequestMapping(value = { "/hoaDon" }, method = { RequestMethod.GET })
	public String hoaDon(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		model.addAttribute("customer", bill_CustomerRepository.getOne(id_customer));
		model.addAttribute("_payment",CartUtil.payment(request));
		return "showBill";
	}
	
	
	@RequestMapping(value = {"/"}, method = { RequestMethod.GET })
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		
		model.addAttribute("_posts",post_productRepository.findAll());
		System.out.println("kiểm tra chỗ này cái nào-----------------------------");// dòng này sẽ lấy tất cả các post_product và tải lên view của trang index
		// trả về tên view.
		return "index";
	}
	

	
	@RequestMapping(value = {"/chi_tiet/{post_product_id}/{productName}"},method = {RequestMethod.GET})
	public String chi_tiet(@PathVariable int post_product_id, @PathVariable String productName,
			final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		
		model.addAttribute("post_product", post_productRepository.getOne(post_product_id));   //lấy 1 dữ liệu (đang được lưu trong URI) rồi nhét vào model để đẩy lên view
		return "chi_tiet";
	}
	
	@RequestMapping(value = {"/cua_hang"},method = {RequestMethod.GET})
	public String cua_hang(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		return "cua_hang";
	}

	@RequestMapping(value = {"/memberShip"},method = {RequestMethod.GET})
	public String memberShip(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		return "memberShip";
	}
	
	@RequestMapping(value = {"/gio_hang"},method = {RequestMethod.GET})
	public String gio_hang(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {

		model.addAttribute("_tongSP",CartUtil.tongSP(request));
		model.addAttribute("_payment",CartUtil.payment(request));

		return "gio_hang";
	}
	
	@RequestMapping(value = "/cart/delete/{productId}", method = {RequestMethod.GET})
	public String deleteProduct(@PathVariable Integer productId, final ModelMap model,
			final HttpServletRequest request, final HttpServletResponse response) {
		
		CartUtil.delete(productId, request);
		
		return gio_hang(model, request, response);
	}

	@RequestMapping(value = {"/bill"}, method = {RequestMethod.GET})
	public String bill(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		model.addAttribute("hoanTat", new Bill_Customer()); 
		model.addAttribute("_payment",CartUtil.payment(request));
		HttpSession session = request.getSession();
		if(session.getAttribute("giohang") == null)
			return gio_hang(model, request, response);
		else
		return "bill";
		}
		
	

	@RequestMapping(value = {"/category/{categoryName}"}, method = { RequestMethod.GET })
	public String category(@PathVariable String categoryName, final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		// trả về tên view.
		model.addAttribute("categories", productService.search(categoryName));
		model.addAttribute("_categories", categoryRepository.findAll());
		
		String name = categoryName.substring(1, categoryName.length()-1);
		model.addAttribute("nameCategory", name);
		return "categories";
	}
	
	@RequestMapping(value = {"/Quan_ao"}, method = { RequestMethod.GET })
	public String categoryQO( final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		// trả về tên view.
		model.addAttribute("quan_ao", productService.searchQO());
		model.addAttribute("_categories", categoryRepository.findAll());
		return "categories/quan_ao";
	}
	
	@RequestMapping(value = {"/Giay"}, method = { RequestMethod.GET })
	public String categoryGiay(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		// trả về tên view.
		model.addAttribute("giay", productService.searchGiay());
		model.addAttribute("_categories", categoryRepository.findAll());
		return "categories/giay";
	}
	
	
	
	
	

//	@RequestMapping(value = {"/ao_thun"}, method = { RequestMethod.GET })
//	public String aoThun(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
//		// trả về tên view.
//
//		model.addAttribute("ao_thun", productService.search("'Áo thun'"));
//		model.addAttribute("_categories", categoryRepository.findAll());
//		return "categories/ao_thun";
//	}
//	
//	@RequestMapping(value = {"/giay_tay"}, method = { RequestMethod.GET })
//	public String giay(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
//		// trả về tên view.
//
//		model.addAttribute("giay", productService.search("'giày tây'"));
//		model.addAttribute("_categories", categoryRepository.findAll());
//		return "categories/giay_tay";
//	}
//	
//	@RequestMapping(value = {"/quan"}, method = { RequestMethod.GET })
//	public String quan(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
//		// trả về tên view.
//
//		model.addAttribute("quan", productService.search("'quần kaki'"));
//		model.addAttribute("_categories", categoryRepository.findAll());
//		return "categories/quan";
//	}
	
	
	@RequestMapping(value = {"/mua_ngay/{productId}"}, method = {RequestMethod.GET})
	public String muaNgay(@PathVariable("productId") Integer productId,
			final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		//lấy dữ liệu về database xong phải thông báo cho người dùng là đã lưu thành công
		model.addAttribute("item",post_productRepository.getOne(productId));

	return "mua_ngay";
	}
	
	
	
	
//	@GetMapping(value = "/cart/add_sub")
//	public String addProduct(@PathVariable Integer productId, final ModelMap model,
//			final HttpServletRequest request, final HttpServletResponse response) {
//		
//		
//		model.addAttribute("quantity", new Quantity());
//
//		return gio_hang(model, request, response);
//	}
//	@PostMapping(value = "/cart/add_sub/{productId}")
//	public String product(@PathVariable Integer productId,@ModelAttribute("quantity") Quantity quantity, final ModelMap model,
//			final HttpServletRequest request, final HttpServletResponse response) {
//		
//		CartUtil.add_sub(quantity.getQuantity(),productId, request);
//		model.addAttribute("quantity", quantity);
//		return gio_hang(model, request, response);
//	}
//	

	
	
	
}
