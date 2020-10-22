<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    


<%@ include file="../main/header.jsp"%>
    
<link rel="stylesheet" href="${nanam}/css/inputnotice.css">
<link rel="stylesheet" type="text/css" href="${nanam}/css/detailBoard.css">
      
           
        
  <form id="sForm" action="/nanam/book/deleteBookMain" method="get">
  
  
            <!--basebar-->
            <div class="basebar">
                <ul>
                    <li>
                        <a href="#">메인</a>
                    </li>
                    <li>></li>
                    <li>
                        <a href="#">출판</a>
                    </li>
                    <li>></li>
                    <li>
                        <a href="#">에세이</a>
                    </li>
                </ul>
            </div>
            <!--//basebar-->
           
        
    
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
				<li><a href="#">공지사항</a></li>
			</ul>
		</div>
		<!--//base bar-->
		
			<!--게시판 리스트 옵션 선택-->
			<div id="noticeListWrap">
			
			
			<div>
				
				<label for="ISBN" > 삭제할 책의 ISBN</label>
				<input type="text" id="ISBN" name="ISBN" value="${book.ISBN }" readonly/>
				<label for="bookTitle">삭제할 책제목</label>
				<input type="text" id="bookTitle" class="write" name="bookTitle" value="${book.bookTitle }" readonly>
			
			</div>
			
			
			
				<!--분류-->
				<div id="choiceNotice" class="caption">
					<p>책 삭제</p>
				

				<div id="inputBtnWrap">
					<button type="submit" class="inputBtn" id="onList" >삭제</button>

				</div>

				<!--//등록버튼-->
			</div>

			<!--//본문 입력창 영역-->

	</div>
	<!--//inner인풋 영역-->
</div>
</div>
</form>
<!--//인풋전체 영역-->
<!-- //인풋 전체영역 -->

<%@ include file="../main/footer.jsp"%>