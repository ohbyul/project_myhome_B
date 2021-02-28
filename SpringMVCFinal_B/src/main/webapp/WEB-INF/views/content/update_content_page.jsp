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
	
	<!-- 메인 시작 -->

	<div class="container mt-5">
		<div class="row">
			<div class="col"></div>
			<div class="col-6">
				<div class="row mt-3">
					<div class="col text-center">
						<h1>글 수정</h1>
					</div>
				</div>
				
				<form action="${pageContext.request.contextPath }/content/update_content_process.do" method="post">
				
				<div class="row">
					<div class="col-2">
						작성자 
					</div>
					<div class="col">
						${sessionUser.member_nick }
					</div>
				</div>
				<div class="row mt-2">
					<div class="col-2">
						제목
					</div>
					<div class="col">
						<input class="form-control" type="text" name="content_title" value="${result.contentVo.content_title } ">
					</div>
				</div>
				<div class="row mt-2">
					<div class="col">
					  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
					  <textarea class="form-control" name="content_content" id="exampleFormControlTextarea1" rows="10">${result.contentVo.content_content }</textarea>
					</div>
				</div>
				<div class="row mt-3">
					<div class="col-8"></div>
					<div class="col d-grid gap-2 d">
						<input type="hidden" name="content_no" value="${result.contentVo.content_no }">
						<input class="btn btn-primary" type="submit" value="글 수정">
					</div>
				</div>
				
				</form>
				
			</div>
			<div class="col"></div>
		</div>
			
	</div>


<!-- 
	<h1>글 수정</h1>
	
	<form action="${pageContext.request.contextPath }/content/update_content_process.do" method="post">
		작성자 : ${result.memberVo.member_nick } <br>
		제목 : 
		<input type="text" name="content_title" value="${result.contentVo.content_title } "><br>
		내용 : <br>
		<textarea rows="10" cols="60" name="content_content">${result.contentVo.content_content }</textarea> <br>
		<input type="hidden" name="content_no" value="${result.contentVo.content_no }">
		<input type="submit" value="글  수정">
	</form>
 -->	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

</body>
</html>