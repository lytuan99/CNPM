package com.devpro.beans;

import org.springframework.stereotype.Component;

/* dùng định nghĩa một bean thường*/
@Component 

//@Controller  /* dùng cho MVC */
//@Service    /* dùng cho tầng transaction */
//@Repository /* dùng cho module spring-boot-starter-data-jpa*/

public class Address {
	public String address1;
	public String address2;
	
	public Address() {
		this.address1 = "Hoài Đức";
		this.address2 = "Hà Nội";
	}
}
