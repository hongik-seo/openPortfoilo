<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ include file="../main/header.jsp"%>



<link rel="stylesheet" type="text/css" href="${nanam}/css/login.css">
<c:set var="member" value="${member}"/>

<script>

$(function(){

	$("#loginForm .loginPutPosition").blur(function() {
		var a = $(".loginPutPosition").eq(0).val();
		var b = $(".loginPutPosition").eq(1).val();
		console.log(a);
		
		var t = $(".alertP");

		$.ajax({
			type : 'get',
			dataType : 'text',
			url : "/nanam/member/infoIsthere",
			data : {
				"id" : a,
				"pwd" : b
			},
			success : function(data) {
				console.log("request succeeded");

				if (data == "none") {

					t.html("");
				}

			},
			error : function(xhr, ajaxOptions, thrownError) {
				console.log("request failed");
				t.html("아이디 또는 비밀번호를 확인해주세요");
			},

		});

	});//end of pwd
	
	
});
</script>

<title>로그인</title>

<!--로그인-->
<div id="allWrap">
	<!--찾기-->
	<div id="goFindWrap">
		<ul>
			<li style="background-color: #00c5aa;">로그인하기</li>
			<li>아이디찾기</li>
			<li>비밀번호찾기</li>
		</ul>
	</div>
	<!--//찾기-->
	<!--로그인 폼 영역-->
	<div id="allFindLoginWrap">
		<!--입력창-->
		<form id="loginForm" name="loginForm"   method="post"  action="/nanam/member/loginMain" 
		>
			<ul>
				<li>
					<!--로그인 아이디 입력--> <label>아이디</label> <input type="text" name="id"
					id="userLoginID" class="loginPutPosition"
					placeholder="[영문 대문자 또는 소문자 또는 숫자로 시작하는 아이디, 길이는 5~15자, 끝날때 제한 없음]"
					
					
                     >
					
				</li>


				<li>
					<!--로그인 패스워드 입력--> <label>비밀번호</label> <input type="password"
					name="pwd" id="userLoginPwd" class="loginPutPosition"
					placeholder="비밀번호를 입력해 주세요(대소문자 구분합니다.)"
					> <!--//로그인 패스워드 입력-->
				</li>
				<li>
				<p class="alertP"></p> <!--//로그인 아이디 입력-->
				
				
				</li>
				<!--로그인버튼-->
				<li><input type="submit" id="loginBtn" value="로그인"/></li>

				
			</ul>
		</form>
		
		<ul>
			<li><a href="${nanam}/member/idFindFront">아이디 찾기</a></li>
			<li><a href="${nanam}/member/pwdFindFront">비밀번호 찾기</a></li>
		</ul>
	</div>
	<!--//로그인 폼 랩-->
</div>
<!--//로그인-->


<%@ include file="../main/footer.jsp"%>