package com.devpro.entities;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.text.NumberFormat;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;



public class CartUtil {

	private CartUtil() {}
	
	
	@SuppressWarnings("unchecked")
	public static void checkCart(Post_Product_detail product, HttpServletRequest request) {
		
		Integer productId = product.getId();
		List<Cart> carts = new ArrayList<Cart>();
		HttpSession session = request.getSession();
		//lấy ra danh sách sản phẩm từ session
		if(session.getAttribute("giohang") != null) {
			carts = (List<Cart>) session.getAttribute("giohang");
		}
		
		// kiểm tra xem product đã tồn tại trong giỏ hàng chưa
		boolean checkExists = false;
		for (Cart cart2 : carts) {
			if(cart2.getProductID() == productId) {
				checkExists = true;
				break;
			}
		}
		// nếu chưa tồn tại product trong giỏ thì thêm vào giỏ
		if(checkExists == false) {
			Cart cart = new Cart();
			cart.setPrice(product.getGia());
			cart.setProductID(productId);
			cart.setProductImage(product.getImages_attachments().get(0));
			cart.setProductName(product.getName());
			cart.setQuantity(1);
			cart.setPay(CartUtil.formatPrice(product.getGia()));
			cart.setPriceFormat();
			carts.add(cart);
		}
		// nếu đã tồn tại thì tìm đến sản phẩm rồi tăng thêm 1 sp và tăng thêm giá
		else {
			for (Cart cart : carts) {
				if(cart.getProductID() == productId) {
					cart.setQuantity(cart.getQuantity()+1);
					cart.setPay(CartUtil.formatPrice(cart.getPrice().multiply(new BigDecimal(cart.getQuantity()))));
				}
			}
		}
		session.setAttribute("giohang", carts);
		
		if(session.getAttribute("giohang") == null) {
			System.out.println( "=========================================== test");
		}
		else {
			List<Cart> cart2 = new ArrayList<Cart>();
			cart2 = (List<Cart>) session.getAttribute("giohang");
			System.out.println(cart2.size() + "=========================================== test");
		}
			
	}
	
	public static Integer tongSP(HttpServletRequest request) {
		Integer tong = 0;
		List<Cart> carts = new ArrayList<Cart>();
		HttpSession session = request.getSession();
		//lấy ra danh sách sản phẩm từ session
		if(session.getAttribute("giohang") != null) {
			carts = (List<Cart>) session.getAttribute("giohang");
		}
		
		for (Cart cart : carts) {
			tong += cart.getQuantity(); 
		}
		return tong;
	}
	
	@SuppressWarnings("null")
	public static String payment(HttpServletRequest request) {
		BigDecimal PAY = BigDecimal.ZERO;
		List<Cart> carts = new ArrayList<Cart>();
		HttpSession session = request.getSession();
		//lấy ra danh sách sản phẩm từ session
		if(session.getAttribute("giohang") != null) {
			carts = (List<Cart>) session.getAttribute("giohang");
		}
		
		for (Cart cart : carts) {
			
			PAY = PAY.add(cart.getPrice().multiply(new BigDecimal(cart.getQuantity())));
		}
		
		String pay = CartUtil.formatPrice(PAY);
		return pay;
	}
	
	public static void add_sub(int quantity,Integer productId,HttpServletRequest request) {
		List<Cart> carts = new ArrayList<Cart>();
		HttpSession session = request.getSession();
		// lấy ra danh sách sản phẩm từ session
		if(session.getAttribute("giohang")!=null)
		{
			carts = (List<Cart>) session.getAttribute("giohang");
		}

		for(Cart cart2:carts)
		{
			if (cart2.getProductID() == productId) {
				cart2.setQuantity(quantity);
			}
		}
		
		session.setAttribute("giohang", carts);
	}
	
	public static void delete(Integer id,HttpServletRequest request) {
		List<Cart> carts = new ArrayList<Cart>();
		HttpSession session = request.getSession();
		// lấy ra danh sách sản phẩm từ session
		if(session.getAttribute("giohang")!=null)
		{
			carts = (List<Cart>) session.getAttribute("giohang");
		}

		int count = 0;
		for(Cart cart:carts)
		{
			if (cart.getProductID() == id) {
				count++;
				break;
			}
			count++;
		}
		count--;
		carts.remove(count);
		
		session.setAttribute("giohang", carts);
	}
	
	public static String formatPrice(BigDecimal price) {
		NumberFormat currentLocale = NumberFormat.getInstance();
		long price2 = Long.parseLong(price.toString());
		Locale localeVN = new Locale("vi", "VN");
	    NumberFormat vn = NumberFormat.getInstance(localeVN);
        String currency = vn.format(price2);
        return currency;
	}


}
