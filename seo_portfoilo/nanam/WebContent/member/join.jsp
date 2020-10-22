<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>


<%@ include file="../main/header.jsp"%>




<link rel="stylesheet" href="${nanam}/css/join.css">

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}


</script>

<script type="text/javascript">





$(document).ready(function () {
	//새로운 warpperBox 만들기
	//이름 정규표현식
	var userjoinNameCheck = new RegExp(/^[가-힣]{2,4}$/);
	/*
  [가-힣] <== 한글은 ㄱ ~ ㅎ , ㅏ ~ ㅣ 까지 있다.
[ㄱ-ㅎㅏ-ㅣ] 로 하면  ㅇㅣㅈㅣㅇㅐ  와 같은 형식으로 입력해도 입력이 된다.
그러므로 가 ~ 힣 까지로 설정해야 완성된 글자를 입력 받는다.
출처: https://sadtear.tistory.com/106 [[ Be Happy...]]*/
	var t=$("p.alertP");
	var name = $("input#name");
	
	//아이디 정규표현식
	var userJoinIDCheck = new RegExp(/^[A-Za-z0-9]{5,15}$/);
	/* 영문 대소문자 구별없이 5에서 15까지 입력가능*/
	//아이디 정규표현식 구현
	var id = $("input#id");
	
	//비밀번호 비밀번호확인 정규표현식
	var userJoinPwdCheck = new RegExp(/(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,30}$/);
	/*최소 8 자 및 최대 10 자, 대문자 하나 이상, 소문자 하나, 숫자 하나 및 특수 문자 하나 이상 :
  출처: https://gocoding.tistory.com/93 [Developer Factory]);
	 */
	
	var pwd = $("input#pwd");
	var pwdFind = $("input#pwdFind");
	//비밀번호 정규표현식 구현
	
	//비밀번호 확인 정규표현식 구현

	//이메일 정규표현식
	var userJoinEmailCheck = new RegExp(/^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/);
	/*
     출처: https://gocoding.tistory.com/93 [Developer Factory]);
	 */
	var email = $("input#email");
	//이메일 정규표현식 구현

	//휴대전화 정규표현식
	var userJoinTellCheck=new RegExp(/^010-\d{4}-\d{4}$/);
	/*출처 https://cheolgoon.tistory.com/entry/%EC%A0%84%ED%99%94%EB%B2%88%ED%98%B8-%EC%A0%95%EA%B7%9C%EC%8B%9D-%EC%9D%B4%EB%A9%94%EC%9D%BC-%EC%A0%95%EA%B7%9C%EC%8B%9D-%EB%B9%88%EA%B0%92%EC%B2%B4%ED%81%AC-%EC%A0%95%EA%B7%9C%EC%8B%9D*/
	var phone =$("input#phone");


	var address=$("input.address");
	
	

		
	
	
			
	
		
		
			
		$("#email").on("keyup",function(){
			if (email.val() == "") {
				t.eq(6).html("선택 입력사항입니다.");
			} else if (!userJoinEmailCheck.test(email.val())) {
				t.eq(6).html("형식을 맞추세요");
			} else if (userJoinEmailCheck.test(email.val())) {
				t.eq(6).html("");
				checkup=true;
			}
			
		});
		
		 
		$(".address").on("blur",function(){
			
			if (address.val() == "") {
				t.eq(5).html("필수 입력사항입니다.");
			}else{
				
				t.eq(5).html("");
			}
			
			
		});
		
	
			
			
		 $("#phone").on("keyup",function(){
				if (phone.val() == "") {
					t.eq(4).html("필수 입력사항입니다.");
				} else if (!userJoinTellCheck.test(phone.val())) {
					t.eq(4).html("형식을 맞춰주세요 하이픈 포함");
				} else if (userJoinTellCheck.test(phone.val())) {
					t.eq(4).html("");
					checkup=true;
				}
			 });
				
			
		 $("input[type=password]").on("keyup",function(){	
			if (pwdFind.val() == "") {
				t.eq(3).html("필수입력사항입니다.");
			} else if (pwd.val() != pwdFind.val()) {
				t.eq(3).html("입력한 값이 서로 맞지않습니다. 다시입력해주세요");
			} else if(!userJoinPwdCheck.test(pwdFind.val())){
				t.eq(3).html("비밀번호(숫자,영문,특수문자 조합 최소 8자 최대30자로 형식을 맞추세요");
			}else if(userJoinPwdCheck.test(pwdFind.val())){
				
				t.eq(3).html("");
				checkup=true;
			}
		 
			if (pwd.val() == "") {
				t.eq(2).html("필수 입력사항입니다.");
				
			} else if (!userJoinPwdCheck.test(pwd.val())) {
				t.eq(2).html("비밀번호(숫자,영문,특수문자 조합 최소 8자 최대10자로 형식을 맞추세요");
			} else if (userJoinPwdCheck.test(pwd.val())) {
				t.eq(2).html("");
				checkup=true;
			}
		 });
	
		
				
		 
		
				
		 $("#id").on("keyup",function(){		
			if (id.val() == "") {
				t.eq(1).html("필수 입력사항입니다.");
		
				
			} else if (!userJoinIDCheck.test(id.val())) {
				t.eq(1).html("영문 대문자 또는 소문자로 시작하는 아이디, 길이는 5~15자로 입력가능합니다.");
				
			} else if (userJoinIDCheck.test(id.val())) {
				t.eq(1).html("");
				
				
			}
			
			var y=$("#id").val();
			
			

			 
	        $.ajax({
                type: 'get',
                dataType: 'text',
                url: "/nanam/member/ajax",
                data: {"id":y},
                success: function (data) {
                    console.log("request succeeded");
                    if(data=="usable"){
                    	
                    	t.eq(1).html("사용중인 아이디입니다.");
                    }
                    
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    console && console.log("request failed");
                },
			


			//출처: https://annotations.tistory.com/43 [Annotation]
			
			
		
			
			
		 });//endOfAjax
		 
		
		 });		
		
		 $("#name").on("keyup",function(){	
			if (name.val() == "") {
				t.eq(0).html("필수 입력사항입니다.");
				
				
			} else if (!userjoinNameCheck.test(name.val())) {
				
				t.eq(0).html("한글만 입력 가능합니다. 2에서 4글자 ex=이근,서홍익,남궁성우");
			} else if (userjoinNameCheck.test(name.val())) {
				t.eq(0).html("");
				checkup=true;
			
				
			}
			
	
			
		 });
	 
	
	 
		 $("ul#notMust").on("focusin",function(){
			 
			
			 if(name.val()!="" && id.val()!=""&& $("input[type=password]").val()!="" && phone.val() !=""&& $(".alertP").val()==""&& address.val()!=""){
				 $("#allBtn").removeAttr("disabled");
			 }
			 
		 });
		 


});//end of ready

</script>






<title>정보입력</title>


<!--회원가입 전체 랩-->
<div id="agreeJoinWrap">
	<!--inner 약관동의-->
	<div id="agreeJoinBox">
		<!--basebar-->
		<div class="basebar">
			<ul>
				<li><a href="#">메인</a></li>
				<li>></li>
				<li><a href="#">회원가입</a></li>
				<li>></li>
				<li><a href="#">회원가입</a></li>
			</ul>
		</div>
		<!--//basebar-->



		<!--약관동의 /회원가입-->
		<div id="goAgreeJoinWrap">
			<ul>
				<li><a title="약관동의" href="#">약관동의 </a></li>
				<li><a title="회원가입" href="#">회원가입</a></li>

			</ul>
		</div>
		<!--//약관동의/회원가입-->
		<!--폼랩-->
		<div id="myFormWrap">
			<h2>
				회원가입
			</h2>

			<form name="myForm" id="myForm" method="post" action="/nanam/member/joinMain">
				<label
						for="name">이름 필수사항</label> 
						
						<input type="text" id="name"
						class="inputSize" placeholder="고객님의 이름을 입력해주세요" name="name" />
				
				<ul id="must">
					<!--이름-->
					<li id="nameWrap" >
						<p id="joinNameP" class="alertP"></p></li>
					<!--//이름-->
					<!--아이디-->
					<li id="idWrap" ><label for="id">아이디</label>

						<input type="text" id="id"
						placeholder="영문 대문자 또는 소문자 숫자로 시작하는 아이디, 길이는 5~15자를 입력해주세요"
						class="inputSize" name="id" required="required" />
						<p id="joinIDP" class="alertP"></p></li>

					<!--//아이디-->
					<!--비밀번호-->
					<li id="pwdWrap" class="inputInterval"><label
						for="pwd">비밀번호 필수사항</label> <!--비밀번호--> 
						
						
						<input type="password"
						id="pwd" class="inputSize"
						placeholder="(최소 8 자 및 최대 30자, 대문자 하나 이상, 소문자 하나, 숫자 하나 및 특수 문자 하나 이상)" name="pwd"
						required="required" /> <!--//비밀번호--> <!--비밀번호확인--> 
						
						<p id="joinPwdP" class="alertP" ></p>
					</li>	
					
					<li id="pwdCWrap" ><label
						for="pwdFind">비밀번호확인 필수사항</label> <!--비밀번호--> 	
						<input
						type="password" id="pwdFind" class="inputSize"
						placeholder="비밀번호(최소 8 자 및 최대 30자, 대문자 하나 이상, 소문자 하나, 숫자 하나 및 특수 문자 하나 이상)" name="pwdFind" required="required"/>
						<p id="joinPwdComfirmP" class="alertP" ></p> <!--//비밀번호 확인--></li>
					<!--//비밀번호 -->


					
					<!--전화번호-->
					<li id="tellWrap"><label for="phone">핸드폰 필수사항
							번호</label>
							
							
							 <input type="tel" id="phone" class="inputSize"
						placeholder="고객님의 핸드폰 번호를 입력해주세요 (하이픈 포함)" name="phone"
						required="required" />


						<p id="joinTellP" class="alertP"></p>
						
						</li>
					
						
						<li id="addressWrap" ><label for="userAddress">주소지 필수 사항</label><input 
						type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" id="join findAddressBtn" ><br>


						<input type="text" id="sample6_postcode"  placeholder="우편번호" class="inputSize " class="address"  name="zipcode"> 
						<input type="text" id="sample6_address"  placeholder="주소" class="inputSize" class="address" name="address"><br> 
						<input
						type="text" id="sample6_detailAddress" placeholder="상세주소" class="inputSize" class="address" name="detailAddress"> 
						<input
						type="text" id="sample6_extraAddress" placeholder="참고항목" class="inputSize" > 
						
						
						<p id="addressP" class="alertP"></p>
						</li>

						
				</ul>
				<ul id="notMust">		
						<!-- 이메일-->
					<li id="emailWrap" ><label
						for="email">이메일 선택사항</label> 
						
						
						<input type="email"
						id="email" class="inputSize"
						placeholder="고객님의 이메일을 입력해주세요" name="email" />
						<p id="joinEmailP" class="alertP"></li>
					<!--// 이메일-->
					
					<!--//정보입역 버튼-->
					
					<li id="btnWrap"><input type="submit" id="allBtn" disabled="disabled"
						class="join btn" value="작성완료" >
						
						
						
						</li>
				</ul>
			</form>

		</div>
		<!--//폼랩-->
	</div>
	<!--//inner 회원가입-->
</div>
<!--//회원가입전체-->


<%@ include file="../main/footer.jsp"%>