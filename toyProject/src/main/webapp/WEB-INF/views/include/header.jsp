<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:set var="pageMark" value="${pageMark}"/>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인 페이지</title>
    <script src="${root}/resources/js/jquery-3.1.1.min.js"></script>
    <script src="${root}/resources/js/jquery-ui.min.js"></script>
    <script src="${root}/resources/js/jquery.easing.1.3.js"></script>
    <script src="${root}/resources/js/jquery.mousewheel.min.js"></script>
    
  
    <link rel="stylesheet" type="text/css" href="${root}/resources/css/common.css">
    <link rel="stylesheet" type="text/css" href="${root}/resources/css/header.css">
    
    <script>  
    /*헤더*/
    $(function(){

      
        $("li.mouse").on("mouseenter",function(){

            $("ul.menu li").not(".mouse").css("display","block");

        });

        $("div#head").on("mouseleave",function(){

            $("ul.menu li").not(".mouse").css("display","none");

        });
        
        //nav hover
        $($("#member-tab").children()).each(function(i){

            $($($("#member-tab").children()).eq(i)).mouseenter(function(){


                $($($("#member-tab").children()).eq(i).not("#click-menu")).css({"background-color":"#8b6d49"})


            })


            $($($("#member-tab").children()).eq(i)).mouseleave(function(){


                $($($("#member-tab").children()).eq(i).not("#click-menu")).css({"background-color":"white"})


            })


        })
        

        
        
        
       

    });

</script>

 <script>
         
         $(function(){

         	$(".logout").click(function(){
         		
         		
         	var result=confirm("로그아웃 하시겠습니까")
         			
         			
         	 if(result){
                 return true;
             }else{
                 
            	 return false;
             }	
         		
         		
         		
         		
         	})
         	
         	
         	
         })
</script>

<script type="text/javascript">

	$(function(){
		
		$("a").click(function(){
			
			
			$(this).css("color","red");
			
			
		})
		
		
	})

	


</script>

</head>


<body>
    <!--전체-->
    <div id="all-wrap">
        <!--해더-->
        <div id="head">
            <div class="img-box">
               <a href="/main"><img id="logo" src="${root}/resources/images/logo.png" alt="logo"></a>
            </div>
    
            <!--맴버--> <!--마이페이지 추가해야 함-->
            <div id="member-gnb" class="space">
                <ul id="member">   
                    
                    <c:choose>
                    <c:when test="${empty loginCookie}"> 
                    <li><a href="/member/login">로그인</a></li>
                   	<li><a href="/member/agree">회원가입</a></li>
                   	<li><a href="/member/idPwdfind">아이디*비밀번호찾기</a></li>
                                        
                    </c:when>
                    <c:otherwise>
                    <li ><a class="logout" href="/member/logout">로그아웃</a></li>
                    <li><a>애매내역</a></li>
                    <li><a href="/member/selectMyMember">마이페이지</a></li>
                    </c:otherwise>
                   </c:choose>
                   
                  <c:choose>
                   <c:when test="${empty adminSession}">
                   	<li><a href="/admin/adminLogin">관리자 페이지 로그인</a></li>
                  	</c:when>
                  	<c:otherwise >
                  	<li><a class="logout" href="/admin/adminLogout">관리자 페이지 로그아웃</a></li>
                  	</c:otherwise>
                  </c:choose>	
                  	
                    <li><a><img src="${root}/resources/images/main_gnb_top_schedule.png"></a></li>
                    <li><a><img src="${root}/resources/images/main_gnb_top_info.png"></a></li>
                </ul>
            </div>
    
            <!--//맴버-->
    
            <!--gnb-->
            <div id="use-gnb">
    
                <ul id="performence-tiketting" class="menu">
                    <strong>
                    <li class="mouse"><a>공연안내*예매</a></li>
                    </strong>
                    <li><a>공연 일정</a></li>
                    <li><a>좌석안내</a></li>
                    <li><a>예매안내</a></li>
                </ul>
    
    
                <ul id="artcenter-inchone" class="menu">
                    <strong>
                        <li class="mouse"><a >공연장 소개 </a></li>
                    </strong>
                    <li><a>층별 안내</a></li>
                    <li><a>BI</a></li>
                    <li><a>오시는 길</a></li>
                    <li><a>주차 안내도</a></li>
                    <li><a>조직도</a></li>
                </ul>
    
                <ul id=" borrow-information" class="menu">
                    <strong>
                        <li class="mouse"><a>대관 안내 </a></li>
                    </strong>
                    <li><a>대관 절차 </a></li>
                    <li><a>대관 사용료</a></li>
                    <li><a>대관 공고</a></li>
                </ul>
    
                <ul id="comunity" class="menu">
                    <strong>
                        <li class="mouse"><a>커뮤니티 </a></li>
                    </strong>
                    <li><a href="/board/boardList?on=04">공지사항 </a></li>
                    <li><a href="/board/questingView">자주하는 질문</a></li>
                    <!--  <li><a>QNA</a></li>-->
                    <c:if test="${adminSession eq 'pageAdmin'}">
                    <li><a href="/board/adminChoice">관리자 글쓰기</a></li>
                    </c:if>
                    
                </ul>
            </div>
            <!--//gnb-->
    
    
        </div>
        <!--//해더-->
<div id="content-wrap">
 