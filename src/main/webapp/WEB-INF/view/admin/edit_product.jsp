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

<title>Edit product</title>
</head>
<body style="font-family: Verdana, sans-serif; font-size: 13px; line-height: 1.5;">

	<%@ include file="/WEB-INF/view/layout/admin/header_ad.jsp"%>
	
	<div id="main" class="container">
			<h1 class="mt-2"></h1>
			
			<div class="row">
				<div class="col-md-12" style="padding: 5px;">

					<div class="card">
						<div class="card-header">Edit sản phẩm</div>
						<div class="card-body">
							<div class="panel-body">
								<!-- đây là cách dùng bind-data của spring. -->
								<!-- hỏi thầy enctype để làm gì ==================================================================================== -->
								<form:form modelAttribute="product" action="/admin/edit-product" enctype="multipart/form-data">
									<form:hidden path="id"/>           <!-- id của category -->
									<div class="form-group">
										<label for="txtInput">Category</label>
										<form:select class="form-control" path="category.id">
										<!-- options là đẻ hiển thị các bản ghi của bảng category trong database -->
											<form:options items="${categories}" itemValue="id" itemLabel="name"/>  
									</form:select>      <!-- select này  -->
									</div>
									<div class="form-group">
										<label class="required">Tên sản phẩm</label> 
										<form:input path="name" class="form-control" /> 
                                    </div>
                                    <div class="form-group">
										<label class="required">Giá</label> 
										<form:input path="gia" class="form-control" /> 
									</div>
									<div class="form-group">
										<label >Trạng thái</label> 
										<form:input path="trangThai" class="form-control" /> 
                                    </div>
                                    <div class="form-group">
										<label >Kho</label> 
										<form:input path="kho" class="form-control" /> 
                                    </div>
                                    <div class="form-group">
										<label >Xuất sứ</label> 
										<form:input path="xuatSu" class="form-control" /> 
                                    </div>
                                    <div class="form-group">
										<label >Kiểu dáng</label> 
										<form:input path="kieuDang" class="form-control" /> 
									</div>
                                    

									<div class="form-group">
										<label class="required">Details</label> 
										<form:textarea path="details" rows="10" cssClass="my-summernote" id="my-summernote"></form:textarea> 
									</div>
									<div class="form-group">
										<label>Attachment image0</label>
                                        <input type="file" name="postImage" multiple="multiple"/>
									</div>
									<!-- bấm save 1 phát là sẽ nhảy lên action đầu form vào thực hiện các lệnh trong PostController -->
									<button type="submit" class="btn btn-primary btn_edit"><i class="glyphicon glyphicon-floppy-save"></i>&nbsp;Save</button>
								</form:form>
						  	</div>
						</div>
					</div>

					
				</div>
				
			</div>
		
			<h1 class="my-2"></h1>
		</div>
	
	<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
</body>
</html>