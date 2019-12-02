package com.devpro.entities;


/**
 * class này biểu diễn JSON trả về người dùng từ RestAPI.
 * 
 * {
 * 		status: [success, failed],
 * 		message: " "
 * }
 * @author lytuan
 * 
 * 
 * */
public class RestResponse {
	
	private String status;
	private String message;
	
	
	/**
	 * 
	 * */
	private RestResponse() {
		
	}
	
	public static RestResponse success(String message) {
		RestResponse response = new RestResponse();
		response.setMessage(message);
		response.setStatus("success");
		return response;
	}
	
	public static RestResponse failed(String message) {
		RestResponse response = new RestResponse();
		response.setMessage(message);
		response.setStatus("failed");
		return response;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	
}
