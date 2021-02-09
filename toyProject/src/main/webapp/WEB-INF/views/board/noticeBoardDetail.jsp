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
    <link rel="stylesheet"  type="text/css" href="${root}/resources/css/boardDetail.css"> 

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
        

        <div id="community-wrap">
			
            <h2>공지사항</h2>
            <table id="community-table" border="1">

                <thead>
					<tr>
                        <td>

                            작성자

                        </td>
                    
                        <td>
                            번호

                        </td>
                        <td id="subject">
                            제목
                            
                        </td>
                        <td>

                            첨부
                        </td>
                        <td>

                            등록일
                        </td>

                        <td>
                            조회수
                        </td>

                    </tr>

                </thead>


				<c:forEach var="noticeDetail" items="${noticeDetail}">
                <c:if test="${noticeDetail.id eq list }">
                
                    <tr>
                        <td>

                            ${noticeDetail.boardWriter }

                        </td>
                        <td>
                           	${index}

                        </td>
                        <td>
                          	 ${noticeDetail.boardSubject }

                        </td>

                        <td>
                        
						<form action="/board/download/" method="post">                        
                         ${noticeDetail.boardOriFileName}                           
                           <input type='hidden' name="file" value="${noticeDetail.boardOriFileName}"/>
                           <input type="submit" value="파일 다운로드">
                         </form>
                        </td>

                        <td>
                        	
 						${noticeDetail.boardWriterDate }

                        </td>

                        <td id="hit">
                            ${noticeDetail.boardHitNumber}			

                        </td>


                    </tr>
                    
                    
                    	</tbody>

            	</table>
					
            
			</c:if>
			</c:forEach>
			</table>
            <table id="next-prev-table" border="1">

                <thead>
                    <tr>
                    
                        <th>
                            이전글				
                        </th>
                     
                    
                    
                        <td>
                          <c:forEach var="noticeDetail" items="${noticeDetail}" varStatus="status">
                			<c:if test="${noticeDetail.id eq prev }">
								
								<a href='/board/noticeBoardDetail?list=${noticeDetail.id}&index=${status.count}&prev=${noticeDetail.id-1}&next=${noticeDetail.id+1}'>${noticeDetail.boardSubject}</a>
								
								
							</c:if>
							</c:forEach>
							
                        </td>
         		 
                    </tr>
                    <tr>

                       
                        <th>
                            다음글                     

                        </th>
                         
                        <td>

                           <c:forEach var="noticeDetail" items="${noticeDetail}" varStatus="status">
                			<c:if test="${noticeDetail.id eq next }">
								
								<a href='/board/noticeBoardDetail?list=${noticeDetail.id}&index=${status.count}&prev=${noticeDetail.id-1}&next=${noticeDetail.id+1}'>${noticeDetail.boardSubject}</a>
								
								
							</c:if>
							</c:forEach>
                        </td>

                        
                    </tr>
                   
                </thead>
              
            </table>


        </div>


        </div>
        <!--//콘텐츠-->    

<%@ include file="/WEB-INF/views/include/footer.jsp" %>