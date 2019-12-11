<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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

<title>List Products</title>
</head>
<body style="font-family: Verdana, sans-serif; font-size: 13px; line-height: 1.5;">

	<%@ include file="/WEB-INF/view/layout/admin/header_ad.jsp"%>
    <div class="container mt-5 list_user">
        <div class="title_list">
            <h5 class="text-center text-danger">Danh sách sản phẩm</h5>
        </div>

        <div class="table-responsive">
            <table id="myTable" class="table table-bordered table-striped ">

					<tr>
                        <th></th>   <!-- dùng để xác định một ô (tiêu đề) bên trong hàng-->
                        <th><input type="text" class="form-control myInput_filter" placeholder="Tên sản phẩm" onkeyup="myFunctionProduct('1','1')" id="1"></th>
                        <th><input  type="text" class="form-control myInput_filter" placeholder="Trạng thái" onkeyup="myFunctionProduct('2','2')" id="2"></th>
                        <th><input  type="text" class="form-control myInput_filter" placeholder="Kho" onkeyup="myFunctionProduct('3','3')" id="3"></th>
                        <th ><input  type="text" class="form-control myInput_filter" placeholder="Giá" onkeyup="myFunctionProduct('4','4')" id="4"></th>
                        <th class="text-center"><span class="glyphicon glyphicon-arrow-left btn btn-dark text-white align-middle">Filter</span></th>
                    </tr>
                    <tr>
                        <th class="text-center">Ảnh chính</th>   <!-- dùng để xác định một ô (tiêu đề) bên trong hàng-->
                        <th class="text-center" >Tên SP</th>
                        <th class="text-center">Trạng Thái</th>
                        <th class="text-center">Kho</th>
                        <th class="text-center">Giá</th>
                        <th style="width:30%; text-align:center;">action</th>
                    </tr>


                    <c:forEach var="product" items="${products }">
                        <tr>   <!-- thẻ này xác định một hàng bên trong bảng-->
                            <td><img src="${pageContent.request.contextPath}/files/${product.images_attachments.get(0).name}" alt="" style="width:10rem;"></td>     <!-- thẻ này xác định một ô bên trong bảng-->
                            <td class="align-middle">${product.name }</td>
                            <td class="align-middle">${product.trangThai }</td>
                            <td class="align-middle">${product.kho }</td>
                            <td class="align-middle">${product.gia}</td>
                            <td style="text-align: center;">
                                <a href="/admin/edit-product/${product.id}" class="btn btn-info btn_editP">
                                    <span class="glyphicon glyphicon-edit"></span> Edit
                                </a>
                               
                                <a href="javascript:void(0);" onclick="Blog.deleteForm('modalDeleteForm', ${product.id }, '/rest/api/product/delete')" class="btn btn-danger btn_editP">
                                    <span class="glyphicon glyphicon-remove"></span> Delete
                                </a>
                            </td>
                        </tr>
                    </c:forEach>


            </table>
        </div>
    </div>
    <%@ include file="/WEB-INF/view/layout/footer.jsp"%>

</body>

</html>