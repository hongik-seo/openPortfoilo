<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet"  type="text/css" href="${root}/resources/css/common.css"> 
    <link rel="stylesheet"  type="text/css" href="${root}/resources/css/nav.css"> 
</head>
<%@ include file="/WEB-INF/views/include/header.jsp" %>   

		<nav>
                <h1>커뮤니티</h1>
                <ul id="member-tab">
                    <li ><a>공지사항</a></li>
                    <li ><a>자주하는 질문</a></li>
                    <li id="click-menu"><a>자유게시판</a></li>
                </ul>
        </nav>

		<div style="margin-top:100px; display:inline-flex;">
	
		<h2 style="padding:160px;"><a href="/board/adminBoardFrequncyPage">자주 하는 질문 페이지 글쓰기</a></h2>
	
	
		<h2 style="padding:160px;"><a  href="/board/adminBoardNoticePage">공지사항 글쓰기 글쓰기</a></h2>
	
	</div>
	
	
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>  