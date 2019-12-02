<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="bán hàng giày dép nam nữ">
<meta name="author" content="Ly Ba Tuan">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Quần áo</title>
<!-- =========== C S S  ==============-->
<!-- =========== J S  ==============-->
<%@ include file="/WEB-INF/view/layout/include.jsp"%>

</head>
<body>
	<%@ include file="/WEB-INF/view/layout/header.jsp"%>

	<h4 class="container text-center font-bold my-3"
		style="text-shadow: 2px 2px 5px gray;">Quần áo</h4>
	<hr class="align-center"
		style="margin-top: -10px; margin-bottom: 30px; background: black; max-width: 60%;">

	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-9 ">
				<div class="container-fluid">
					<div class="list_item">

						<c:forEach var="ao" items="${quan_ao }">
							<div class="item ca_shadow">
								<a href="${pageContext.request.contextPath}/chi_tiet/${ao.id }/${ao.name}"
									class=" text-center "> <img class="image"
									src="${pageContext.request.contextPath}/files/${ao.images_attachments.get(0).name}"
									alt="">
									<div class="card-title">${ao.name }</div>
									<p class="card-text price mt-1">${ao.giaFormat }đ</p>
									 <a href="javascript:Blog.addToCart(${ao.id});" class="btn btn-danger glyphicon glyphicon-shopping-cart my_button"
																style="width: 155px; margin-left: 60px;">&nbsp;Add to cart</a>
								</a>
							</div>
						</c:forEach>

					</div>
				</div>
			</div>


			<%@ include file="/WEB-INF/view/layout/widget.jsp"%>
		</div>


		<div id="myBtn" title="Go to top">
			<button class="btn btn-secondary bg-dark glyphicon glyphicon-menu-up"></button>
		</div>
	</div>

	<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

</body>
</html>