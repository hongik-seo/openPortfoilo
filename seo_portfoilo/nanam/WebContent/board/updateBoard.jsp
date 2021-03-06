<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    


<%@ include file="../main/header.jsp"%>
    
<link rel="stylesheet" href="${nanam}/css/inputnotice.css">
<link rel="stylesheet" type="text/css" href="${nanam}/css/updateBoard.css">
      
           
<c:set var="b" value="${b }"/>
        
<form id="sForm" action="/nanam/board/updateBoardMain" method="get">
  
<div id="noticeInputWrap">

	<!--inner인풋 영역-->
	<div id="noticeInputBox">
		<!--base bar-->

		<div class="basebar">
			<ul>
				<li><a href="#">메인</a></li>
				<li>></li>
				<li><a href="#">출판</a></li>
				<li>></li>
				<li><a href="#">관리자 페이지</a></li>
			</ul>
		</div>
		<!--//base bar-->
		
			<!--게시판 리스트 옵션 선택-->
			<div id="noticeListWrap">
			
			
			<div>
				
				<label for="qseq" > 수정할 qseq</label>
				<input type="text" id="qseq" name="qseq" value="${b.qseq }" readonly/>
				<label for="subject2">수정할 글 제목</label>
				<input type="text" id="subject2" class="write" name="subjecta" value="${b.subject }" readonly>
				<label for="content">수정할 글 내용</label>
				<input type="text" id="content2" class="write" name="contenta" value="${b.content }" readonly>
			</div>
			
			
			
				<!--분류-->
				<div id="choiceNotice" class="caption">
					<h2>수정 게시판</h2>
					
		
				</div>
				<!--//분류-->
				<!--제목 입력창 영역-->
				<div id="inputTitle" class="caption">
					<p>제목</p>
					<!--제목 폼-->
					

					
		<input type="text" id="subject" class="write" name="subject" placeholder="${b.subject}" >
					<!--제목 폼-->
				</div>
				<!--//제목 입력창-->

			</div>
			<!--//게시판 리스트 옵션 선택-->
			<!--본문 입력창 영역-->
			<div id="inputBody" class="caption">

				<div id="bodyArea">
					<p>본문</p>

					<textarea id="content" name="content" class="write" cols="40" rows="8" placeholder="${b.content}"  ></textarea>

				</div>

				<!--등록 버튼-->

				<div id="inputBtnWrap">
					<button type="submit" class="inputBtn" id="onList" >수정</button>

				</div>

				<!--//등록버튼-->
			</div>

			<!--//본문 입력창 영역-->

	</div>
	<!--//inner인풋 영역-->

</div>
</form>
<!--//인풋전체 영역-->
<!-- //인풋 전체영역 -->

<%@ include file="../main/footer.jsp"%>