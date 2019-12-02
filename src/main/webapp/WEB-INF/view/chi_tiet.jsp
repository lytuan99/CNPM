<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- tích hợp JSTL vào trong JSP -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<meta property="fb:app_id" content="App ID" />
<meta property="fb:admins" content="USER ID"/>

<!-- =========== C S S  ==============-->
<%@ include file="/WEB-INF/view/layout/include.jsp"%>
<!-- =========== J S  ==============-->

<title>Áo khoác jean</title>
</head>
<body>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v5.0"></script>


	<div class="container-fluid mt-4">
		<div class="row">
			<div class="col-lg-9 col-sm-12 ml-5">
				<div class="row">
					<div class="col-lg-4">
						<div class="card tab-content" style="width: 25rem;">
							<div class="tab-pane card-img-top my_image active show"
								id="pic-1">
								<img
									src="${pageContent.request.contextPath}/files/${post_product.images_attachments.get(0).name}"
									width="100%">
							</div>




							<div class="tab-pane card-img-top my_image" id="pic-2">
								<img src="${pageContent.request.contextPath}/files/${post_product.images_attachments.get(1).name}" width="100%">
							</div>
							<div class="tab-pane card-img-top my_image" id="pic-3">
								<img src="${pageContent.request.contextPath}/files/${post_product.images_attachments.get(2).name}" width="100%">
							</div>
							<div class="tab-pane card-img-top my_image" id="pic-4">
								<img src="${pageContent.request.contextPath}/files/${post_product.images_attachments.get(3).name}" width="100%">
							</div>
							<div class="tab-pane card-img-top my_image" id="pic-5">
								<img src="${pageContent.request.contextPath}/files/${post_product.images_attachments.get(4).name}" width="100%">
							</div>
							<div class="card-body">
								<ul class="nav list-unstyled d-inline ml-3">

									<li class="d-inline"><a data-toggle="tab" href="#pic-2"
										data-target="#pic-2" data-toggle="tab-pane"><img
											src="${pageContent.request.contextPath}/files/${post_product.images_attachments.get(1).name}" 
											style="width: 5rem;"></a></li>

									<li class="d-inline"><a data-toggle="tab" href="#pic-3"
										data-target="#pic-3" data-toggle="tab-pane"><img
											src="${pageContent.request.contextPath}/files/${post_product.images_attachments.get(2).name}" alt=""
											style="width: 5rem;"></a></li>

									<li class="d-inline"><a data-toggle="tab" href="#pic-4"
										data-target="#pic-4" data-toggle="tab-pane"><img
											src="${pageContent.request.contextPath}/files/${post_product.images_attachments.get(3).name}" alt=""
											style="width: 5rem;"></a></li>

									<li class="d-inline"><a data-toggle="tab" href="#pic-5"
										data-target="#pic-5" data-toggle="tab-pane"><img
											src="${pageContent.request.contextPath}/files/${post_product.images_attachments.get(4).name}" alt=""
											style="width: 5rem;"></a></li>
								</ul>

							</div>
						</div>
					</div>
					<div class="col-md-1"></div>
					<div class="col-md-6">
						<h5 style="margin: auto; font-weight: bold;">
							${post_product.name}</h5>
						<div>
							<button type="button"
								class="button_fb glyphicon glyphicon-thumbs-up">&nbsp;&nbsp;Thích</button>
							<button type="button" class="button_fb">Chia sẻ</button>
							<p style="font-size: 12px;">Hãy là người đầu tiên trong số
								bạn bè của bạn thích nội dung này.</p>
						</div>
						<p class="price" style="font-size: 35px;">${post_product.giaFormat}đ</p>

						<hr style="color: #cc0001;">
						<div>
							<p class="">
								tình trạng:<i> ${post_product.trangThai}</i>
							</p>
							<p class="">
								xuất sứ:<i> ${post_product.xuatSu}</i>
							</p>
							<p class="">
								kho:<i> ${post_product.kho}</i>
							</p>
							<p class="">
								kiểu dáng:<i>${post_product.kieuDang}</i>
							</p>
						</div>
						
						<div style="margin-top: 80px;">
							<a href="javascript:Blog.addToCart(${post_product.id});" class="btn text-white"
								style="background: #f18020; width: calc(40% - 5px); float: left; border-radius: 4px; padding: 14px 0 8px; border: 0px;">
								<p class="font-weight-bold glyphicon glyphicon-shopping-cart">
									&nbsp;Thêm vào giỏ</p>
								<p style="margin-top: -10px;">(tiếp tục mua hàng)</p>

							</a>
							
							<a href="/mua_ngay/${post_product.id }" type="button" class=" btn text-white"
								style="background: #cc0001; float: right; width: calc(60% - 5px); border-radius: 4px; padding: 10px 0 8px; border: 0px;">
								<p  class="font-weight-bold text-white">Mua ngay</p>
								<p style="margin-top: -10px;">(Nhận hàng thanh toán tại nhà)</p>
							</a>
						</div>
						
					</div>
				</div>
				<br> <br>
				<hr>
				${post_product.details}
				<!-- =================================đặt cái detail vào đây nhé=============================== -->

				<hr>

	<div class="fb-comments" data-href="http://localhost:8888/chi_tiet/16" data-width="100%" data-numposts="3"></div>
				
			</div>
			<%@ include file="/WEB-INF/view/layout/widget.jsp"%>
		</div>
	</div>

	<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

</body>
</html>