<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="${root}/resources/css/common.css">
    <link rel="stylesheet" type="text/css" href="${root}/resources/css/confirmMypage.css">
   	<script src="${root}/resources/js/jquery-3.1.1.min.js"></script>
    <script src="${root}/resources/js/jquery-ui.min.js"></script>
    <script src="${root}/resources/js/jquery.easing.1.3.js"></script>
    <script src="${root}/resources/js/jquery.mousewheel.min.js"></script>
    

    
    <title>회원가입</title>

</head>


<!--전체-->
<%@ include file="/WEB-INF/views/include/header.jsp" %>    
    

        <nav>
            
            <h1>마이페이지</h1>
            <ul id="member-tab">
                <li id="click-menu"><a>마이페이지</a></li>
                <li ><a>예매내역</a></li>
          
            </ul>

        </nav>

        <section >
            <article class="agree-service">
                <img src="${root}/resources/images/end_step2.png">
             </article>
           
            <!--  <article class="join-choice-manner">
                <h3>휴대폰 인증</h3>
                <br>
                <p> 본인명의 휴대전화번호와 생년월일 정보로 실명 인증을 하는 <br>서비스입니다.</p>
                <div class="devide-join-age-window">
                    
                    
                    <h4>
                    <img  src="${root}/resources/images/phone_step2.png">
                    </h4>
                </div>
                <div class="btns"><a href="#">휴대폰 인증</a></div>
            </article>-->

            <article class="join-choice-manner" style="margin-left:220px">
                <h3>이메일 인증</h3>
                <br>
                <p> 본인명의 이메일 정보로 실명 인증을 하는 <br>서비스입니다.</p>
                <div class="devide-join-age-window">
                    
                    
                    <h4>
                    <img id="mail-img"src="${root}/resources/images/mail-1454733_640.png">
                    </h4>
                </div>
                <div class="btns"><a href="/member/inputYourEmail">이메일 인증</a></div>
            </article>
        
        </section>

          </div>
    <!--//콘텐츠-->


    
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
    