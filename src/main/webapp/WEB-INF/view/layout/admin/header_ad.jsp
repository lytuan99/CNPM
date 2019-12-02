<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
	
	<nav class=" navbar navbar-expand-lg navbar-light bg-light sticky-top navbar-shadow" style = "font-size:16px;">
	        <ul class="navbar-nav ">
	            <li class="nav-item active">
	                <a class="navbar-brand" href="/">
	                    <img src="${pageContext.request.contextPath}/image/Untitled.png" class="rounded-circle _shadow" alt="" width="100">
	                </a>
	            </li>
	            <li class="nav-item mt-3 ml-3">
	                <a class="nav-link" href="/admin/list-user">List users</a>
	            </li>
	            <li class="nav-item mt-3 ml-3">
	                <a class="nav-link" href="/admin/orders">List orders</a>
	            </li>

	            <li class="nav-item dropdown mt-3 ml-3">
	                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
	                    aria-haspopup="true" aria-expanded="false">
	                    Admin
	                </a>
	                <div class="dropdown-menu" aria-labelledby="navbarDropdown"
	                    style="    width: 155px; margin-top: -20px;    font-size: 13px;">
	                    <a class="dropdown-item" href="/admin/add-post-product">Post new product</a>
	                    <div class="dropdown-divider"></div>
	                    <a class="dropdown-item" href="/admin/list-product">All Product</a>
	                </div>
	            </li>
	            <li class="nav-item mt-3 ml-3">
	                <a class="nav-link text-danger" href="/logout">Logout</a>
	            </li>
	        </ul>
	    </nav>
