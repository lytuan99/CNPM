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
<title>Login</title>

<%@ include file="/WEB-INF/view/layout/include.jsp"%>


<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/login.css">
<!-- =========== J S  ==============-->
</head>
<body class="bg-light">
    <div class="container text-center"></div>
    <h4> Đã đăng xuất!!</h4>
    <span> quay về trang chủ <span class="glyphicon glyphicon-hand-right text-danger"></span></span> <a href="/">Trang chủ</a>

</body>
</html>