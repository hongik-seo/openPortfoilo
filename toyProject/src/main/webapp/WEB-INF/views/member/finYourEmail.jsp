<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="emailDTO" value="${key}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="${root}/resources/js/jquery-3.1.1.min.js"></script>
    <script src="${root}/resources/js/jquery-ui.min.js"></script>
    <script src="${root}/resources/js/jquery.easing.1.3.js"></script>
    <script src="${root}/resources/js/jquery.mousewheel.min.js"></script>
    <script src="${root}/resources/js/finYourEmail.js"></script>
    <link rel="stylesheet" type="text/css" href="${root}/resources/css/common.css">
    <link rel="stylesheet" type="text/css" href="${root}/resources/css/inputUserInfo.css">
    
   

    
    <title>인증과정</title>



</head>
<script>




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

              	귀하의 이름<span id="must-input">* </span>

                        </td>
						<td>
							
								<input type="text" id="emailName" name="emailName" value="${emailDTO.emailName}" readonly="readonly">
								<p class="member-red-info"></p>
							
		
						</td>

							</tr>
	                    
	                       <tr>

                        <td>

              	발송 이메일 주소<span id="must-input">* </span>

                        </td>
	                        <td>
	                            
	                            <input type="text" id="emailFrom" name="emailFrom" >
	                            <p class="member-red-info"></p>
		                        
		                    </td>
	             
	                    </tr>
	                
	                    <tr>

                        <td>
                       

              귀하의 인증관련 이메일<span id="must-input">* </span>

                        </td>
	                        <td>
	                            
	                            <input type="text" id="emailTo" name="emailTo" value="${emailDTO.mailTo}" readonly="readonly">
	                            <p class="member-red-info"></p>
		                        
		                    </td>
	             
	                    </tr>
	                
	                    <tr>

                        <td>


                            이메일 제목<span id="must-input">* </span>

                        </td>
                        <td>
                            
                            <input type="text" id="emailTitle" name="emailTitle" >
                            <p class="member-red-info"></p>
                        
                        </td>
             
                    </tr>
                    <tr>

                        <td>

                            이메일 내용<span id="must-input">* </span>

                        </td>
                        <td>
                            
                            <input type="email" id="emailContent" name="emailContent">
                            <p class="member-red-info"></p>
                        
                        </td>
             
                    </tr>
                    
                       <tr>

                        <td>

             	인증키 <span id="must-input">* </span>

                        </td>
                        <td>
                            
                            <input type="text" id="inputKey" name="inputKey">
                            <p class="member-red-info"></p>
                        
                        </td>
             
                    </tr>
                 
                 
                 
                </table>
               

                    <div id="btns-wrap">  
                    
                    

                        <input type="reset"  class="join-btns" value="취소">
                        <input type="submit" class="join-btns" value="확인" onclick="finYourEmail();" >
                        
                    </div>

				<form id="BeforeJoinFrm">
					<input type="hidden" name="emailContent">
					<input type="hidden" name="emailName">
					<input type="hidden" id="confirmKey" name='emailKey' value="${emailDTO.emailKey}">
            	</form>


            </article>

            <article class="join-choice-input" id="frm-area">
               
               
            </article>
        
        </section>
    
      

    </div>
    <!--//콘텐츠-->

    
<%@ include file="/WEB-INF/views/include/footer.jsp" %>  
