<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="mailDTO" value="${mailDTO}" />
<c:set var="myPageDTO" value="${myPageDTO}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="${root}/resources/js/jquery-3.1.1.min.js"></script>
    <script src="${root}/resources/js/jquery-ui.min.js"></script>
    <script src="${root}/resources/js/jquery.easing.1.3.js"></script>
    <script src="${root}/resources/js/jquery.mousewheel.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${root}/resources/css/common.css">
    <link rel="stylesheet" type="text/css" href="${root}/resources/css/inputUserInfo.css">
    
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

$(function() {
	
	var autoHypenPhone = function(str){
	      str = str.replace(/[^0-9]/g, '');
	      var tmp = '';
	      if( str.length < 4){
	          return str;
	      }else if(str.length < 7){
	          tmp += str.substr(0, 3);
	          tmp += '-';
	          tmp += str.substr(3);
	          return tmp;
	      }else if(str.length < 11){
	          tmp += str.substr(0, 3);
	          tmp += '-';
	          tmp += str.substr(3, 3);
	          tmp += '-';
	          tmp += str.substr(6);
	          return tmp;
	      }else{              
	          tmp += str.substr(0, 3);
	          tmp += '-';
	          tmp += str.substr(3, 4);
	          tmp += '-';
	          tmp += str.substr(7);
	          return tmp;
	      }
	  
	      return str;
	}


	var phoneNum = document.getElementById('joinPhoneNumber');

	phoneNum.onkeyup = function(){
	  console.log(this.value);
	  this.value = autoHypenPhone( this.value ) ;  
	}

	var flag=$("input[name='flag']").val();
	
	
	alert(flag)
	
	if(flag=="join"){
				
		$("#joinFrm").attr("action","/member/memberBefore")
		$("#joinFrm").attr("method","POST")
	}else if(flag=="modify"){
		
		$("#joinFrm").attr("action","/member/updateMyMember")
		$("#joinFrm").attr("method","POST")
		
	}
	
	
	
	$("input[type='submit']").click(function() {
			var name=$("#joinName").val();
			var id=$("#joinId").val();
			var password=$("#joinPassword").val();
			var passwordConfirm=$("#joinPasswordConfirm").val();
			var birthday=$("#joinBirthday").val();
			var phoneNumber=$("#joinPhoneNumber").val();
			var zipCode=$("input[name='zipcode']").val();
			var address=$("input[name='address']").val();
			var addressDetail=$("input[name='address']").val();
			var addressAppendix=$("input[name='appendix']").val();
			
			
			var empReg=/^\s+|\s+$/g //공백
			
			
			
			var pwdReg= /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,30}$/; //최소 8 자 및 최대 10 자, 대문자 하나 이상, 소문자 하나, 숫자 하나 및 특수 문자 하나 이상 :
				
			var idReg=/^[A-Za-z0-9]{5,15}$/g;	//아이디 정규표현식 구현
			
			
			
			var empChk = new RegExp(empReg);
			
			
			
			var pwdChk=new RegExp(pwdReg);
			
			var idChk=new RegExp(idReg)
			
			
			if(!name.replace(empReg,"") || !id.replace(empReg,"") || !password.replace(empReg,"") || 
					!passwordConfirm.replace(empReg,"") || !phoneNumber.replace(empReg,"") || !zipCode.replace(empReg,"") || !address.replace(empReg,"")
						|| !addressDetail.replace(empReg,"") || !addressAppendix.replace(empReg,"")){
				
				
				alert("공백을 제거해주세요")
				return false;
			}
		
			if(pwdChk.test(password) || pwdChk.test(passwordConfirm)){
				
				alert("최소 8 자 및 최대 10 자, 대문자 하나 이상, 소문자 하나, 숫자 하나 및 특수 문자 하나 이상을 입력해주세요");
				return false;
			}
			
			if(idChk.test(id)){
				
				alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
				return false;

				
			}
			
			
		
		
		  
	});//endOfsearch
	
	
		
});
	
	




</script>

    
    <title>정보입력</title>



</head>

<%@ include file="/WEB-INF/views/include/header.jsp" %> 


		<nav>
            
                <h1>부가 서비스</h1>
                <ul id="member-tab">
                    <li ><a>로그인</a></li>
                    <li ><a>아이디*비밀번호찾기</a></li>
                    <li id="click-menu"><a>회원가입</a></li>
                    <li><a>개인정보처리방침</a></li>
                    <li><a>이용약관</a></li>
                    <li><a>이메일 무단수집 거부</a></li>
                    <li><a>영상정보처리기기 운영관리</a></li>
                </ul>


        </nav>
    
        <section >
            <article class="agree-service">
                <img src="${root}/resources/images/end_step3.png">
             </article>
       
       <form id="joinFrm" >
            <article class="join-choice-input">
                <h3>회원 정보 입력 <span id="must-input">* 필수입력사항</span></h3> 
              
              
                <table width="900px" border="1">
                    <tr>
                        <td>

                            이름<span id="must-input">* </span>
                            
                        </td>
                        <td>

                            <input type="text" id="joinName" name="joinName" <c:if test='${!empty mailDTO}'> value="${mailDTO.emailName}"</c:if>  <c:if test='${!empty myPageDTO}'> value="${myPageDTO.joinName}"</c:if>readonly="readonly">
                            <p class="member-red-info"></p>
                        </td>

                        
                    </tr>
                    <tr>

                        <td>

                            아이디<span id="must-input">* </span>

                        </td>
                        <td>

                            <input type="text" id="joinId" <c:if test='${!empty myPageDTO}'> value="${myPageDTO.joinId}" readonly='readonly'</c:if> name="joinId">
                            <p class="member-red-info"></p>
                        </td>
                    </tr>
                    <tr>

                        <td>

                            비밀번호<span id="must-input">* </span>

                        </td>
                        <td>

                            <input type="password" id="joinPassword" name="joinPassword">
                            <p class="member-red-info"></p>
                        </td>
                    </tr>
                    <tr>

                        <td>

                            비밀번호 확인<span id="must-input">* </span>

                        </td>
                        <td>

                            <input type="password" id="joinPasswordConfirm" name="joinPasswordConfirm">
                            <p class="member-red-info"></p>
                        </td>
                    </tr>

                    <tr>

                        <td>

                            생년월일<span id="must-input">* </span>
                            

                        </td>
                        <td>
                            
                            <input type="date" id="joinBirthday" name="joinBirthday">
                            <p class="member-red-info"></p>
                        </td>
                    </tr>

                    <tr>

                        <td>

                            연락처<span id="must-input">* </span>

                        </td>
                        <td>
                            
                            <input type="tel" id="joinPhoneNumber" name="joinPhoneNumber" >
                            <p class="member-red-info"></p>
                        </td>
                    </tr>
                    <tr>

                        <td>

                            이메일 주소<span id="must-input">* </span>

                        </td>
                        <td>
                            
                            <input type="email" id="email" name="joinEmail" <c:if test='${!empty mailDTO}'> value="${mailDTO.mailTo}" readonly='readonly' </c:if>>
                            <p class="member-red-info"></p>
                        
                        </td>
                    </tr>
                   <tr> 

                        <td>

                            주소<span id="must-input">* </span>

                        </td>
                        <td>
                            
                            <label for="userAddress">주소지 필수 사항</label><input 
						type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" id="join findAddressBtn" ><br>


						<input type="text" id="sample6_postcode"  placeholder="우편번호" class="inputSize " class="address"  name="joinZipCode"> 
						<input type="text" id="sample6_address"  placeholder="주소" class="inputSize" class="address"   name="joinAddress"><br> 
						<input
						type="text" id="sample6_detailAddress" placeholder="상세주소" class="inputSize" class="address"   name="joinAddressDetail"> 
						<input
						type="text" id="sample6_extraAddress" placeholder="참고항목" class="inputSize" name="joinAddressAppendix"> 
                        </td>
                    </tr>
                    <tr>

                        <td>

                            뉴스레이터 이메 제공 여부

                        </td>
                        <td>
                           
                        동의 <input type="radio" id="sending-agree" name="joinNewsletter" class="not-mendatory" value='Y' >
                        반대 <input type="radio" id="sending-disagree" name="joinNewsletter" class="not-mendatory" value='N'>
                        
                        </td>
                    </tr>
                </table>
               
               	<c:if test="${!empty mailDTO}">
					<input type="hidden" name="flag" value="join">
				</c:if>	
			
				<c:if test="${!empty myPageDTO}">
					<input type="hidden" name="flag" value="modify">
				</c:if>
               

                    <div id="btns-wrap">  
						<input type='hidden' name='joinUseYN' value='Y' />
                        <input type="reset"  class="join-btns" value="취소">
                        <input type="submit" class="join-btns" value="확인">
                        
                    </div>
 			
 		
			
					
            

            </article>
	</form>
	
            <article class="join-choice-input">
               
               
            </article>
        
        </section>

 
      

    </div>
    <!--//콘텐츠-->

<%@ include file="/WEB-INF/views/include/footer.jsp" %> 