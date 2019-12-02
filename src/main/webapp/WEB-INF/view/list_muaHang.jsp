<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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

<title>List Users</title>
</head>
<body
	style="font-family: Verdana, sans-serif; font-size: 13px; line-height: 1.5;">

	<%@ include file="/WEB-INF/view/layout/admin/header_ad.jsp"%>


	<div class="container mt-5 list_user">
		<div class="panel panel-success filterable">
			<div class="panel-heading ">
				<h5 class="panel-title d-inline">danh sách đơn hàng</h5>
			</div>

			<div class="table-responsive">
				<table id="myTable" class="table  table-striped ">

					<tr>
                        <th><input type="text" class="form-control myInput_filter" placeholder="fullName" onkeyup="myFunctionProduct('0','1')" id="1"></th>   <!-- dùng để xác định một ô (tiêu đề) bên trong hàng-->
                        <th style="width:20%;"><input  type="text" class="form-control myInput_filter" placeholder="Email" onkeyup="myFunctionProduct('1','2')" id="2"></th>
                        <th><input  type="text" class="form-control myInput_filter" placeholder="Mobile" onkeyup="myFunctionProduct('2','3')" id="3"></th>
                        <th><input  type="text" class="form-control myInput_filter" placeholder="Account" onkeyup="myFunctionProduct('3','4')" id="4"></th>

                        <th style="width:18%; text-align: center;"><span class="glyphicon glyphicon-arrow-left btn btn-dark text-white">Filter</span> </th>
                    </tr>

						<tr>
							<th>Họ tên</th>
							<th style="width: 20%;">SDT</th>
							<th>Địa chỉ</th>
							<th>ngày tạo đơn</th>
							<th style="text-align: center;">trạng thái thanh toán</th>

						</tr >

					
						<c:forEach var="user" items="${customers }">
							<tr>
								<!-- thẻ này xác định một hàng bên trong bảng-->
								<td>${user.hoTen }</td>
								<!-- thẻ này xác định một ô bên trong bảng-->
								<td>${user.sdt }</td>
								<td>${user.dia_chi }</td>
								<td>${user.createdDate }</td>
								<td style="text-align: center;">
									<form action="">
									  
									  <input type="checkbox" name="check" value="Boat" checked><br>
									</form>
								</td>
							</tr>
						</c:forEach>

				</table>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/view/layout/footer.jsp"%>



</body>

</html>