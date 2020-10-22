<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../main/header.jsp"%>
    

<link rel="stylesheet" type="text/css" href="${nanam}/css/inputBook.css">

<!--인풋전체 영역-->

<!--인풋전체 영역-->
<div id="bookAllWrap">


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
		<form  action="/nanam/book/inputBook" method="get">
			<!--게시판 리스트 옵션 선택-->
			<div id="bookWrap">
		
					<h2>책 글쓰기</h2>
					<!--캡션-->

					<select style="width: 150px;" name="bookList" id="list">
						<option value='hot'>새로나온 책</option>
						<option value='steady'>스테디 셀러</option>
						<option value='nBook'>나남의 책들</option>
					</select>
				</div>
				<!--//분류-->
				<!--제목 입력창 영역-->
				<div  class="caption">
					<label for="title">책 제목</label>
					<input type="text" id="title" class="write" name="bookTitle">
					<br>
					<label for="author">책 저자</label>
					<input type="text" id="author" class="write" name="bookAuthor">
					<br>
					<label for="price">책 가격</label>
					<input type="text" id="price" class="write" name="bookPrice">
					<br>
					<label for="size">책 판형</label>
					<input type="text" id="size" class="write" name="bookSize">
					<br>
					<label for="page">책 면수</label>
					<input type="text" id="page" class="write" name="bookPage">
					<br>
					<label for="date">발행일</label>
					<input type="date" id="date" class="write" name="bookDate">
					<br>
					<label for="ISBN">ISBN</label>
					<input type="text" id="ISBN" class="write" name="ISBN">
					
					
					<p>본문</p>

					<textarea id="content" name="bookContent" class="write" cols="40"
						rows="8"></textarea>
						
			
						
					<p>목차 </p>
					<textarea id="content" name="bookIndex" class="write" cols="40"
						rows="8"></textarea>	
					<p>저자소개 </p>
					<textarea id="content" name="bookAuthorIntroduce" class="write" cols="40"
						rows="8"></textarea>	
					
					
					
					<input type="file" id="file" class="write" name="file">
					
					
					
					<br>
					
					<button type="submit" class="inputBtn" >등록</button>

					<button type="reset" class="inputBtn">취소</button>
				
					
		
			</div>

			<!--//본문 입력창 영역-->

		</form>
	

</div>
<!--//인풋전체 영역-->
<!-- //인풋 전체영역 -->

<%@ include file="../main/footer.jsp"%>
