package com.devpro.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "images_attachment")
public class Images_attachment extends  BaseEntity{

	@Column(name = "name", length = 500, nullable = false)
	private String name;

	@Column(name = "path", length = 500, nullable = false)
	private String path;

	@Column(name = "mime", length = 45, nullable = false)
	private String mime;

	@ManyToOne(fetch = FetchType.EAGER)					//eager là lấy toàn bộ dữ liệu trong quan hệ nhiều---1  (tức là trong bảng images_att  sẽ có nhiều cái id của post_product_detail)
	@JoinColumn(name = "id_post_product_detail")      // tên cột chứa khóa ngoai của bảng images_attachment
	private Post_Product_detail post_Product_detail;      // đây chính là tên mappedBy ở bên OneToMany của Post_Product_detail

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getMime() {
		return mime;
	}

	public void setMime(String mime) {
		this.mime = mime;
	}

	public Post_Product_detail getPost_Product_detail() {
		return post_Product_detail;
	}

	public void setPost_Product_detail(Post_Product_detail post_Product_detail) {
		this.post_Product_detail = post_Product_detail;
	}

	
}
