package com.devpro.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.devpro.entities.Bill_Customer;
import com.devpro.entities.Cart;
import com.devpro.entities.CartUtil;
import com.devpro.entities.Post_Product_detail;
import com.devpro.entities.RestResponse;
import com.devpro.repository.Post_productRepository;
import com.devpro.repository.SignUpRepository;

import net.bytebuddy.implementation.auxiliary.AuxiliaryType.SignatureRelevant;

@RestController
@RequestMapping(value = "/rest/api")
public class UserRestController {

	/***
	 * API : khác với controller thường API trả về data (json , xml, string, number)
	 * 
	 * @requestBody của spring dùng để spring mapping dữ liệu người dùng đẩy lên với
	 *              model
	 * @param data
	 * @param model
	 * @param request
	 * @param response
	 * 
	 */
	@Autowired
	Post_productRepository postRepository;
	@Autowired
	SignUpRepository userRepository;

	@PostMapping(value = "/product/delete")
	public ResponseEntity<RestResponse> productDelete(@RequestBody final Map<String, Object> data, final ModelMap model,
			final HttpServletRequest request, final HttpServletResponse response) {
		Integer entityId = (Integer) data.get("entityId");
		postRepository.deleteById(entityId);
		return ResponseEntity.ok(RestResponse.success("Bạn đã xoá thành công"));
	}

	@PostMapping(value = "/user/delete")
	public ResponseEntity<RestResponse> userDelete(@RequestBody final Map<String, Object> data, final ModelMap model,
			final HttpServletRequest request, final HttpServletResponse response) {
		Integer entityId = (Integer) data.get("entityId");
		userRepository.deleteById(entityId);
		return ResponseEntity.ok(RestResponse.success("Bạn đã xoá thành công"));
	}

	@PostMapping(value = { "/cart/addToCart" })
	public ResponseEntity<RestResponse> addToCart(@RequestBody final Map<String, Object> data, final ModelMap model,
			final HttpServletRequest request, final HttpServletResponse response) {
		Integer productId = (Integer) data.get("productId");
		Post_Product_detail product = postRepository.getOne(productId);

		CartUtil.checkCart(product, request); // kiểm tra xem đã có sản phẩm trong giỏ hàng chưa để thêm bớt

		return ResponseEntity.ok(RestResponse.success("Bạn đã thêm vào giỏ thành công"));
	}
	
	@PostMapping(value = "/user/register")
	public ResponseEntity<RestResponse> register(@RequestBody final Map<String, Object> data, final ModelMap model,
			final HttpServletRequest request, final HttpServletResponse response) {

		String email = (String) data.get("email");
		if (!email.contains("@")) {
			return ResponseEntity.ok(RestResponse.failed("Email chưa đúng định dạng!"));
		}

		return ResponseEntity.ok(RestResponse.success("Bạn đã đăng kí thành công"));
	}
	

	@GetMapping(value = "/user/register")
	public ResponseEntity<RestResponse> testRestApi(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) {
		return ResponseEntity.ok(RestResponse.success("Bạn đã đăng kí thành công"));
	}



	
}
