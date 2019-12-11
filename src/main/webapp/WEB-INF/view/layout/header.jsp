<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 

<nav
	class=" navbar navbar-expand-lg navbar-light bg-light sticky-top navbar-shadow">
	<div class="col-sm-1">
	<sec:authorize access="hasRole('ADMIN')">
					<a class="btn btn-danger btn_edit" href="/admin/list-user"
						style="width: 52px;">ADMIN</a>
				</sec:authorize>
	</div>
	<a class="navbar-brand" href="/"> <img
		src="${pageContent.request.contextPath}/image/Untitled.png"
		class="rounded-circle _shadow" alt="" width="160">
	</a>
	<div class="col-sm-1"></div>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="/">Trang
					chủ<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> Bộ sưu tập </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="/category/'Best seller'">Mùa hè sôi động</a> <a
						class="dropdown-item" href="/category/'Best seller'">Tuổi trẻ sục sôi</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="/category/'Bộ sưu tập mùa đông'">Mùa đông ấm áp</a>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> Quần Áo </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="/category/'Quần jean'">Quần</a> <a
						class="dropdown-item" href="/category/'Áo sơ mi'">Áo sơ mi</a> <a
						class="dropdown-item" href="/category/'Áo thun'">Áo Thun</a>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> Giày </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="/category/'Giày tây'">Giày Tây</a> <a
						class="dropdown-item" href="/category/'Sports'">Sport</a> <a
						class="dropdown-item" href="/category/'Sneaker & Athletic'">Sneaker & Athletic</a>
				</div></li>

			<li class="nav-item"><a class="nav-link" href="/cua_hang">
					Cửa Hàng <span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="/memberShip">
					memberShip<span class="sr-only">(current)</span>
			</a></li>
		</ul>

		<span class="col-md-1" id="icon"> <a href="/gio_hang"
			class="icon glyphicon glyphicon-shopping-cart" id="card_shopping"
			title="giỏ hàng">&nbsp;&nbsp;&nbsp;&nbsp;</a> <a href=""
			class="icon glyphicon glyphicon-user" id="user" title="tài khoản"
			data-target="#modalRegisterForm" data-toggle="modal"></a>
		</span>

		<!-- R E G I S T E R -->
<div class="modal fade" id="modalRegisterForm">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header text-white text-center bg-dark">
				<h4 class="modal-title w-100 font-weight-bold">Login</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="document.getElementById('frmRegiterForm').reset();">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body mx-3">
				<form role="form" method="POST" action="/perform_login" id="frmRegiterForm">
					<input type="hidden" name="_token" value="" />
					<div class="form-group">
						<label class="control-labe required">Account</label>
						<input type="text"class="form-control input-lg" name="uname" value="" />
					</div>
					<div class="form-group">
						<label class="control-label required">Password</label>
						<input type="password" class="form-control input-lg" name="psw" />
					</div>
					
				</form>
			</div>
			<div class="modal-footer d-flex justify-content-center">
				<div class="form-group">
					<div>
						<button type="submit" class="btn btn-danger" style="width:100px; margin: -23px 332px -38px -1px;">
							<i class="glyphicon glyphicon-floppy-save"></i> Login
						</button>
					</div>
				</div>
			</div>
			<div class="container" style="background-color:#f1f1f1">

                        <span class="psw">Don't have an account <a class="psw2" href="/signUp"
                                style="color: red;">Register now!</a></span><br>
                        <span class="psw">Forgot <a class="psw2" href="#">password?</a></span>
                    </div>
		</div>
	</div>
</div>

		<form method="post" action="/searchProduct" class="form-inline my-2 my-lg-0">
			<input name="search" class="form-control mr-2" type="text" placeholder="Search"
				aria-label="search"> 
			<button class="btn btn-outline-secondary my-2 my-0" type="submit">Search</button>
		</form>
	</div>
</nav>


