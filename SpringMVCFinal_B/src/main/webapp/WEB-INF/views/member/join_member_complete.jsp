<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"></head>
</head>
<body>
<jsp:include page="../commons/global_nav.jsp"></jsp:include>

   <div class="container mt-5">
      <div class="row">
		<div class="col"></div>
		<div class="col-6">
			<div class="row mt-3">
				<div class="col text-center">
					<h1>Complete Join Us</h1>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col d-grid gap-2 d">
					<a class="btn btn-primary" href="${pageContext.request.contextPath }/member/login_page.do">로그인 페이지로..</a>
				</div>
			</div>
		</div>
		<div class="col"></div>
      </div>
   </div>




<!-- 
	<h1>Complete Join Us</h1>	
	<a href="${pageContext.request.contextPath }/member/login_page.do">로그인 페이지로..</a>
 -->
 
 
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>