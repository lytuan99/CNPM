package com.devpro.entities;

import java.math.BigDecimal;

//@Entity
//@Table(name = "cart")
public class Cart{
	
	private Integer productID;
	private String productName;
	private BigDecimal price;
	private int quantity;
	private Images_attachment productImage;
	private String priceFormat;
	
	
	
	private String pay;
	public String getPay() {
		return pay;
	}
	public void setPay(String pay) {
		this.pay = pay;
	}
	public Integer getProductID() {
		return productID;
	}
	public void setProductID(Integer productID) {
		this.productID = productID;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Images_attachment getProductImage() {
		return productImage;
	}
	public void setProductImage(Images_attachment productImage) {
		this.productImage = productImage;
	}
	public String getPriceFormat() {
		return priceFormat;
	}
	public void setPriceFormat() {
		this.priceFormat = CartUtil.formatPrice(price);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	@Column(name = "payment")
//	private BigDecimal payment;
//	
//	
//	@ManyToOne(fetch = FetchType.EAGER)					//eager là lấy toàn bộ dữ liệu trong quan hệ nhiều---1  (tức là trong bảng images_att  sẽ có nhiều cái id của post_product_detail)
//	@JoinColumn(name = "id_product_order")      // tên cột chứa khóa ngoai của bảng Cart
//	private Product_order product_order;
//
//	@OneToOne                           // mối quan hệ 1-1 với customers liên kết với nhau qua khóa chính id_customer
//	@JoinColumn(name = "id_customer")
//	private SignUp customers;
//	
//	public SignUp getCustomers() {
//		return customers;
//	}
//
//	public void setCustomers(SignUp customers) {
//		this.customers = customers;
//	}
//
//	public Product_order getProduct_order() {
//		return product_order;
//	}
//
//	public void setProduct_order(Product_order product_order) {
//		this.product_order = product_order;
//	}
//
//
//
//	public BigDecimal getPayment() {
//		return payment;
//	}
//
//	public void setPayment(BigDecimal payment) {
//		this.payment = payment;
//	}
//
//	
	
	
}
