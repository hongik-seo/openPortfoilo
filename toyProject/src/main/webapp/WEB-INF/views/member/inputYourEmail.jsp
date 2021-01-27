<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    
   

    
    <title>인증과정</title>



</head>
<script>

$(function(){

	$("input[type='submit']").click(function(){

		var name=$("input[name='name']").val();
		var email=$("input[name='email']").val();
		var isJoin=$("input[name='is']").val();
		
		var koreanReg  = /^[가-힣]{2,4}$/ //한글입력
		
		var emailReg =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		
		var koreanChk= new  RegExp(koreanReg);
		
		var emailChk =new RegExp(emailReg);
		
		if(!koreanChk.test(name)){
			
			alert("한글만 2~4자리로 입력해주세요")
			return false;
		}
		
		if(!emailChk.test(email)){
			
			alert("이메일의 형식을 맞춰주세요")
			return false;
			
		}else{
		
		
		$.ajax({
		    url:'/email/confirmYourEmail', //request 보낼 서버의 경로
		    type:'GET', // 메소드(get, post, put 등)
		    dataType:"json",
		    data:{
		    	"name":name,
		    	"email":email,
		    	"isJoin":isJoin
		     	
		    }, 
		    
		    success: function(data) {
		      
		    	console.log(data);
		    	data=data.emailAuten;
		    	
		    	
		    	var app="";
		    	
		    	app+="<form id='to-finYourEmail' action='/member/finYourEmail' method='post'>"
		    	app+= "<input type='hidden' name='mailTo' value="+data.mailTo+">"
		    	app+= "<input type='hidden' name='mailFrom' value="+data.mailFrom+">"
		    	app+= "<input type='hidden' name='emailName' value="+data.emailName+">"
		    	app+= "<input type='hidden' name='emailKey' value="+data.emailKey+">"
		    	app+="</form>" 
		    	document.getElementById("frm-area").innerHTML =app
		    	
		    	$("#to-finYourEmail").submit();
		    	
		    	
		    },
		    error: function(err) {
		        //서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행
		    }
		
		});
		
		}


	})

})




</script>

    
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
                <img src="${root}/resources/images/end_step2.png">
             </article>
           
            <article class="join-choice-input">
                <h3>회원 정보 입력 <span id="must-input">* 필수입력사항</span></h3> 
              
               
                <table width="900px" border="1">
                    <tr>
                        <td>

                            이름<span id="must-input">* </span>
                            
                        </td>
                        <td>

                            <input type="text" id="name" name="name">
                            <p class="member-red-info"></p>
                        </td>

                        
                    </tr>
                    <tr>

                        <td>

                            이메일 주소<span id="must-input">* </span>

                        </td>
                        <td>
                            
                            <input type="email" id="email" name="email">
                            <p class="member-red-info"></p>
                        
                        </td>
                    </tr>
                 
                </table>
               

                    <div id="btns-wrap">  
						<input type='hidden' name="is" >
                        <input type="reset"  class="join-btns" value="취소">
                        <input type="submit" class="join-btns" value="확인">
                        
                    </div>


            </article>

            <article class="join-choice-input" id="frm-area">
 				
 					
 					             
               
            </article>
        
        </section>
    
      

    </div>
    <!--//콘텐츠-->

    
<%@ include file="/WEB-INF/views/include/footer.jsp" %>  
