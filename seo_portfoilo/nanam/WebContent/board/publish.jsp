<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file ="../main/header.jsp"%>




<link rel="stylesheet" type="text/css" href="${nanam}/css/notice.css">

<!--테이블전체 영역-->
<div id="noticetableWrap">

	<!--테이블 box-->


	<!--basebar-->
	<div class="basebar">
		<ul>
			<li><a href="#">메인</a></li>
			<li>></li>
			<li><a href="#">출판</a></li>
			<li>></li>
			<li><a href="#">공지사항</a></li>
		</ul>
	</div>
	<!--//basebar-->
	<!--테이블 영역-->
	<div id="tableWrap">
		<h2>언론이 본 나남 페이지 입니다.</h2>

		<table id="noticeTable">
			<thead>
				<tr>
					<th>전체글 번호</th>
					<th>번호</th>
					<th class="caption">제목</th>
					<th>등록일</th>
				
				</tr>
			</thead>
			<tbody>
				<c:set var="li" value="${li}"/>
		<tbody>
			<c:forEach var="i" items="${c}" begin="0" end="10" step="1"
				varStatus="status">
				<tr class="caption">
					<td>${i.qseq }</td>
					<td>${status.count}</td>
					<td><a href="/nanam/board/showDetail?list=${i.list}&subject=${i.subject}&content=${i.content}">${i.subject}</a></td>
					<td>${i.adjustIndate}</td>
				
				</tr>

			</c:forEach>
			</tbody>


		</table>

	</div>
	<!--//테이블 영역-->
	

	<!--테이블 box-->


</div>
<!--테이블전체 영역-->

<%@ include file ="../main/footer.jsp"%>