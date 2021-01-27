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
    <link rel="stylesheet" type="text/css" href="${root}/resources/css/JoinFin.css">
  
    
    <title>회원 가입 완료</title>

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
       
        <section>
            <article class="agree-service">
                <img src="${root}/resources/images/end_step4.png">
             </article>
           
            <article class="join-clear-input">
               
                <h3>아트센터 인천 회원가입이 완료되었습니다.</h3>
                <p>로그인 후 공연예매 등 회원서비스를 이용하실 수 있습니다.</p>
                    <div id="btns-wrap">

                     <ul>

                        <li class="clear-btns"><a href="/main">홈으로</a></li>
                        <li class="clear-btns"><a href="/member/login">로그인</a></li>
                     </ul>
              
                    </div>


         
            </article>

          
        
        </section>
   
      



    </div>
    <!--//콘텐츠-->
<%@ include file="/WEB-INF/views/include/footer.jsp" %>