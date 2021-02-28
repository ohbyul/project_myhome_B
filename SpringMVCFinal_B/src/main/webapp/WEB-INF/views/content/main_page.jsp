<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꼬바리네</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"></head>

</head>
<body>

	<jsp:include page="../commons/global_nav.jsp"></jsp:include>
	

<div class="container mt-1">
	<div class="row">
		<div class="col"></div>
		<div class="col-10">
			<div class="row">	<!-- 로고/제목 -->
				<div class="col text-center">
					<img class="img-fluid" src="${pageContext.request.contextPath }/resources/image/main3.jpg">
				</div>
			</div>
			
			<form action="${pageContext.request.contextPath }/content/main_page.do" method="get">	<!-- 폼태그를 로우 전체를 감쌈../메소드 get 방식 !  -->
			
			<div class="row mt-3">	<!-- 검색 -->
				<div class="col ">
					<select  name="search_type" class="form-control">
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="writer">작성자</option>
						<option>=======</option>
					</select>	
				</div>
				<div class="col-8">		<!-- 검색 칸 -->
					<input name="search_word" type="text" class="form-control">
				</div>
				<div class="col d-grid gap-2 d">
					<input type="submit" value="검색" class="btn btn-outline-success">
				</div>
			</div>
			
			</form>
			
			<div class="row mt-3">	<!-- 글목록 -->
				<div class="col">
					<table class="table table-hover">
						<thead>
						<tr>
							<th>글 번호</th>
							<th>제목</th>
							<th>조회수</th>
							<th>글쓴이</th>
						 	<th>작성일</th>
						</tr>
						</thead>
						<tbody>
					<c:forEach items="${resultList }" var="data">
						<tr>
							<th>${data.contentVo.content_no} </th>
							<td><a href="${pageContext.request.contextPath }/content/read_content_page.do?content_no=${data.contentVo.content_no}">
								${data.contentVo.content_title}</a></td> <%-- 글 제목 클릭시 페이지 이동 고정된 페이지 값..--%>
							<td>${data.contentVo.content_readcount}</td>
							<td>${data.memberVo.member_nick}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${data.contentVo.content_writedate}"/> </td>
						</tr>
					</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row mt-3 mb-5">	<!-- 글쓰기/페이지 버튼 -->
				<div class="col-2"></div>
				<div class="col text-center">		<!-- 페이지버튼 -->
					<nav aria-label="Page navigation example">
					  <ul class="pagination mb-0 justify-content-center">
					    
					    <li class="page-item<c:if test="${currentPage == 1 }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/content/main_page.do?page_num=1">&lt;&lt</a></li>
					    <li class="page-item<c:if test="${beginPage <= 1 }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/content/main_page.do?page_num=${beginPage-1}">&lt;</a></li>

					    <c:forEach begin="${beginPage }" end="${endPage }" var="index">
					    	 
					    	 <li class="page-item<c:if test="${index == currentPage }"> active</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/content/main_page.do?page_num=${index }">${index}</a></li>
					    
					    </c:forEach>				      

					  <li class="page-item<c:if test="${endPage >= pageCount }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/content/main_page.do?page_num=${endPage+1 }">&gt;</a></li>
					  <li class="page-item<c:if test="${currentPage == pageCount }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/content/main_page.do?page_num=${pageCount}">&gt;&gt</a></li>
					  
					  </ul>
					</nav>
				</div>
				
				<div class="col-2 d-grid gap-2 d"> 		<!-- 글쓰기 버튼  -->
					<c:if test="${!empty sessionUser }">
					<a class="btn btn-danger" href="${pageContext.request.contextPath }/content/write_content_page.do">
						글쓰기
					</a>
					</c:if>
				</div>
			</div>
		</div>
		<div class="col"></div>
	</div>	
</div>



<!-- 
	<h1>MAIN PAGE</h1>
	<c:choose>
		<c:when test="${!empty sessionUser }">
			[ ${sessionUser.member_nick } ] 님 환영 합니다 <br>
			<a href="${pageContext.request.contextPath }/member/logout_process.do">로그아웃</a><br>
		</c:when>
		<c:otherwise>
		 	비회원으로 접근 하였습니다  <br>
			<a href="${pageContext.request.contextPath }/member/login_page.do">로그인 페이지로.. </a>	<br> 		
		</c:otherwise>
		<%--jsp주석 --%>
	</c:choose>
	
	<br>
	<table border="1">
		<tr>
			<td>글 번호</td>
			<td>제목</td>
			<td>조회수</td>
			<td>글쓴이</td>
			<td>작성일</td>
		</tr>
		
		<c:forEach items="${resultList }" var="data">
			<tr>
				<td>${data.contentVo.content_no} </td>
				<td><a href="${pageContext.request.contextPath }/content/read_content_page.do?content_no=${data.contentVo.content_no}">
					${data.contentVo.content_title}</a></td> <%-- 글 제목 클릭시 페이지 이동 고정된 페이지 값..--%>
				<td>${data.contentVo.content_readcount}</td>
				<td>${data.memberVo.member_nick}</td>
				<td>${data.contentVo.content_writedate}</td>
			</tr>
		</c:forEach>
	</table>

	<c:if test="${!empty sessionUser }">
		<a href="${pageContext.request.contextPath }/content/write_content_page.do">글쓰기</a>
	</c:if>
 -->	
	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

</body>
</html>