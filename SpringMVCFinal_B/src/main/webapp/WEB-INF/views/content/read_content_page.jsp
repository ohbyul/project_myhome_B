<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"></head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">

    google.charts.load('current', {'packages':['corechart']});
    //google.charts.setOnLoadCallback(drawChart);
	//우리가 호출 시점을 따로 잡을것.
	
    function drawChart(datas) {
		//매개변수 받음
        var data = google.visualization.arrayToDataTable(datas);

        var options = {
          title: '댓글 남녀 성비',
          slices: {
              0: { color: 'blue' },
              1: { color: 'red' }
            }	//내가 넣은 슬라이드.. 문제점 : 여자만 댓글을 썻을땐 파란색으로 나옴 남자가 댓글 하나라도 쓰면 빨간색으됨..
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    
	//남녀 성비 함수만들기
	function refreshGragh() {

		var contentNo = ${result.contentVo.content_no};		//갑자기 나온 EL 이건 자바 코드

		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				//alert(xmlhttp.responseText);
				var obj = JSON.parse(xmlhttp.responseText);
				//배열 객체 등 값을 변환하는것.
				
				datas = [];		//1중 배열
				
				columns = ['성별','리플 갯수'];
				datas.push(columns);
				
				for(x of obj){
					arr = [];
					arr.push(x.SEX);	//키가 대문자여야함 .. sql에서 대문자로 바뀜,
					arr.push(x.RATIO_COUNT);
					
					datas.push(arr);
				}
				
				//console.log(datas);
				drawChart(datas);
			}
		};
		xmlhttp.open("get","${pageContext.request.contextPath }/content/get_ratio_count.do?content_no="+contentNo);
		xmlhttp.send();
	}
    
    
    
	function writeReple() {
		//alert("test");
		var repleContent = document.getElementById("reple_content").value;
		var contentNo = ${result.contentVo.content_no};		//갑자기 나온 EL 이건 자바 코드
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				refresh();
			}
		};
		
		xmlhttp.open("post","${pageContext.request.contextPath }/content/write_reple_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("content_no=" + contentNo + "&reple_content=" + repleContent);
		
		document.getElementById("reple_content").value = "";

	}

	function refreshReple() {
		
		var contentNo =  ${result.contentVo.content_no};		//또 나온 EL 이건 자바 코드
		
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				//alert(xmlhttp.responseText);
				var obj = JSON.parse(xmlhttp.responseText);

				//이후.. JS 로 태그 생성 및 꾸미기.
				
				var repleListBox = document.getElementById("reple_list_box");
				//repleListBox.innerHTML= "";
				//박스 안쪽 초기화
				
				var childCount = repleListBox.childNodes.length ;
				for(var i =0 ; i < childCount ; i++){
					repleListBox.childNodes[0].remove();
				}
							
				for(repleData of obj){
					var rowBox = document.createElement("div");
					rowBox.setAttribute("class","row mx-0 px-0");
					
					var contentBox = document.createElement("div");
					contentBox.setAttribute("class","col-7 alert alert-primary");
					contentBox.innerText = repleData.repleVo.reple_content;
					
					var nickBox = document.createElement("div");
					nickBox.setAttribute("class","col-2 alert alert-success");
					nickBox.innerText = repleData.memberVo.member_nick;
					
					var dateBox = document.createElement("div");
					dateBox.setAttribute("class","col-3 alert alert-danger");
					
					var d = new Date(repleData.repleVo.reple_writedate);
					//밀리 세컨드 - > 데이트 타입
					var strDate =(d.getMonth() + 1) + "/" + d.getDate() + "/" +d.getFullYear() ;
					
					dateBox.innerText = strDate;
					
					rowBox.append(contentBox);
					rowBox.append(nickBox);
					rowBox.append(dateBox);
					
					repleListBox.append(rowBox);					
				}				
			}
		};
		xmlhttp.open("get","${pageContext.request.contextPath }/content/get_reple_list.do?content_no="+contentNo);
		xmlhttp.send();	
	}
	
	function refresh() {
		refreshReple();
		refreshGragh();
	}
	
	setInterval(refresh,10000);
	
	
</script>

<style>
	#image_size_auto{
		max-width: 100%;
		height: auto;
	  	display: block;
	}
</style>

</head>
<body onload="refresh();">	<!-- 이안쪽은 스크랩트 코드-->

	<jsp:include page="../commons/global_nav.jsp"></jsp:include>	
	
	<div class="container mt-5">
	<div class="row">
		<div class="col"></div>
			<div class="col-6">
			<div class="row mt-3">
				<div class="col text-center">
					<h1>게시글 보기</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-2">
					제목
				</div>
				<div class="col">
					${result.contentVo.content_title}
				</div>
			</div>
			<div class="row mt-2">
				<div class="col-2">
					작성자
				</div>
				<div class="col">
					${result.memberVo.member_nick }
				</div>
			</div>
			<div class="row mt-2">
				<div class="col-2">
					조회수
				</div>
				<div class="col">
					${result.contentVo.content_readcount }
				</div>
			</div>
			<div class="row mt-2">
				<div class="col-2">
					작성일
				</div>
				<div class="col">
					${result.contentVo.content_writedate }
				</div>
			</div>
			<div class="row mt-2">
				<div class="col-2">
					내용
				</div>
				<div class="col border border-1 overflow-auto" style="height: 200px;">
					${result.contentVo.content_content }
				</div>
			</div>
			
			<div class="row mt-2">	<!-- 이미지박스 -->
				<div class="col-2"></div>
				<div class="col border border-1" >
					<c:forEach items="${result.imageVoList }" var="imageVo">
						<img id="image_size_auto" src="${imageVo.image_link }"><br>
					</c:forEach>
				</div>
			</div>

			<div class="row mt-2" id="reple_list_box"> 	<!-- 댓글 리스트 -->
<!--				<div class="col-7 alert alert-primary" role="alert">test 댓글 </div>
				<div class="col-2 alert alert-success" role="alert">작성자</div>
				<div class="col-3 alert alert-danger" role="alert">2020-10-10</div>
 -->				
			</div>
			
			<c:if test="${!empty sessionUser }">	<!--  순수 AJAX는 form 없어도됨 JS로 다 처리 할것이기 떄문.  -->
				<div class="row mt-2">		 <!-- 리플박스-->
					<div class="col-2">댓글</div>
					<div class="col px-0"><textarea id="reple_content" rows="3" cols="60"></textarea></div>
					<div class="col d-grid gap-2 d"><input onclick="writeReple()" type="button" value="작성" class="btn btn-outline-dark" ></div>				
				</div>		
			</c:if>

			<div class="row mt-2" id="piechart">	<!-- 남녀 성비 차트.. -->
			
			</div>
			
			<div class="row mt-3 mb-3">
				<div class="col"></div>
				
				<c:if test="${!empty sessionUser && sessionUser.member_no ==result.contentVo.member_no }">
					<div class="col-2 d-grid gap-2 d">
						<a class="btn btn-outline-danger" href="${pageContext.request.contextPath }/content/delete_content_process.do?content_no=${result.contentVo.content_no}">
						삭제</a>				
					</div>
					<div class="col-2 d-grid gap-2 d">
						<a class="btn btn-outline-success" href="${pageContext.request.contextPath }/content/update_content_page.do?content_no=${result.contentVo.content_no}">
						수정</a>
					</div>
				</c:if>
				
				<div class="col-2 d-grid gap-2 d">
					<a class="btn btn-primary" href="${pageContext.request.contextPath }/content/main_page.do">목록</a>	
				</div>
			</div>	

			
		</div>
		<div class="col"></div>
	</div>		
</div>
	
<!-- 
	<h1>게시글 보기</h1>
	제목 : ${result.contentVo.content_title} <br>
	작성자 : ${result.memberVo.member_nick }<br>
	조회수 : ${result.contentVo.content_readcount }<br>
	작성일 : ${result.contentVo.content_writedate }<br>
	내용 : ${result.contentVo.content_content }<br>
	<br>
	
	<a href="${pageContext.request.contextPath }/content/main_page.do">목록으로</a>	
	
	<c:if test="${!empty sessionUser && sessionUser.member_no ==result.contentVo.member_no }">
		<a href="${pageContext.request.contextPath }/content/delete_content_process.do?content_no=${result.contentVo.content_no}">
		삭제</a>
		<a href="${pageContext.request.contextPath }/content/update_content_page.do?content_no=${result.contentVo.content_no}">
		수정</a>
	</c:if>
	
 -->	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

</body>
</html>