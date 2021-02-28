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
         			<h1>부트스트랩 연습장</h1>
         		</div>
         	</div>
         	<div class="row mt-3">
         		<div class="col text-center">
         			<h2>♥</h2>
         		</div>
         	</div>
         	<div class="row mt-3">
         		<div class="col text-center">
         			연습좀 하것습니둥 <br>
         		</div>
         	</div>
         	<div class="row mt-3">
         		<div class="col text-center">
         			<a  class="btn btn-outline-success btn-lg" href="https://getbootstrap.com/docs/5.0/getting-started/introduction/">부트스트랩 사이트 GO</a>
         		</div>
         	</div>
         	<div class="row mt-3">
         		<div class="col text-center">
         			<div class="card" style="width: 18rem;">
					  <img src="${pageContext.request.contextPath }/resources/image/main2.jpg" class="card-img-top" alt="...">
					  <div class="card-body">
					    <h5 class="card-title">물음표 많은 곰</h5>
					    <p class="card-text">??????????????????항상 궁금한게 많은 곰입니다.</p>
					  </div>
					  <ul class="list-group list-group-flush">
					    <li class="list-group-item">오별</li>
					    <li class="list-group-item">30살</li>
					    <li class="list-group-item">특징 : 만두궁주 , 딩붕이 , 꼬바리네 주인 , 뾰루지를 보면 참지 못함</li>
					  </ul>
					  <div class="card-body">
					    <a href="https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=%EC%98%A4%EB%B3%84" class="card-link">검색 : 오별</a>
					    <a href="https://www.instagram.com/fivepxint/" class="card-link">@FivePxint</a>
					  </div>
					</div>
         		</div>
				<div class="col text-center">
         			<div class="card" style="width: 18rem;">
					  <img src="${pageContext.request.contextPath }/resources/image/main3.jpg" class="card-img-top" alt="...">
					  <div class="card-body">
					    <h5 class="card-title">같은 표정</h5>
					    <p class="card-text">사랑하면 닮는다던데 우리 닮았나요????????????</p>
					  </div>
					  <ul class="list-group list-group-flush">
					    <li class="list-group-item">유수종</li>
					    <li class="list-group-item">29살</li>
					    <li class="list-group-item">특징 : 육식주의자 + 겔창 + 벤츠 오너 + 롤아이디 두개 정지</li>
					  </ul>
					  <div class="card-body">
					    <a href="https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%9C%A0%EC%88%98%EC%A2%85&oquery=%EC%98%A4%EB%B3%84&tqi=U9xjXwp0J1sssgClhmCssssstQw-423237" class="card-link">검색 :유수종</a>
					    <a href="#" class="card-link">@YuSooJong</a>
					  </div>
					</div>
         		</div>
         	</div> <!-- 이미지 카드 row 끝 -->
         	<div class="row mt-3">
         		<div class="col text-center">
					<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
					  <ol class="carousel-indicators">
					    <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"></li>
					    <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></li>
					    <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"></li>
					  </ol>
					  <div class="carousel-inner">
					    <div class="carousel-item active">
					      <img src="${pageContext.request.contextPath }/resources/image/main.jpg" class="d-block w-100" alt="...">
					    </div>
					    <div class="carousel-item">
					      <img src="${pageContext.request.contextPath }/resources/image/main2.jpg" class="d-block w-100" alt="...">
					    </div>
					    <div class="carousel-item">
					      <img src="${pageContext.request.contextPath }/resources/image/main3.jpg" class="d-block w-100" alt="...">
					    </div>
					  </div>
					  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-bs-slide="prev">
					    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Previous</span>
					  </a>
					  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-bs-slide="next">
					    <span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Next</span>
					  </a>
					</div>
         		</div> <!-- 이미지 col 슬라이더 끝. -->
         	</div>	<!-- 이미지 row 슬라이더 끝. -->
         	
         	<div class="row mt-5 mb-5">
         		<div class="col text-center">
         			★
         		</div>
         	</div>
         	
         </div> 	<!-- 센터 col -->
         <div class="col"></div>
      </div>
   </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

</body>
</html>