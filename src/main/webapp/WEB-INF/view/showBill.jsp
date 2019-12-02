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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/admin.css">

<title>Bill</title>
</head>
<body style="color: rgb(216, 20, 13);">
    <div id="bill" class="container-fluid mt-5" style="width:60%;" >
        <div class="row">
            <div class="col-md-6 text-center">
                <h5>Công ty</h5>

                <h4>CỔ PHẦN ĐẦU TƯ T&T VIỆT NAM</h4>
                <h6>Tầng 11, khối A,
                     tòa nhà Sông Đà, đường Phạm Hùng, P. Mỹ Đình 1,
                      Q. Nam Từ Liêm, TP. Hà Nội, Việt Nam</h6>
                   <span>${customer.createdDate }</span>
            </div>

            <div class="col-md-6 text-center mt-4">
                <h4>HÓA ĐƠN BÁN HÀNG</h4>
                <h4>__________ * __________</h4>
                <h5>thời trang & may mặc</h5>
                <h4>BOSS</h4>
            </div>
        </div>
        <hr>
        <div id="inforX">
            <span>Họ tên khách hàng:</span>
            <span class="content">${customer.hoTen }</span>
            <span id="dt">ĐT:  </span><span class="content">${customer.sdt }</span>
            <br>
            <span>Email:</span>
            <span class="content" >${customer.email }</span>
            <br>
            <span>Địa chỉ:</span>
            <span class="content" >${customer.dia_chi }</span>
            

            
        </div>
        
        <table class="table table-bordered table-striped table-condensed">
                <thead >
                    <tr>
                        
                        <th>Tên mặt hàng</th>   <!-- dùng để xác định một ô (tiêu đề) bên trong hàng-->
                        <th>số lượng</th>
                        <th>đơn giá</th>
                        <th style="width:15%;">thành tiền</th>
                        
                    </tr>
                </thead>
                <tbody> 
                <c:forEach var="item" items="${giohang }">
                
                		<tr>   <!-- thẻ này xác định một hàng bên trong bảng-->
                                 <!-- thẻ này xác định một ô bên trong bảng-->
                            <td>${item.productName }</td>
                            <td>${item.quantity }</td>
                            <td>${item.priceFormat }</td>
                            <td>${item.pay }</td>
                            
                        </tr>
                </c:forEach>                 
                        
                    
                </tbody>
                <thead >
                        <tr>
                            
                            <th> <p3>Tổng:</p3></th>   <!-- dùng để xác định một ô (tiêu đề) bên trong hàng-->
                            <th></th>
                            <th></th>
                            <th style="width:15%;">${_payment }</th>
                            
                        </tr>
                    </thead>
            </table>

            <div>
            
        </div>
        
    </div>
    
    <span>Quay Lại <span class="glyphicon glyphicon-hand-right text-danger"></span> </span>
    <span><a href="/">Trang chủ</a></span>
    
</body>
</html>