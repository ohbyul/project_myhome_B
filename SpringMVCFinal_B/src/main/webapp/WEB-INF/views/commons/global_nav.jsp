<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="${pageContext.request.contextPath }/content/main_page.do">꼬바리네</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">
	      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	        <li class="nav-item">
	          <a class="nav-link" aria-current="page" href="${pageContext.request.contextPath }/content/practice.do">연습장</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link active" href="${pageContext.request.contextPath }/content/main_page.do">자유 게시판</a>
	        </li>
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	           	자료실A
	          </a>
	          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
	            <li><a class="dropdown-item" href="https://docs.oracle.com/javase/8/docs/api/index.html">JAVA</a></li>
	            <li><a class="dropdown-item" href="https://www.w3schools.com/">HTML</a></li>
	            <li><a class="dropdown-item" href="https://getbootstrap.com/docs/5.0/getting-started/introduction/">bootstrap</a></li>
	            <li><a class="dropdown-item" href="#">SQL</a></li>
	            <li><a class="dropdown-item" href="#">JSP</a></li>
	            <li><a class="dropdown-item" href="#">Spring</a></li>
	           </ul>
	        </li>
	       <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	           	자료실B
	          </a>
	          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
	            <li><a class="dropdown-item" href="https://www.acmicpc.net/">백준</a></li>
	            <li><a class="dropdown-item" href="https://hellodoor.tistory.com/63?category=867576">졸린코딩</a></li>
	            <li><hr class="dropdown-divider"></li>
	            <li><a class="dropdown-item" href="https://blog.naver.com/s001lec">선생님블로그</a></li>
	            <li><a class="dropdown-item" href="https://us02web.zoom.us/j/3253442665?pwd=emlyam9PNmpkRDJhQitNNVVlbExQdz09#success">줌 링크</a></li>
	          </ul>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link disabled" href="https://www.instagram.com/fivepxint/" tabindex="-1" aria-disabled="true">@FivePxint</a>
	        </li>
	      </ul>
	      
		<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
			<c:choose>
				<c:when test="${!empty sessionUser }">
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
						${sessionUser.member_nick }
						</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
				            <li><a class="dropdown-item" href="#">MY PAGE</a></li>
				            <li><hr class="dropdown-divider"></li>
				            <li><a class="dropdown-item" href="${pageContext.request.contextPath }/member/logout_process.do">
				            	LOGOUT</a>
				            </li>
				        </ul>
					</li>
				</c:when>
				<c:otherwise>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath }/member/login_page.do">로그인</a>
					</li>
				</c:otherwise>
			</c:choose>
		</ul>
		
	    </div>
	  </div>
	</nav>