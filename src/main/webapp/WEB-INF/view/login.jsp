<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- sử dụng taglibs của spring để bind-data từ end-point trả về. -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="bán hàng giày dép nam nữ">
<meta name="author" content="Ly Ba Tuan">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Login Admin</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/login.css">
<!-- =========== J S  ==============-->
</head>
<body class="bg-dark">
    
    
  
        <form class="modal-content" action="/perform_login" method="post">
          <div class="imgcontainer">
           
            <img src="image/account.png" alt="Avatar" class="avatar">
          </div>
				
					  
     <!-- /login?error=true -->
     <c:if test="${param.error == 'true'}">
         <div style="color:red">
               <div class=" alert alert-danger" >
					<Strong>Error</Strong><br>
					${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
				</div>           
         </div>
    </c:if>				 
			
          <div class="container">
            <label for="uname"><b>Username</b></label>
            <input type="text" placeholder="Enter Username" name="uname" >
      
            <label for="psw"><b>Password</b></label>
            <input type="password" placeholder="Enter Password" name="psw"  >
              
            <button type="submit" >Login</button>
            <label>
              <input type="checkbox" checked="checked" name="remember"> Remember me
            </label>
          </div>
      
          <div class="container" style="background-color:#f1f1f1">
            
            <span class="psw">Forgot <a href="#">password?</a></span>
          </div>
        </form>

</body>
</html>