package com.devpro.entities;


import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "category")
public class Category extends BaseEntity {
	
	@Column(name = "name", length = 10, nullable = false)
	private String name;
	
	
	// 1 catecory có nhiều product_detail
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "category", fetch = FetchType.LAZY)
	private List<Post_Product_detail> products = new ArrayList<Post_Product_detail>();
	
	/* khi định nghĩa one-to-many bổ sung 2 methods. */
	
	public void addProduct(Post_Product_detail product) {
		products.add(product);
		product.setCategory(this);
	}
	public void removePost(Post_Product_detail product) {
		products.remove(product);
		product.setCategory(null);;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
