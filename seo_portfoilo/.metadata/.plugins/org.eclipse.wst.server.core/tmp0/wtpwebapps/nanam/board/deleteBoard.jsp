<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    


<%@ include file="../main/header.jsp"%>
    
<link rel="stylesheet" href="${nanam}/css/inputnotice.css">
<link rel="stylesheet" type="text/css" href="${nanam}/css/detailBoard.css">
      
   <c:set var="b" value="${b }" />    
        
  <form id="sForm" action="/nanam/board/deleteBoardMain" method="get">
  
  
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
				
				<label for="qseq" > 삭제할 qseq</label>
				<input type="text" id="qseq" name="qseq" value="${b.qseq }" readonly/>
				<label for="subject2">삭제할 글 제목</label>
				<input type="text" id="subjecta" class="write" name="subject" value="${b.subject }" readonly>
				<label for="content">삭제할 글 내용</label>
				<input type="text" id="contenta" class="write" name="content" value="${b.content }" readonly>
			</div>
			
			
			
				<!--분류-->
				<div id="choiceNotice" class="caption">
					<p>수정 게시판</p>
					<!--캡션-->
					<!--  <select style="width: 150px;" name="list" id="list">
						<option value='essay'>발행인 에세이</option>
						<option value='nanam'>언론이 본 나남</option>
						<option value='notice'>공지사항</option>
					</select>-->
					
				
					
				</div>
				<!--//분류-->
				<!--제목 입력창 영역-->
				<div id="inputTitle" class="caption">
					<p>제목</p>
					<!--제목 폼-->
					

					
		

				<!--등록 버튼-->

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