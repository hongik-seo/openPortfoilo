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
    <link rel="stylesheet" type="text/css" href="${root}/resources/css/idPwdFind.css">

<script type="text/javascript">
	
	$(function(){
			
			
		$("input[type='button']").each(function(i){	
			
			$($("input[type='button']").eq(i)).click(function(){
				
				
				var flag=$($("input[name='flag']").eq(i)).val();
				
				console.log(flag)
				
			if(flag=="idFind"){
					
					var name=$($("input[name='name']").eq(0)).val();

					var email=$($("input[name='email']").eq(0)).val();
					
					
					var find={
							"name":name,
							"email":email,
							"flag":flag
					}
					
					$.ajax({
		        	    url:'/member/idPwdfindIsPresent', //request 보낼 서버의 경로
		        	    type:'POST', // 메소드(get, post, put 등)
		        	    dataType:"json",
		        	    data:JSON.stringify(find),
		        	    contentType : "application/json; charset=UTF-8",
		        	    
		        	    success: function(data) {
		        	      
		        	    	
							console.log(data)
		        	    	
		        	    	$("#id-find-result").text("고객님의 아이디는 :"+data.find.joinId+"입니다")
		        	    	
		        	    },
		        	    error: function(err) {
		        	        //서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행
		        	    }
					
					
					})
					
				}else if(flag=="pwdFind"){
					
					var id=$("input[name='id']").val();

					var name=$($("input[name='name']").eq(1)).val();

					var email=$($("input[name='email']").eq(1)).val();
					
					var find={
							"id":id,
							"name":name,
							"email":email,
							"flag":flag
					}
					
					
					$.ajax({
		        	    url:'/member/idPwdfindIsPresent', //request 보낼 서버의 경로
		        	    type:'POST', // 메소드(get, post, put 등)
		        	    dataType:"json",
		        	    data:JSON.stringify(find),
		        	    contentType : "application/json; charset=UTF-8",
		        	    
		        	    success: function(data) {
		        	      
		        	    	console.log(data)
		        	    	
		        	    	$("#pwd-find-result").text("고객님의 비밀번호는"+data.find.joinPassword+"입니다." )
		        	    	
		        	    	var app="";
		    		    
		        	    	app+="<input type='hidden' name='full' value='allFind'>"
		        	    	app+="<input type='submit' id='originalPwd' value='이메일로 완전한 비밀번호 받기'>"
		        	    	
		        	    	document.getElementById("frm-area").innerHTML =app
		        	    
		        	    	$("#originalPwd").click(function(){
		        	    		
		        	    		var full=$("input[name='full']").val();
		        	    		
		        	    		
		        	    		location.href="/email/confirmYourEmail?id="+id+"&name="+name+"&full="+full+"&email="+email
		        	    		
		        	    	})
		        	    	
		        	    	
		        	    
		        	    	
		        	    	
		        	    },
		        	    error: function(err) {
		        	        //서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행
		        	    }
		        	    
		        	    
					})
					
				}
							
					
				
			})
			
			
			
		})
		
		
	})
</script>



</head>

<%@ include file="/WEB-INF/views/include/header.jsp" %>   

  <nav>
            
                <h1>부가 서비스</h1>
                <ul id="member-tab">
                    <li ><a>로그인</a></li>
                    <li id="click-menu"><a>아이디*비밀번호찾기</a></li>
                    <li><a>회원가입</a></li>
                    <li><a>개인정보처리방침</a></li>
                    <li><a>이용약관</a></li>
                    <li><a>이메일 무단수집 거부</a></li>
                    <li><a>영상정보처리기기 운영관리</a></li>
                </ul>


        </nav>

        <section>
        
            <h2>아이디 비밀번호찾기</h2>
            <article>
                    <h3>아이디찾기</h3>
                <div id="id-window" class="login-window">
                    
					
                        <label for="name">이 름</label>
                        <input type="text"  name="name" class="login-input" placeholder="이름 입력창"/>
                        <label for="idEmail">이메일 입력창</label>
                        <input type="email"  name="email" class="login-input" placeholder="이메일 입력창"/>
                        <input type="button" class="login-input" name="idFindBtn"  value="아이디찾기"/>
                        <input type='hidden' name='flag' value='idFind'/> 
                        <p id="id-find-result" style="color:red"></p>
                 		

                </div>
            </article>
           

            <article>
                    <h3>비밀번호 찾기</h3>
                <div id="pwd-window" class="login-window">
                    
					
					
                        <label for="id">아이디</label>
                        <input type="text"  name="id" class="login-input" placeholder="아이디 입력창"/>

                        <label for="name">이 름</label>
                        <input type="text"  name="name" class="login-input" placeholder="이름 입력창"/>
                        
                        <label for="name">이메일 입력창</label>
                        <input type="email"  name="email" class="login-input" placeholder="이메일 입력창"/>
                        <input type='hidden' name='flag' value='pwdFind'/> 
                        <input type="button" class="login-input" name="pwdFindBtn" value="비밀번호 찾기"/>
                        <p id="pwd-find-result" style="color:red"></p>
                    	<div id="frm-area">
                 		
                 		</div>
 						

                </div>
                
               
            </article>
        
        </section>

      



    </div>
    <!--//콘텐츠-->