<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"></head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
	
	function formSubmit() {
		//console.log("안녕하세요");
		//alert("안녕하세요");

		var inputId = document.getElementById("input_id");
		//정규 표현식 이메일 체크
		var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
			if(!regExp.test(inputId.value)){
				alert("아이디는 이메일의 형식이여야 합니다.");
				inputId.focus();	//커서..
				inputId.value="";	//썻던게 지워짐.
				return;
			}
		
		var inputPw = document.getElementById("input_pw");		
		//정규 표현식 비밀번호  8 ~ 10자 영문, 숫자 조합
		var regExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,10}$/; 
		
		if(!regExp.test(inputPw.value)){
			alert("비밀번호는  8 ~ 10자 / 영문 + 숫자 조합이여야 합니다.");
			inputPw.focus();
			inputPw.value = "";		//썻던게 지워짐.
			return;
		}

		var inputPwConfirm =document.getElementById("input_pw_confirm");
		if(inputPw.value != inputPwConfirm.value){
			alert("비밀번호를 확인해 주세요.");
			inputPw.value = "";
			inputPwConfirm.value = "";
			inputPw.focus();
			return; 
		}
			
		if(isConfirmId == false){
			alert("아이디가 이미 존재합니다");
			return;
		}
		
		
		var trmJoinMember = document.getElementById("frm_join_member");
		//폼 태그에 해당하는 객체를 리턴해줌
		trmJoinMember.submit();
	}
	
	var isConfirmId = false;
	
	function confirmId() {
		
		isConfirmId = false;
		
		//바닐라  js..
		
		var inputId = document.getElementById("input_id");
		var id = inputId.value;
		
		var xmlhttp = new XMLHttpRequest();
    	
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				//응답 데이터 받은 후 할일..난이도가 있음
				//아래처럼 하면 안됨!! JSON(XML)..
				
				if(xmlhttp.responseText == 'true'){
					isConfirmId = false;
					//alert("아이디가 이미 존재합니다.");
					
					//javascript로 동적으로 태그를 생성하고.. 컨트롤..
					var alertBox = document.createElement("div");
					alertBox.innerText ="아이디가 이미 존재합니다.";
					alertBox.style.color = "red";
					
					var positionBox = document.getElementById("confirm_alert_box");
					
					positionBox.innerHTML ="";
					
					positionBox.appendChild(alertBox);
					
					
				}else {
					//가능
					isConfirmId = true;
					//alert("사용 가능 합니다.");
					var alertBox = document.createElement("div");
					alertBox.innerText ="사용 가능한 아이디입니다.";
					alertBox.style.color = "green";
					
					var positionBox = document.getElementById("confirm_alert_box");
					
					positionBox.innerHTML ="";
					
					positionBox.appendChild(alertBox);
				
				}
			
			}	
		};
		//send한후에 응답을 받는것이 아니고 콜백! 그러므로 샌드 위에 적어아함.
		
		//post방식 순서중요*	
		xmlhttp.open("post","${pageContext.request.contextPath }/member/exist_id.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		//post는 위에 코드 넣어준다.
		xmlhttp.send("id=" + id);

		/*
		//get방식
		xmlhttp.open("get","${pageContext.request.contextPath }/member/exist_id.do?id="+id);
		xmlhttp.send();
		*/
	}
	
	function confirmId_jquery() {
		//jquery 활용 ... 현업에서는 사실상 90%..
		//단, 외부 라이브라러 ... Vanilla JS 기반으로 만듦.
		//학습 : Valnilla Js 로 하길르 바람..
		
		isConfirmId = false;

		
		var inputId = $("#input_id");
		//Vanilla JS : getElement

		var id = inputId.val();
		//Vanilla JS : inputId.value();
		
		//ajax
		$.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath }/member/exist_id.do',
			data : 'id=' + id,
			success : function(data){
				
				if(data == 'true'){
					isConfirmId = false;
					//alert("아이디가 이미 존재합니다.");
					
					//Vanilla Js : createElement
					//var alertBox = $("<div>이미 존재하는 아이디입니다.</div>");
					var alertBox = $("<div></div>");
					alertBox.text("이미 존재하는 아이디 입니다.");
					//alertBox.css("color","red");
					alertBox.css({color : "red"});
					
					var positionBox = $("#confirm_alert_box");	//#붙여야함 이런 태그를 가져오겠다.
					positionBox.html("");
					positionBox.append(alertBox);
					
				}else{
					isConfirmId = true;
					//alert("사용 가능한 아이디 입니다.");		
					
					var alertBox = $("<div></div>");
					alertBox.text("사용 가능한 아이디 입니다.");
					alertBox.css({color : "green"});
					
					var positionBox = $("#confirm_alert_box");
					positionBox.html("");
					positionBox.append(alertBox);
					
				}
			}
		});
	}
	
</script>

</head>
<body>
	
	<jsp:include page="../commons/global_nav.jsp"></jsp:include>
	
   <div class="container mt-5">
      <div class="row">
         <div class="col"></div>
         <div class="col-6">
         	<div class="row mt-3">		<%--로고 --%>
         		<div class="col text-center">
         			<h1>JOIN US</h1>
         		</div>
         	</div>
         
         		<form id="frm_join_member" action="${pageContext.request.contextPath }/member/join_member_process.do" method="post">
         
         	<div class="row mt-3">	 	<%--아이디 --%>
         		<div class="col-2">E-MAIL</div>
         		<div class="col"><input onblur="confirmId_jquery()"; id="input_id" class="form-control" type="email" name="member_id" placeholder="name@example.com" ></div>
			<!-- 중복체크 버튼 지움
         		<div class="col-2 d-grid gap-2 d">
         			<input onclick="confirmId()" type="button" value="중복체크" class="btn btn-primary">
         		</div>
			-->
         	</div>
         	
         	<div class="row">	<!-- alert 박스 중복체크 -->
         		<div class="col-2"></div>
         		<div class="col" id="confirm_alert_box"></div>
         	</div>
         	
         	<div class="row mt-3">		<%--비번 --%>
         		<div class="col-2">PW</div>
         		<div class="col"><input id="input_pw" placeholder="비밀번호는 8~10글자, 영문 + 숫자 조합" class="form-control" type="password" name="member_pw"></div>
         	</div>
         	<div class="row mt-3">		<%--비번확인 --%>
         		<div class="col-2"></div>
         		<div class="col"><input id="input_pw_confirm" placeholder="PW Confirm" class="form-control" type="password"></div>
         	</div>
         	<div class="row mt-3">		<%--닉네임 --%>
         		<div class="col-2">NICK</div>
         		<div class="col"><input class="form-control"  type="text" name="member_nick"></div>
         	</div>
         	<div class="row mt-3">		<%--성별 --%>
         		<div class="col-2">성별</div>
         		<div class="col">
         			<input type="radio" name="member_sex" value="M" checked>남
					<input type="radio" name="member_sex" value="F">여
         		</div>
         	</div>
         	<div class="row mt-3">		<%--지역 --%>
         		<div class="col-2">지역</div>
         		<div class="col">
					<select name="member_region">
						<option value="서울" selected>서울</option>
						<option value="대전">대전</option>
						<option value="대구">대구</option>
						<option value="부산">부산</option>
					</select>
         		</div>
         	</div>
         	<div class="row mt-3">		<%-- 연락처--%>
         		<div class="col-2">연락처</div>
         		<div class="col"><input  class="form-control" type="text" name="member_phone"></div>
         	</div>
         	<div class="row mt-3">		<%-- 취미--%>
         		<div class="col-2">취미</div>
         		<div class="col">
         			<input type="checkbox" name="hobbby_content" value="soccer">축구
					<input type="checkbox" name="hobbby_content" value="basketball">농구
					<input type="checkbox" name="hobbby_content" value="baseball">야구
					<input type="checkbox" name="hobbby_content" value="football">족구
         		</div>
         	</div>
         	
         	<div class="row mt-3">		<%-- 서브밋--%>
         		<div class="col d-grid gap-2 d">
         			<input onclick="formSubmit()" type="button" class="btn btn-primary" value="JOIN">
         		</div>
         	</div>
         	
         		</form>
         		
        <%-- Ajax test--%>
        <script type="text/javascript">
        	function testAjax() {
				
				//AJAX = 비동기식 javaScript and XML
				//리퀘스트를 하긴 해야겠는데.. 페이지이동없이 리퀘스트를 하고싶다..
				//온리 자바스크립트로!
				//vanilla JS
			
        		var xmlhttp = new XMLHttpRequest();
        	
        		xmlhttp.onreadystatechange = function(){
        			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
        				alert(xmlhttp);
        			}	
        		};
				//send한후에 응답을 받는것이 아니고 콜백! 그러므로 샌드 위에 적어아함.
        			
        		xmlhttp.open("get","./exist_id.do");
				// open : 어디로 요청하느냐
        		xmlhttp.send();
				
        	}
        </script>
        <div class="row mt-3">		
     		<div class="col">
     			<input onclick="testAjax()" type="button"  value="Ajax test">
     		</div>
     	</div> 		        <%-- Ajax test--%>
     	
         
         
         
         
         </div>		<!-- 메인 col -->
         <div class="col"></div>
      </div>
   </div>






<!-- 
	<h1>JOIN US</h1>
	<form action="${pageContext.request.contextPath }/member/join_member_process.do" method="post">
		ID : <input type="text" name="member_id"><br>
		PW : <input type="password" name="member_pw"><br>
		NICK : <input type="text" name="member_nick"><br>
		성별 :
		<input type="radio" name="member_sex" value="M" checked>남
		<input type="radio" name="member_sex" value="F">여 <br>
		지역 :
		<select name="member_region">
			<option value="서울" selected>서울</option>
			<option value="대전">대전</option>
			<option value="대구">대구</option>
			<option value="부산">부산</option>
		</select>
		<br>
		연락처 : <input type="text" name="member_phone"> <br>
		<input type="submit" value="JOIN">
	</form>
 -->

 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>