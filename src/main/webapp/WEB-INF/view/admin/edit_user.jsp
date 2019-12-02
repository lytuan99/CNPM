<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
	<!-- sử dụng taglibs của spring để bind-data từ end-point trả về. -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- tích hợp JSTL vào trong JSP -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="edit">
<meta name="author" content="Ly Ba Tuan">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<!-- =========== C S S  ==============-->
<%@ include file="/WEB-INF/view/layout/include.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/dang_ky.css">
<!-- =========== J S  ==============-->

<title>Edit user</title>
</head>
<body style="font-family: Verdana, sans-serif; font-size: 13px; line-height: 1.5;">
	<%@ include file="/WEB-INF/view/layout/admin/header_ad.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-8">
				<form:form modelAttribute="user" action="/admin/edit-user" class="mt-5 ml-5">
					<form:hidden path="id" />     <!-- dòng này sẽ update bản ghi sau khi chỉnh sửa xong -->
					<div class="container bg-light">
						<h1>Edit</h1>
						<p>Điền đầy đủ thông tin vào các ô dưới đây.</p>
						<hr>

						<label for="text"><b>Full Name</b></label>
                        <form:input path="fullName" type="text" placeholder="Enter Name"/>

                        <label for="text"><b>City</b></label>
                        <form:input path="city" type="text" placeholder="Enter city"/>
                        
                        <label for="text"><b>Mobile</b></label>
                        <form:input path="numberPhone" type="text" placeholder="Enter number" />

                        <label for="email"><b>Email</b></label>
                        <form:input path="email" type="text" placeholder="Enter Email" />
                        
                        <label for="text"><b>Account name</b></label>
                        <form:input path="account" type="text" placeholder="Enter number" />

						<label for="psw"><b>Password</b></label>
                        <form:input path="password" type="password" placeholder="Enter Password" name="psw" />
                        <hr>
						<button type="submit" class="btn btn-primary btn_edit">
							<i class="glyphicon glyphicon-floppy-save"></i>&nbsp;Update
						</button>
						<a href="/admin/list-user" class="btn btn-info btn_edit"><i
							class="glyphicon glyphicon-hand-left"></i>&nbsp;Back</a>
					</div>
				</form:form>
			</div>
			
		</div>
	</div>
			
			<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
</body>
</html>