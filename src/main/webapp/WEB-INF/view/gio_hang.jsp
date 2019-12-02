<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<!-- tích hợp JSTL vào trong JSP -->
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="bán hàng giày dép nam nữ, giỏ hàng">
<meta name="author" content="Ly Ba Tuan">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<!-- =========== C S S  ==============-->
<%@ include file="/WEB-INF/view/layout/include.jsp"%>
<!-- =========== J S  ==============-->

<title>Giỏ hàng</title>
</head>
<body id="body_gio_hang">
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<div class="container mt-5" style="font-family: Roboto,Arial,Helvetica,sans-serif;">
        <h5 class="d-inline ">Giỏ hàng </h5>
        
        <p class="d-inline text-muted">(${_tongSP }&nbsp;sản phẩm)</p>
        <br>
        <a href="/" class="btn btn-warning text-danger" style="width:170px;">Tiếp tục mua hàng</a>
        <div class="row my-3 ">
            <div class="col-md-8 mr-3  position-relative" style="background-color: white;">
                <div class="row py-3">
                
                <c:forEach var="item" items="${giohang }">
                	<div class="col-sm-3 mb-5">
                        <img class="" src="${pageContent.request.contextPath}/files/${item.getProductImage().name}" alt="" style="width:7rem;">
                    </div>
                    <div class="col-sm-4 mr-0">
                        <p>${item.productName }</p>
                        <a id="deleteP" href="${pageContext.request.contextPath }/cart/delete/${item.productID }">Xóa</a>
                        <a href="">để dành mua sau</a>
                    </div>
                    <div class="col-sm-1 "></div>
                    <div class="col-sm-2" style="color:red;">${item.priceFormat }đ</div>
                    <div class="col-sm-2">
                        <form  class="quantity">
					      <button class="button_as plus-btn" type="submit">
					        +
					      </button>
					      <input class=" d-inline bg-white" type="text" value="${item.quantity } " />
					      <button class="button_as minus-btn " type="submit">
					        -
					      </button>
					    </div>
                    </form>
                
                </c:forEach>
                    
                </div>

            </div>
            <div class="col-md-3" style="background-color: white;">

                <div class="mt-3">
                    <span class="float-left text-muted">Tạm tính:</span>
                 <span class="float-right">${_payment }đ</span>
                 <br>
                 <hr>
                </div>
                <div>
                    <span class="float-left text-muted">Thành tiền: </span>
                    <h5 class="float-right text-danger">${_payment }đ</h5>
                    <p class="float-right text-muted" style="margin-left: 30px; font-size:15px;">(đã bao gồm thuế VAT)</p>
                </div>
                <br>
                
                <a href="/bill" class="btn btn-danger my-button mt-5" style="width:100%;">Đặt hàng</a>
            </div>
        </div>
    </div>

	<div>
	<br>
	<br>
	<br>
	</div>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

</body>
</html>