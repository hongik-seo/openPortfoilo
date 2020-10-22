<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<c:set var="nanam" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
	<link rel="stylesheet" href="${nanam}/css/common.css" type="text/css" >
	<link rel="stylesheet" href="${nanam}/css/header.css" type="text/css" >
	
	
	
	
	
	<script type="text/javascript"
		src="${nanam}/js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript"
		src="${nanam}/js/jquery-ui.min.js"></script>
	<script type="text/javascript"
		src="${nanam}/js/jquery.easing.1.3.js"></script>
	<script type="text/javascript"
		src="${nanam}/js/prefixfree.min.js"></script>
	<script type="text/javascript" src="${nanam}/js/custom.js"></script>
	<script type="text/javascript"
		src="${nanam}/js/jquery.skitter.js"></script>
	<script type="text/javascript"
		src="${nanam}/js/jquery.skitter.min.js"></script>

    <script>
        function openWindowPop(){
            var url = "/nanam/pay/point.jsp";
            var name = "popup test";
            var option = "width = 500, height = 500, top = 100, left = 200, location = no"
            window.open(url, name, option);
        }
    </script>


<c:set var="leaveOut" value="${leaveOut}"/>
</head>
<body>
	<!--헤더-->
	<header>
		<div id="headerWrap">
			<!--헤더박스-->

			<div id="headerBox">
				<!--로고-->
				<a title="메인페이지로 이동" href="${nanam}/main"> <img
					src="${nanam}/images/arr/logo2.gif" alt="로고 메인페이로 이동">
				</a>



				<!--//로고-->
				<!--검색창 로그인링크-->



				<ul id="moveLoginJoin">
					<c:choose>
						<c:when test="${empty sessionScope.login}">
						
						
											
							<li><a title="로그인" href="${nanam}/member/loginFront">
									로그인</a></li>
								
							<li><a title="회원가입페이지로 이동" href="${nanam}/member/agreeFront">
									회원가입</a></li>
						</c:when>
						<c:otherwise>

							<li><a title="로그아웃" href="${nanam}/member/logoutFront">로그아웃

							</a></li>


							<c:if
								test="${sessionScope.login.id ne 'scott' and login.pwd ne 'tiger'}">
								<li><a title="회원 탈퇴 페이지로 이동"
									href="${nanam}/member/leaveOutFront"> 회원탈퇴</a></li>
								<li><a href="javascript:openWindowPop();">포인트 충전</a></li>
								<li><a title="정보수정 페이지로 이동"
									href="${nanam}/member/myPageInfo"> 정보수정 </a></li>
								
								<li><a title="포인트 결과로 이동"
									href="${nanam}/member/myPageResult"> 보유 포인트 결과</a></li>
								<li><a title="장바구니로 이동"
									href="${nanam}/pay/cartBookSelect?hid=${login.id}"> 장바구니</a></li>
							</c:if>
							

						</c:otherwise>
					</c:choose>
				</ul>

				<!--//검색창 로그인링크-->


				<!--gnb전체-->
				<div id="gnbWrap">

					<!--토글메뉴-->
					<img id="dropDownImg"
						src="./images/png-transparent-hamburger-button-computer-icons-drop-down-list-menu-angle-food-text.png">
					<!--//토글메뉴-->
					<div id="dropDownMenu">
						<ul>
							<li id="dropFirst">나남의책</li>
							<li class="dropF"><a title="새로나온책"
								href="../newbooks/newbooks.html">새로나온책 </a></li>

							<li class="dropF"><a title="스테디셀러"
								href="../steadyseller/steadyseller.html">스테디셀러</a></li>

							<li class="dropF"><a title="나남의책들"
								href="../booksofnanam/booksofnanam.html">나남의 책들</a></li>
						</ul>
						<ul>
							<li id="dropSecond">나남출판</li>
							<li class="dropS"><a title="발행인 인사말"
								href="../introduce/introduce.html">발행인 인사말</a></li>

							<li class="dropS"><a title="발행인 에세이"
								href="../notice/notice.html">발행인 에세이</a></li>

							<li class="dropS"><a title="언론이 본 나남"
								href="../notice/notice.html">언론이 본 나남</a></li>

							<li class="dropS"><a title="언론이 본 나남"
								href="../notice/notice.html">공지사항</a></li>
						</ul>


					</div>
					<!--//토글메뉴-->



					
						
				




					<ul id="gnbBox">


						<!--gnb 북-->
						<li class="gnb"><a title="책" href="${nanam}/book/newBookFront"
							class="depth1" id="book">책 <span> BOOKS </span>
						</a> <!--lnb-->
							<div class="book menu">
								<ul>
									<li><a title="새로나온책" href="${nanam}/book/newBookFront">새로나온
											책 </a></li>
									<li><a title="스테디셀러"
										href="${nanam}/book/steadyBookFront">스테디셀러 </a></li>
									<li><a title="나남의 책들"
										href="${nanam}/book/nanamBookFront">나남의 책들 </a></li>
										<c:choose>
								<c:when
								test="${sessionScope.login.id eq'scott' and login.pwd eq 'tiger'}">
									<li><a title="글쓰기" href="${nanam}/book/inputBookFront">책 글쓰기 
									
									</a></li>
									
								
									</c:when>
								</c:choose>
								</ul>
							</div> <!--//lnb--></li>
						<!--//gnb book-->
						<!--gnb 출판-->
						<li class="gnb"><a title="출판"
							href="../introduce/introduce.html" class="depth1" id="publish">출판
								<span> PUBLISHING HOUSE </span>
						</a> <!--lnb-->
							<div class="nanam menu">
								<ul>
									<li><a title="발행인 인사말" href="../introduce/introduce.html">
											발행인 인사말 </a></li>
									<li><a title="발행인 에세이" href="${nanam}/board/essayFront">발행인
											에세이 </a></li>
									<li><a title="언론이 본 나남" href="${nanam}/board/nanamFront">
											언론이 본 나남 </a></li>
									<li><a title="공지사항" href="${nanam}/board/noticeFront">
											공지사항</a></li>
								<c:choose>
								<c:when
								test="${sessionScope.login.id eq'scott' and login.pwd eq 'tiger'}">
									<li><a title="글쓰기" href="${nanam}/board/inputNoticeFront">글쓰기 
									
									</a></li>
									
								
									</c:when>
								</c:choose>
									
									
								</ul>
							</div> <!--//lnb--></li>
						<!--//gnb 출판-->
					</ul>
				</div>
				<!--//gnb전체-->

			</div>
			<!--헤더박스-->

		</div>
		<!--//헤더-->
	</header>