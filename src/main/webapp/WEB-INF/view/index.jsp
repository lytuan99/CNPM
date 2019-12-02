<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="bán hàng giày dép nam nữ">
    <meta name="author" content="Ly Ba Tuan">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">


    <!-- =========== C S S  ==============-->
    <%@ include file="/WEB-INF/view/layout/include.jsp" %>
    
    
    <title>Shop thời trang nam</title>
</head>

<body>
    <!--------- H E A D E R ------------->

	<%@ include file="/WEB-INF/view/layout/header.jsp" %>
	
    <!---------- B O D Y ----------------->
    <h1 class="my-2"></h1>
    <div class="container-fluid">
        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
            <ul class="carousel-indicators">
                <li data-target="#slides" data-slide-to="0" class="active"></li>
                <li data-target="#slides" data-slide-to="1"></li>
                <li data-target="#slides" data-slide-to="2"></li>

            </ul>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block " src="image/banner-thoi-trang-the-thao-cho-nam_113858272.jpg" alt="First slide" width="100%" height="650">
                </div>
                <div class="carousel-item">
                    <img class="d-block" src="image/Soul_Space_Web_Banner_Male_All.webp" alt="Second slide"
                        width="100%" height="650">
                </div>
                <div class="carousel-item">
                    <img class="d-block" src="image/banner-thoi-trang-dang-hien-dai-nhat_113856210.jpg" alt="Third slide" width="100%" height="650">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>


        <h4 class="container text-center font-italic mt-4" style="font-family: Arial, Helvetica, sans-serif;
        												 text-shadow: 2px 2px 5px gray;">Sản Phẩm Nổi Bật</h4>
        												 
        <hr class="align-center"   style="margin-top: -10px; margin-bottom: 30px; background: black; max-width: 60%;">

        <div class="container-fluid">
			<div class="list_item">
				<c:forEach var="post" items="${_posts}">
					<a href="${pageContext.request.contextPath}/chi_tiet/${post.id}/${post.name}"
						class="item text-center ca_shadow"> <img class="image"
						src="${pageContext.request.contextPath}/files/${post.images_attachments.get(0).name}" alt="">
						<div class="card-title ">${post.name}</div>
						<p class="price">${post.giaFormat} đ</p>
					</a>
				</c:forEach>
			</div>
		</div>


    <!----------- F O O T E R ------------->
    <%@ include file="/WEB-INF/view/layout/footer.jsp" %>
</body>

</html>