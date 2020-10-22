<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../main/header.jsp"%>
<link rel="stylesheet" href="${nanam}/css/inputNotice.css">




<!--인풋전체 영역-->

<!--인풋전체 영역-->
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
		<form id="sForm" action="/nanam/board/inputBoard" method="get">
			<!--게시판 리스트 옵션 선택-->
			<div id="noticeListWrap">
				<!--분류-->
				<div id="choiceNotice" class="caption">
					<h2>업로드 게시판</h2>
					<!--캡션-->
					
					<select style="width: 150px;" name="list" id="list">
						<option value='essay'>발행인 에세이</option>
						<option value='nanam'>언론이 본 나남</option>
						<option value='notice'>공지사항</option>
					</select>
				</div>
				<!--//분류-->
				<!--제목 입력창 영역-->
				<div id="inputTitle" class="caption">
					<p>제목</p>
					<!--제목 폼-->

					<input type="text" id="subject" class="write" name="subject">

					<!--제목 폼-->
				</div>
				<!--//제목 입력창-->

			</div>
			<!--//게시판 리스트 옵션 선택-->
			<!--본문 입력창 영역-->
			<div id="inputBody" class="caption">

				<div id="bodyArea">
					<p>본문</p>

					<textarea id="content" name="content" class="write" cols="40" rows="8"></textarea>

				</div>

				<!--등록 버튼-->

				<div id="inputBtnWrap">
					<button type="submit" class="inputBtn" id="onList" >등록</button>

					<button type="reset" class="inputBtn">취소</button>
				</div>

				<!--//등록버튼-->
			</div>

			<!--//본문 입력창 영역-->

		</form>
	</div>
	<!--//inner인풋 영역-->

</div>
<!--//인풋전체 영역-->
<!-- //인풋 전체영역 -->

<%@ include file="../main/footer.jsp"%>
