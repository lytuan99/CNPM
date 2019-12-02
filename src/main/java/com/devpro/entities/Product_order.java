package com.devpro.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.ManyToAny;

//@Entity
//@Table(name = "product_order")
public class Product_order extends BaseEntity {

//	@Column(name = "id_customer", length = 10, nullable = false)
//	private Integer id_customer;
//
//	@Column(name = "id_product", length = 10, nullable = false)
//	private Integer id_product;
//	
//	@Column(name = "amount", length = 10, nullable = false)
//	private Integer amount;
//	
//	@OneToMany(cascade = CascadeType.ALL, mappedBy = "product_order", fetch = FetchType.LAZY)  // liên kết bảng cart 1 -- nhiều với bảng product order
//	private List<Cart> cart = new ArrayList<Cart>();
//	
//	
//	public List<Cart> getCart() {
//		return cart;
//	}
//
//	public void setCart(List<Cart> cart) {
//		this.cart = cart;
//	}
//
//	
//
//	public Integer getAmount() {
//		return amount;
//	}
//
//	public void setAmount(Integer amount) {
//		this.amount = amount;
//	}
//
//	public Integer getId_customer() {
//		return id_customer;
//	}
//
//	public void setId_customer(Integer id_customer) {
//		this.id_customer = id_customer;
//	}
//
//	public Integer getId_product() {
//		return id_product;
//	}
//
//	public void setId_product(Integer id_product) {
//		this.id_product = id_product;
//	}
//	
//	
}
