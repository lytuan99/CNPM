package com.devpro.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "customer_detail")

public class SignUp extends BaseEntity{
	@Column(name = "fullName", length = 45, nullable = false)
	private String fullName;
	
	@Column(name = "mobile", length = 10, nullable = false)
	private String numberPhone;
	
	@Column(name = "email", length = 45, nullable = false)
	private String email;
	
	@Column(name = "account", length = 45, nullable = false)
	private String account;
	
	@Column(name = "city", length = 45, nullable = false)
	private String city;
	
	@Column(name = "password", length = 45, nullable = false)
	private String password;
	
//	@ManyToMany(fetch = FetchType.LAZY,
//			cascade = {
//                CascadeType.PERSIST,
//                CascadeType.MERGE
//            },
//            mappedBy = "customers")
//	private List<Post_Product_detail> products = new ArrayList<Post_Product_detail>();
//	
//	
//	public List<Post_Product_detail> getProducts() {
//		return products;
//	}
//
//	public void setProducts(List<Post_Product_detail> products) {
//		this.products = products;
//	}

	public SignUp() {
		
	}
	
	public SignUp(String fullName, String numberPhone, String email, String password,String city) {
		super();
		this.fullName = fullName;
		this.numberPhone = numberPhone;
		this.email = email;
		this.password = password;
		this.city = city;
	}
	
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getNumberPhone() {
		return numberPhone;
	}
	public void setNumberPhone(String numberPhone) {
		this.numberPhone = numberPhone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}
	
}
