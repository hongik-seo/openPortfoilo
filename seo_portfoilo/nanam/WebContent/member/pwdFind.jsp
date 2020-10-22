<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




 
 
  <%@ include file="../main/header.jsp" %>
  
  
 <link rel="stylesheet" href="${nanam}/css/find.css" type="text/css">

<script>
	//인증번호에 사용할 번호 설정
	var arrNumber = new Array(); //배열선언

	arrNumber[0] = 15782;
	arrNumber[1] = 45319;
	arrNumber[2] = 78951;
	arrNumber[3] = 45628;
	arrNumber[4] = 78942;
	arrNumber[5] = 87463;
	arrNumber[6] = 87663;
	arrNumber[7] = 48348;
	arrNumber[8] = 74774;
	arrNumber[9] = 91735;


	var arrRan = arrNumber[Math.floor(Math.random() * 10)];

	//아이디 찾기창
	function idOver() {
		//이름 인풋창 변수 선언
		var nameInput = document.getElementById("nameInput").value;
		//휴대폰 번호 인풋창 변수 선언
		var tellInput = document.getElementById("tellInput").value;
		//console.log(tellInput+"tellInput");//휴대폰 인풋 확인창

		//휴대폰 번호 확인창 인풋창 변수 선언
		var confirmAll = document.getElementById("confirmAll").value;
		//console.log(tellConfirm+"tellConfirm");

		if (tellInput) {
			alert("인증번호가 발송 되었습니다.");
			console.log(arrRan);//만약 이메일 입력창에 "01020527958" 휴대폰 번호가 입력되고 이게 참이면, 배열로 만든  arrNumber 에 인덱스 번호를 0에서 9까지 무작위로 추출해 console창에 찍어줘

		}
	}//end of idOver()

	
	

	
</script>




<div id="allWrap">

	<!--찾기-->
	<div id="goFindWrap">
		<ul>
			<li>로그인하기</li>
			<li >아이디찾기</li>
			<li style="background-color: #00c5aa;">비밀번호찾기</li>
		</ul>
	</div>
	<!--//찾기-->
	<!--아이디 찾기 창 전체-->
	<div id="allFindLoginWrap">

		<h2 id="caption">아이디 찾기</h2>



		<!--아이디 찾기 영역 시작-->

		<form id="allFindLoginForm" action="/nanam/member/pwdFindMain" name="testForm"
			method="POST" >
			 -->
			 <label for="tellCheck">휴대전화</label> 
			<!--라디오박스 시작-->
			<input type="radio" checked="checked" name="check" id="tellCheck"
				value="휴대전화 확인"/>
				
				
				<label
				for="emailCheck">이메일</label>
				<input
				type="radio" name="check" id="emailCheck" value="이메일 확인"/> 
			<!--//라디오박스 끝-->

			<!--이름입력-->
			<input type="text" id="nameInput" name="name" placeholder="이름 입력"
				class="putPositionFind"/>


			<!--휴대전화입력-->
			<input type="tel" id="tellInput" name="phone"
				placeholder="휴대전화 입력(- 포함)" pattern="(010)-\d{3,4}-\d{4}"
				class="putPositionFind"/>

			<!-- 확인창-->
			<input type="text" id="confirmAll" name="confirmAll"
				class="putPositionFind" placeholder="인증 번호 5자리 숫자 입력"/>

			<!--인증요청-->
			<input type="button" id="overlapBtn" value="인증요청" onclick="idOver();"/>


			<!--아이디 찾기 버튼-->
			<input type="submit" id="searchBtn" value="비밀번호 찾기" >
			<div id="callback"></div>
	   </form> 
		<ul>
			<li><a href="${nanam}/member/loginFront">로그인</a></li>
			<li><a href="${nanam}/member/idFindFront">아이디 찾기</a></li>
		</ul>
		<!--//아이디 찾기 영역 끝-->
	</div>
</div>
     
     
     
     <%@ include file="../main/footer.jsp"%>