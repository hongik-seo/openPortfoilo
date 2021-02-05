<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="${root}/resources/js/jquery-3.1.1.min.js"></script>
    <script src="${root}/resources/js/jquery-ui.min.js"></script>
    <script src="${root}/resources/js/jquery.easing.1.3.js"></script>
    <script src="${root}/resources/js/jquery.mousewheel.min.js"></script>
    <link rel="stylesheet"  type="text/css" href="${root}/resources/css/common.css"> 
    <link rel="stylesheet"  type="text/css" href="${root}/resources/css/adminBoardModifyPage.css"> 

    <title>자주하는 질문</title>
	

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
   	 <h2>업로드 게시판</h2>
		<!--base bar-->
		<article style="margin:300px;">
		<form  method="POST"  action="/board/updateFrm" enctype="multipart/form-data" >
			
                    <select style="width: 190px;height: 50px;" name="boardKind" id="list">
                    	<optgroup label="자주하는 질문">
							<option value='01' 	<c:if test="${boardKind eq 1}">selected </c:if>>공연안내*예매</option>
							<option value='02'	<c:if test="${boardKind eq 2}">selected </c:if>>대관</option>
                        	<option value='03' 	<c:if test="${boardKind eq 3}">selected </c:if>>기타</option>
                        </optgroup>
                        <optgroup label="공지사항">
                        	<option value="04" 	<c:if test="${boardKind eq 4}">selected </c:if> >공지사항</option>
						</optgroup>
					</select>
				
					<p>제목</p>
					<!--제목 폼-->

					<input type="text" id="subject" class="write" name="boardSubject" value="${boardSubject}" placeholder="${boardSubject}">

					<!--제목 폼-->
				
					<p>작성자</p>
					<!--제목 폼-->

					<input type="text" id="writer" class="write" name="boardWriter" value="${adminSession}" placeholder="${adminSession}" readonly="readonly">


					<p>본문</p>

					<textarea id="content" name="boardContent" class="write" cols="40" rows="8" placeholder="${boardContent}">${boardContent}</textarea>

                
					<c:if test="${boardKind eq 4 }">
                    	<input type="file" name="boardFileLocation">
					</c:if>
              

				<!--등록 버튼-->

				
					<button type="submit" class="inputBtn" id="onList" >등록</button>

					<button type="reset" class="inputBtn" onclick="reset()">취소</button>
			

			
			</form>
			</article>
	

</div>
<!--//인풋전체 영역-->
<!-- //인풋 전체영역 -->

<%@ include file="/WEB-INF/views/include/footer.jsp" %>