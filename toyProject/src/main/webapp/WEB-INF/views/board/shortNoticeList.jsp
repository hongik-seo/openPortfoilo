<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet"  type="text/css" href="${root}/resources/css/common.css"> 
    <link rel="stylesheet"  type="text/css" href="${root}/resources/css/shortNotice.css"> 

    <title>공지사항</title>


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
        

        <div id="community-wrap">

            <h2>공지사항</h2>
            <table id="community-table" border="1">

                <thead>
                    <tr>
                        <th>
                            번호

                        </th>
                        <th>
                            제목
                            
                        </th>
                        <th>
           	내용
                            
                        </th> 
                        
                        <th>

                            첨부
                        </th>
                        <th>

                            등록일
                        </th>
                   


                    </tr>

                </thead>

                <tbody>
                
                <c:forEach var="list" varStatus="status" items="${list}">
                    <tr>
                        <td>
                           ${status.count}

                        </td>
                        <td>
                           	 ${list.boardSubject}

                        </td>

                        <td>
              				
							<a  href='/board/noticeBoardDetail?list=${list.id}&index=${status.count}&prev=${list.id-1}&next=${list.id+1}'>${list.boardContent}</a>
                        </td>

                        <td>
                      		
														                      		
                      		<c:if test="${!empty list.boardOriFileName}">
									Y
							
							</c:if>
							
							
                        </td>
						<td>
						
							 ${list.boardWriterDate}						
						
						</td>


                    </tr>
				</c:forEach>
                </tbody>
                
                

            </table>
			<div id="inHere">
						<ul class='pagination'>
                            		<c:if test="${pageMark.prev}">
                            		<li style='list-style: none' class='paginate_button previous'>
                            			<a href='/board/boardList?pageNum=${pageMark.startPage -1 }'>Previous</a>
                            		</li>
                            		
                            		</c:if>	
                            		
                            		<c:forEach var='num'   begin='${pageMark.startPage}' end='${pageMark.endPage }'>
                            		
                            			<li  style='list-style: none'  class='paginate_button'   >
                            			<c:choose>
                            				<c:when test="${num == pageMark.pageNum}">
                            					<span style="color: red;">${num}</span>
                            				</c:when>
                            				<c:otherwise>
                            					<a class="blockLink" href="/board/boardList?on=04&pageNum=${num}&amount=${pageMark.amount }">${num}</a>	
                            				</c:otherwise>
                            			</c:choose>
                            				
                            			</li>
                            			
                            		</c:forEach>
                            		
                            		<c:if test="${pageMark.next}">
                            		
                            			<li style="list-style: none" class="paginate_button next">
                            			<a href="/main.ino?pageNum=${pageMark.endPage +1 }">Next</a>
                            			
                            			</li>
                            		</c:if>
                            	
                            	
                            	</ul>
                            </div>	
		

        </div>
		

  </div>
        <!--//콘텐츠-->
        
<%@ include file="/WEB-INF/views/include/footer.jsp" %>   
            