<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"></head>
<body>

	<!-- 부트스트랩 레이아웃 잡는 원칙
		1.항상  row로 시작한다.(행을 먼저 잡는다 위 아래)
		2.row 안에 row 를 넣지 않는다 .(row - col - row - col)
		3.col 안에 col 을 넣지 않는다.
		4.내용(컨텐트)는 항상  col 안에 넣는다.
		5.레이아웃은 대충 잡지 않는다 (빡빡하게 잡아야한다)
	 -->

	<!--
		부트스트랩 GRID
		세로로 12등분 되어잇다. col 12등분		
	 -->
	 
	<jsp:include page="../commons/global_nav.jsp"></jsp:include>
	
	<div class="container mt-5">
		<div class="row">	<%--하나의 로우 박스.. --%>
			<div class="col"></div>
			<div class="col-6">
				<div class="row mt-3">
					<div class="col text-center"><h1>LOGIN</h1></div>
				</div>
				
				<form action="${pageContext.request.contextPath }/member/login_process.do" method="post">
				
				<div class="row mt-3">		<%--ID --%>	
					<div class="col form-floating">
						<input id="idBox" placeholder="id" class="form-control"  type="text" name="member_id">
						<label for="idBox">ID</label>
					</div>
				</div>
				<div class="row mt-3">		<%--PW --%>	
					<div class="col form-floating">
						<input id="pwBox" placeholder="password" class="form-control" type="password" name="member_pw">
						<label for="pwBox">PW</label>
					</div>
				</div>
				<div class="row mt-3">	<%--로그인 버튼 / 메인 버튼 --%>
					
					<input type="hidden" name="redirect_url" value="${referer }"><!-- 인풋 히든.. -->
					
					<div class="col d-grid gap-2 d"><input class="btn btn-primary" type="submit" value="LOGIN"></div>
					<div class="col-4 d-grid gap-2 d"><a class="btn btn-outline-primary" href="${pageContext.request.contextPath }/content/main_page.do">HOME</a></div>
				</div>
				
				</form>
				
				<div class="row mt-3">	<%--회원가입버튼 --%>
					<div class="col d-grid gap-2 d">
						<a class="btn btn-outline-info" href="${pageContext.request.contextPath }/member/join_member_page.do">JOIN US</a>
					</div>
				</div>
			</div>
			<div class="col"></div>
		</div>
	</div> <%--컨테이너 닫음 --%>

<!-- 
	<h1>LOGIN</h1>

	<form action="${pageContext.request.contextPath }/member/login_process.do" method="post">
		ID : <input class="form-control"  type="text" name="member_id"><br>
		PW : <input class="form-control" type="password" name="member_pw"><br>
		<input class="btn btn-outline-primary" type="submit" value="login">
	</form>

	<a class="btn btn-outline-primary" href="${pageContext.request.contextPath }/member/join_member_page.do">join us</a>		
 -->
		
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>