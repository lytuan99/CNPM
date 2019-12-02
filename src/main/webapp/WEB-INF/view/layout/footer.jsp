<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- tích hợp JSTL vào trong JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!-- D E L E T E -->
<div class="modal fade" tabindex="-1" role="dialog" id="modalDeleteForm">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Xoá dữ liệu</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p>Bạn có chắc chắn muốn xoá dữ liệu không ?</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="deleteOk">Có</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Không</button>
			</div>
		</div>
	</div>
</div>
<div id="myBtn" title="Go to top">
	<button class="btn btn-secondary bg-dark glyphicon glyphicon-menu-up"></button>
</div>
<div id="footer">
	<h1 class="my-5"></h1>
	<div class="container-fluid bg-dark text-white">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-3" style="margin-top: 10px;">
				<p style="font-size: 15px;">ĐĂNG KÝ NHẬN TƯ VẤN VÀ KHUYẾN MÃI</p>
				<div class="form-inline">
					<input type="email" class="form-control" name="" id=""
						aria-describedby="emailHelpId" placeholder="Nhập email của bạn...">
					<a href="#" class="btn btn-danger glyphicon glyphicon-hand-right">
						<i class="" style="font-family: sans-serif; font-size: 8px;">
							NOW </i>

					</a>
				</div>

				<div>
					<p>CÔNG TY CỔ PHẦN ĐẦU TƯ T&T VIỆT NAM</p>
					<br>
					<p>Địa chỉ: Tầng 11, khối A, tòa nhà Sông Đà, đường Phạm Hùng,
						P. Mỹ Đình 1, Q. Nam Từ Liêm, TP. Hà Nội, Việt Nam</p>
				</div>
			</div>

			<div class="col-md-3" style="margin-top: 10px;">
				<p style="font-size: 15px;">CHÍNH SÁCH BÁN HÀNG</p>
				<ul class="list-unstyled">
					<li class="nav-item"><a class="a" href="">HƯỚNG DẪN MUA
							HÀNG</a></li>
					<li class="nav-item"><a class="a" href="">CHÍNH SÁCH GIAO
							NHẬN</a></li>
					<li class="nav-item"><a class="a" href="">CHÍNH SÁCH ĐỔI
							HÀNG</a></li>
					<li class="nav-item"><a class="a" href="">CHÍNH SÁCH BẢO
							HÀNH</a></li>
					<li class="nav-item"><a class="a" href="">BẢO MẬT THÔNG
							TIN KHÁCH HÀNG</a></li>
				</ul>
			</div>

			<div class="col-md-3 ">
				<p style="font-size: 15px; margin-top: 10px;">TƯ VẤN</p>
				<ul class="list-unstyled">
					<li><a class="a" href="#!">TƯ VẤN PHONG CÁCH</a></li>
					<li><a class="a" href="#!">TƯ VẤN CHỌN SIZE</a></li>
					<li><a class="a" href="#!">HỎI ĐÁP</a></li>
				</ul>
			</div>
			<div class="col-md-1 text-center " style="">
				<h5 style="font-size: 15px; margin-top: 10px; margin-left: -94px;">KẾT
					NỐI VỚI CHÚNG TÔI</h5>
				<div class="d-flex flex-row justify-content-center text-white mr-5">
					<div class="p-4">
						<a href="https://www.facebook.com/lytuan99"> <i id="fb"
							class="fa fa-facebook text-white"></i>
						</a>
					</div>
					<div class="p-4">
						<a href="https://www.facebook.com/lytuan99"> <i id="istg"
							class="fa fa-instagram text-white"></i>
						</a>
					</div>
					<div class="p-4">
						<a href="https://www.facebook.com/lytuan99"> <i id="ggpl"
							class="fa fa-google-plus text-white"></i>
						</a>
					</div>
					<div class="p-4">
						<a href="https://www.facebook.com/lytuan99"> <i id="tt"
							class="fa fa-twitter text-white"></i>
						</a>
					</div>
				</div>


				

			</div>
		</div>
	</div>
</div>

