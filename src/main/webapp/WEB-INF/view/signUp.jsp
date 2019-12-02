<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- sử dụng taglibs của spring để bind-data từ end-point trả về. -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="bán hàng giày dép nam nữ">
<meta name="author" content="Ly Ba Tuan">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Đăng ký tài khoản</title>

<!-- =========== C S S  ==============-->
	<%@ include file="/WEB-INF/view/layout/include.jsp"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/dang_ky.css">
<!-- =========== J S  ==============-->
</head>
<body>
	<%@ include file="/WEB-INF/view/layout/header.jsp"%>
	<!-- thông báo tới người dùng -->
	
		<c:choose>
				<c:when test="${ status == 'success'}">
				
					<div class=" alert alert-success">
						<Strong>Success!</Strong>
					</div>
				</c:when>
				<c:when test="${ status == 'failed'}">
					<div class=" alert alert-danger">
						<Strong>Failed!</Strong>
					</div>
				</c:when>
				 
			</c:choose>

<div class="container-fluid mt-5" style="background:white;">
        <div class="row">
            <div class="col-lg-8 ">
                <form:form modelAttribute="signUp" action="/signUp" class="ml-5">
                    <div class="container bg-light">
                        <h1>Đăng ký</h1>
                        <p>Điền đầy đủ thông tin vào các ô dưới đây.</p>
                        <hr>

                        <label for="text"><b>Full Name</b></label>
                        <form:input path="fullName" type="text" placeholder="Enter Name" name="name" />

                        <label for="text"><b>City</b></label>
                        <form:input path="city" type="text" placeholder="Enter city" name="city" />
                        
                        <label for="text"><b>Mobile</b></label>
                        <form:input path="numberPhone" type="text" placeholder="Enter number" name="number" />

                        <label for="email"><b>Email</b></label>
                        <form:input path="email" type="text" placeholder="Enter Email" name="email" />
                        
                        <label for="text"><b>Account name</b></label>
                        <form:input path="account" type="text" placeholder="Enter number" name="number" />

                        <label for="psw"><b>Password</b></label>
                        <form:input path="password" type="password" placeholder="Enter Password" name="psw" />

                        <label for="psw-repeat"><b>Repeat Password</b></label>
                        <input type="password" placeholder="Repeat Password" name="psw-repeat"/>
                        <hr>
                        <p>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>

                        <button type="submit" class="registerbtn">Register</button>
                    </div>

                    <div class="container signin">
                        <p>Already have an account? <a data-target="#Mymodal" href=""
                        data-toggle="modal" onclick="document.getElementById('id01').style.display='block'">Sign in</a>.</p>
                    </div>
                </form:form>

            </div>
            <div class="col-lg-1"></div>
             <%@ include file="/WEB-INF/view/layout/widget.jsp"%>
        </div>
    </div>
		<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
</body>
</html>