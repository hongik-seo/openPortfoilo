<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file ="../main/header.jsp"%>

<link rel="stylesheet" type="text/css" href="${nanam}/css/notice.css">




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



		<h2>발행인 에세이 입니다.</h2>


<div id="tableWrap">
	<table id="noticeTable">

		<thead>
			<tr>
				<th>전체글 번호</th>
				<th>번호</th>
				<th class="caption">제목</th>
				<th>등록일</th>
				
			</tr>
		</thead>

		<c:set var="li" value="${li}"/>
		<tbody>
			<c:forEach var="i" items="${a}" begin="0" end="10" step="1"
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




<%@ include file ="../main/footer.jsp"%>