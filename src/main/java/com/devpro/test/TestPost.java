package com.devpro.test;

import java.util.LinkedList;

public class TestPost {

	private String imagePath;
	private String tittle;
	private String price;

	public TestPost(String imagePath, String tittle, String price) {
		super();
		this.imagePath = imagePath;
		this.tittle = tittle;
		this.price = price;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public String getTittle() {
		return tittle;
	}
	public void setTittle(String tittle) {
		this.tittle = tittle;
	}

	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
	public static LinkedList<TestPost> getPost(){
		
		LinkedList<TestPost> postsList = new LinkedList<TestPost>();
		
		postsList.add(new TestPost("image/AO_khoac_bo_nam_tinh.jpg", "Áo Khoác Bò Nam Tính KH300", "550.000đ"));
		
		postsList.add(new TestPost("image/AO_khoac_bo_nam_tinh.jpg", "Áo Khoác Bò Nam Tính KH310", "550.000đ"));
		
		postsList.add(new TestPost("image/AO_khoac_bo_nam_tinh.jpg", "Áo Khoác Bò Nam Tính KH320", "550.000đ"));
		
		postsList.add(new TestPost("image/AO_khoac_bo_nam_tinh.jpg", "Áo Khoác Bò Nam Tính KH330", "550.000đ"));
		
		return postsList;

		
	}
	
	
}
