package com.devpro.entities;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "post_product_detail")
public class Post_Product_detail extends BaseEntity {

	@Column(name = "name", length = 45, nullable = false)
	private String name;
	
	@Column(name = "trang_thai", length = 45, nullable = true)
	private String trangThai;
	
	@Column(name = "xuat_xu", length = 45, nullable = true)
	private String xuatSu;
	
	@Column(name = "kho", length = 45, nullable = true)
	private String kho;
	
	@Column(name = "kieu_dang", length = 45, nullable = true)
	private String kieuDang;
	
	@Column(name = "gia", nullable = false)
	private BigDecimal gia;
	
	@Column(name = "giaFormat", nullable = true)
	private String giaFormat;
	
	
	
	@Lob
	@Column(name = "details", nullable = false, columnDefinition = "text")
	private String details;
	
	@Column(name = "create_date", nullable = false)
	private Date createdDate;
	
	@ManyToOne(fetch = FetchType.EAGER)   //eager là lấy toàn bộ dữ liệu trong quan hệ 1 -- nhiều
	@JoinColumn(name = "id_category")
	private Category category;   
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "post_Product_detail", fetch = FetchType.LAZY)        //lazy không lấy ngay tất cả dữ liệu có liên kết khóa ngoài với bảng này
	private List<Images_attachment> images_attachments = new ArrayList<Images_attachment>();
	
//	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
//	@JoinTable(name = "product_order",
//			joinColumns = @JoinColumn(name = "id_customer"),
//			inverseJoinColumns = @JoinColumn(name = "id_product"))
//	
//	private List<SignUp> customers = new ArrayList<SignUp>();
//	
//
//	public List<SignUp> getCustomers() {
//		return customers;
//	}
//
//	public void setCustomers(List<SignUp> customers) {
//		this.customers = customers;
//	}

	
	public void addImages_attachment(Images_attachment images_attachment) {
		images_attachments.add(images_attachment);
		images_attachment.setPost_Product_detail(this);
	}
	
	

	public void removeImages_attachment(Images_attachment images_attachment) {
		images_attachments.remove(images_attachment);
		images_attachment.setPost_Product_detail(null);
	}

	public List<Images_attachment> getImages_attachments() {
		return images_attachments;
	}

	public void setImages_attachments(List<Images_attachment> images_attachments) {
		this.images_attachments = images_attachments;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	
	
	public Post_Product_detail() {
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTrangThai() {
		return trangThai;
	}

	public void setTrangThai(String trangThai) {
		this.trangThai = trangThai;
	}

	public String getXuatSu() {
		return xuatSu;
	}

	public void setXuatSu(String xuatSu) {
		this.xuatSu = xuatSu;
	}

	public String getKho() {
		return kho;
	}

	public void setKho(String kho) {
		this.kho = kho;
	}

	public String getKieuDang() {
		return kieuDang;
	}

	public void setKieuDang(String kieuDang) {
		this.kieuDang = kieuDang;
	}

	public BigDecimal getGia() {
		return gia;
	}

	public void setGia(BigDecimal gia) {
		this.gia = gia;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getGiaFormat() {
		return giaFormat;
	}

	public void setGiaFormat() {
		this.giaFormat = CartUtil.formatPrice(gia);
	}

	
	
	
	
}
