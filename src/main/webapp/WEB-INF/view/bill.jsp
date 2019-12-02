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
<meta name="description" content="danh sách người dùng">
<meta name="author" content="Ly Ba Tuan">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<!-- =========== C S S  ==============-->
<%@ include file="/WEB-INF/view/layout/include.jsp"%>
<!-- =========== J S  ==============-->

<title>thêm sản phẩm mới lên web</title>
</head>
<body>

 <div class="container-fluid">
        <div class="row">
            <div class="col-md-1"></div>
            
            <div class="col-md-4 mt-3">
            <div class="col-md-1"></div>
             <c:choose>
				<c:when test="${ status == 'success'}">
				
					<div class=" alert alert-success">
						<Strong>Success!</Strong>
					</div>
					<a href="/hoaDon" class="btn btn-success mb-4" style="width: auto;">Xem hóa đơn</a>
				</c:when>
				<c:when test="${ status == 'failed'}">
					<div class=" alert alert-danger">
						<Strong>Failed!</Strong>
					</div>
				</c:when>
				 
			</c:choose>
                <div class="d-block">
                <a href="/">
                <img id="boss" class="rounded-circle" src="image/Untitled.png" alt="">
                </a>
                    
                   
			
                </div>
                <div id="link_gio_hang">
                    <a href="/gio_hang">giỏ hàng</a><span>> thông tin giao hàng</span>
                </div>
                <h5 class="mt-2">Thông tin giao hàng</h5>
                    <form:form modelAttribute="hoanTat" action="/hoanTat" method="post">
                        <form:input path="hoTen" class="my_input form-control" type="text" id="Hoten" placeholder="Họ và tên"/>
                        <form:input path="sdt" class="my_input form-control" type="text" id="sdt" placeholder="Số điện thoại"/>
                        <form:input path="email" class="my_input form-control" type="text" id="email" placeholder="email"/>
                        <form:input path="dia_chi" class="my_input form-control" type="text" id="diachi" placeholder="Địa chỉ"/>
    					<button type="submit" class="btn bg-success mt-3 text-white" style="width:100%"> Hoàn tất</button>
                    </form:form>
    
    			
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-4 bg-light">
            <br style="margin-top:50px;">
            <c:forEach var="item" items="${giohang }">
            
            <div class="row">
                 <div class="col-md-2 mt-5">
                     <img src="${pageContent.request.contextPath}/files/${item.getProductImage().name}" alt="" style="width:60px;">
                 </div>
                 <div class="col-md-6 mt-5">
                     <p>${item.productName }</p>
                 </div>
                 <div class="col-md-4 mt-5">
                     <span>số lượng(${item.quantity }) &nbsp;</span>
                     <span>${item.priceFormat }đ</span>
                 </div>
    
             </div>
                <hr style="color: rgb(51, 48, 48);">
            </c:forEach>
                
    
                <form class="form-inline my-2 my-lg-0">
                    <input id="giamgia" class="form-control mr-2" type="text" placeholder="Mã giảm giá">
                    <button id="btn_giamgia" class="btn btn-outline-secondary my-2 my-0" type="submit">Mã giảm giá</button>
                </form>
    
                <hr style="color: rgb(51, 48, 48);">
    
                <p class="float-left">Tạm tính</p>
                <p class="float-right">${_payment }đ</p>
                <br>
                <br>
                <p class="float-left">Phí vận chuyển</p>
                <p class="float-right">__</p>
                <br>
                <hr style="color: rgb(51, 48, 48);">
                <br>
                <h5 class="float-left">Tổng cộng</h5>
                <h5 class="float-right"> ${_payment }đ</h5>
    
            </div>
            <div class="col-md-2 bg-light"></div>
        </div>
    </div>

</body>
</html>