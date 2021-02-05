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
    <link rel="stylesheet" type="text/css" href="${root}/resources/css/login.css">
    
    
    <title>로그인</title>

	<script>
	
	$(function(){
		
		
		$("input[type='button']").click(function(){
			
			
			var id=$("input[name='id']").val();
            var pwd=$("input[name='pwd']").val();
			
            
           var login= {
    	    	"id":id,
    	    	"pwd":pwd
    	    	
    	    }
			
        	$.ajax({
        	    url:'/admin/adminLoginMap', //request 보낼 서버의 경로
        	    type:'POST', // 메소드(get, post, put 등)
        	    dataType:"json",
        	    data:JSON.stringify(login),
        	    contentType : "application/json; charset=UTF-8",
        	    
        	    success: function(data) {
        	      
        	    	
        	    	console.log(data);
        	    	
        	    	if(data.admin==null){
        	    		
        	    		alert("로그인 정보가 올바르지 않습니다.");
        	    		
        	    		return false;
        	    	}else{
        	    		
        	    	
        	    		alert("다음페이지로 이동합니다.");
        	    		location.href="/main"
                	    return true;
        	    		
        	    	}
        	    	
        	    	
        	    },
        	    error: function(err) {
        	        //서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행
        	    }
        	
        	});
			
			
			
		})	
		
		
		
	})
	
	</script>

</head>



<%@ include file="/WEB-INF/views/include/header.jsp" %>

			<nav>
            
                <h1>부가 서비스</h1>
                <ul id="member-tab">
                    <li id="click-menu"><a>로그인</a></li>
                    <li><a>아이디*비밀번호찾기</a></li>
                    <li><a>회원가입</a></li>
                    <li><a>개인정보처리방침</a></li>
                    <li><a>이용약관</a></li>
                    <li><a>이메일 무단수집 거부</a></li>
                    <li><a>영상정보처리기기 운영관리</a></li>
                </ul>


        	</nav>

        <section>
        
            <h2>admin 로그인</h2>
            <article>
                <div id="login-window">
                    <img src="${root}/resources/images/logo.png">

                    <form id="loginFrm">
                        <input type="text" id="id" name="id" class="login-input" placeholder="아이디 입력창"/>
                        <input type="password" id="pwd" name="pwd" class="login-input" placeholder="비밀번호 입력창"/>
                        <input type="button" class="login-input" value="로그인"/>
                        <input type="checkbox" id="save-id"><label for="save-id">아이디 저장</label>
                    </form>


                </div>
            </article>
           
        
        </section>



    </div>
    <!--//콘텐츠-->
    


<%@ include file="/WEB-INF/views/include/footer.jsp" %>