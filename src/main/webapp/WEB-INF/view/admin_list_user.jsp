<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="bán hàng giày dép nam nữ">
<meta name="author" content="Ly Ba Tuan">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<!-- =========== C S S  ==============-->
<%@ include file="/WEB-INF/view/layout/include.jsp"%>
<!-- =========== J S  ==============-->

<title>admin/list_user</title>
</head>
<body>
<%@include file="/WEB-INF/view/layout/admin/header_ad.jsp" %>

<div class="table-responsive">
            <table class="table table-bordered table-striped table-condensed">
                <thead class="thead-light">
                    <tr>
                        <th>FullName</th>   <!-- dùng để xác định một ô (tiêu đề) bên trong hàng-->
                        <th style="width:20%;">Email</th>
                        <th>Mobile</th>
                        <th>Account</th>
                        <th style="width:15%;">Password</th>
                        <th style="width:18%;">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="contact" items="${contacts }">
                        <tr>   <!-- thẻ này xác định một hàng bên trong bảng-->
                            <td></td>     <!-- thẻ này xác định một ô bên trong bảng-->
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td style="text-align: center;">
                                <a href="" class="btn btn-success btn_edit">
                                    <span class="glyphicon glyphicon-edit"></span> Edit
                                </a>
                                &nbsp;
                                <a href="#" class="btn btn-danger btn_edit">
                                    <span class="glyphicon glyphicon-remove"></span> Delete
                                </a>
                            </td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
        </div>


<%@include file="/WEB-INF/view/layout/footer.jsp" %>

</body>
</html>