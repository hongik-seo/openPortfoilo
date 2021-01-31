<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link rel="stylesheet" type="text/css" href="${root}/resources/css/mypage.css">
  
    
  
    <title>마이페이지 당신의 정보</title>


	<script type="text/javascript">
	
	function modi(){
		
		
		var modi=confirm("정보수정 페이지로 이동하시겠습니까")
		
		if(modi==true){
			
			location.href="/member/updateMyPage";
			
			return true;
			
		}else{
			
			
			return false;
		}
		
		
	}
	
	function del(){
		
		var del=confirm("정말로 탈퇴하시겠습니까")
		
		if(del==true){
			
			$("#del").append("<input type='hidden' name='joinUseYN' value='N'/>")
			
			$("#del").attr("action","/member/updateMyMember")
			$("#del").attr("method","POST")
			$("#del").submit();
			
			return true;
			
		}else {
			
		
			return false;
		}
		
		
	}
	
	
	</script>

</head>



<%@ include file="/WEB-INF/views/include/header.jsp" %> 
     <nav>
            
                <h1>마이 페이지</h1>
                <ul id="member-tab">
                    <li id="click-menu"><a>마이페이지</a></li>
                    <li ><a>예매내역</a></li>
              
                </ul>


        </nav>
      
        <section >
            <article class="agree-service">
                <img src="${root}/resources/images/end_step3.png">
             </article>
           
            <article  class="join-choice-input">
                <h3>회원 정보 입력 <span id="must-input">* 필수입력사항</span></h3> 
              
              	<form id="del" >
                <table  style="width:900px" border="1">
                    <tr>
                        <td>

                            아이디
                            
                        </td>
                        <td>
							
                            ${myPageDTO.joinId}
                            <input type='hidden' name='joinId' value="${myPageDTO.joinId}"/>
                            
                        </td>

                        
                    </tr>
                    <tr>
                        <td>

         	비밀번호
                            
                        </td>
                        <td>

                            ${myPageDTO.joinPassword}
                          
                        </td>

                        
                    </tr>
                    <tr>

                        <td>

                            이름

                        </td>
                        <td>

                          	 ${myPageDTO.joinName}
                        </td>
                    </tr>
                   
                    <tr>

                        <td>

                            생년월일
                            

                        </td>
                        <td>
                            
                            ${myPageDTO.joinBirthday}
                        </td>
                    </tr>

                    <tr>

                        <td>

                            연락처

                        </td>
                        <td>
                            
                           ${myPageDTO.joinPhoneNumber}
                        </td>
                    </tr>
                    <tr>

                        <td>

                            이메일 주소

                        </td>
                        <td>
                           
                           ${myPageDTO.joinEmail}
                        
                        </td>
                    </tr>
                   <tr> 

                        <td>

                            주소

                        </td>
                        <td>
                             ${myPageDTO.joinAddress}
                            
                        </td>
                    </tr>
                    <tr>

                        <td>

                            뉴스레이터 동의

                        </td>
                        <td>
                           ${myPageDTO.joinNewsletter}
                       
                        
                        </td>
                    </tr>
                </table>
               </form>
               			
					
                    <div id="btns-wrap">  

                        <input type="button" id="modiBtn"  class="join-btns" value="수정하기" onclick="modi();" >
                        <input type="button" id="delBtn" class="join-btns" value="탈퇴하기" onclick="del();">
                        
                    </div>
                 
			

            </article>

            <article class="join-choice-input">
               
               
            </article>
        
        </section>
   



    </div>
    <!--//콘텐츠-->
    
    

<%@ include file="/WEB-INF/views/include/footer.jsp" %> 
