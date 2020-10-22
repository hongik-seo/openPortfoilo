<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   <%@ include file="../main/header.jsp"%> 
       
    
    <link rel="stylesheet" href="${nanam}/css/bookDetail.css">
    
    
    <c:set var="book" value="${book }"/>
     <!--서브 책 소개-->
     
   
    <div id="booksWrap" class="booksWrap">
        <!--inner 책 전체-->
        <div id="booksBox" class="booksBox">
            <!--basebar-->
            <div class="basebar">
                <ul>
                    <li>
                        <a href="#">메인</a>
                    </li>
                    <li>></li>
                    <li>
                        <a href="#">책</a>
                    </li>
                    <li>></li>
                    <li>
                        <a href="#">서브페이지</a>
                    </li>
                </ul>
            </div>

            
            
     
		


	

		<div id="booksInfor">
               <!-- 테이블 영역-->
                    <c:if test="${book.bookList eq 'hot'}">	
       	<img src="${nanam}/images/newbook_list/${book.imgName}">
        </c:if>
        
        
   	      <c:if test="${book.bookList eq 'steady'}">
       	<img src="${nanam}/images/steadyseller_list/${book.imgName}">
        </c:if>
          
        
   	      <c:if test="${book.bookList eq 'nBook'}">
       	<img src="${nanam}/images/nanambook_list/${book.imgName}">
        </c:if>
               <div id="tableWrap">
                      <c:if test="${sessionScope.login.id eq'scott' and login.pwd eq 'tiger'}">
			<div>
				<ul>
					<li><a
						href="/nanam/book/updateBookFront?bookList=${book.bookList }&bookTitle=${book.bookTitle }&bookAuthor=${book.bookAuthor }&bookPrice=${book.bookPrice}&bookSize=${book.bookSize }&bookPage=${book.bookPage }&bookDate=${book.bookDate }&ISBN=${book.ISBN}&bookContent=${book.bookContent}&file=${book.imgName}">수정</a></li>
					<li><a href="/nanam/book/deleteBookFront?bookList=${book.bookList }&bookTitle=${book.bookTitle }&bookAuthor=${book.bookAuthor }&bookPrice=${book.bookPrice}&bookSize=${book.bookSize }&bookPage=${book.bookPage }&bookDate=${book.bookDate }&ISBN=${book.ISBN}&bookContent=${book.bookContent}&file=${book.imgName}">삭제</a></li>
				</ul>
			</div>
       </c:if>
                <table id="inforBookTable" >
                    <thead>
                        <tr>
                            <th colspan="2">
                                <h2 class="title">
                                    ${book.bookTitle}
                                </h2>
                            </th>

                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td  class="autor">
                              	${book.bookAuthor}
                            </td>
                        </tr>
                        <tr>
                            <td class="color">
                                판매가
                            </td>
                            <td class="price color">
                               ${book.bookPrice}

                            </td>
                        </tr>
                        <tr>
                            <td>
                                판형
                            </td>
                            <td class="printTurn">
                                ${book.bookSize}

                            </td>
                        </tr>
                        <tr>
                            <td>
                                면수
                            </td>
                            <td class="pageNumber">
                                ${book.bookPage}

                            </td>
                        </tr>
                       
                        <tr>
                            <td>
                                발행일
                            </td>
                            <td class="publishYear">
                                ${book.bookDate}

                            </td>
                        </tr>
                        <tr>
                            <td>ISBN
                            </td>
                            <td class="ISBN">
                               ${book.ISBN}

                            </td>
                        </tr>

                    </tbody>
					
                </table>
              	
                <ul id="btnWrap">
                 <li><a title="책구매하기" href="/nanam/pay/orderInsert?buyId=${login.id }&bookImg=${book.imgName}&bookTitle=${book.bookTitle }&bookPrice=${book.bookPrice }&bookNum=1&totalPrice=${book.bookPrice}&leng=1&bookNum=1 ">구매하기</a></li>
               
               
                 <li><a title="메인페이지로 가기" href="/nanam/main/index.jsp">메인페이지로</a></li>
               
               
                 <li><a title="장바구니 담기" href="/nanam/pay/cartBookMain?bookList=${book.bookList }&bookTitle=${book.bookTitle }&bookAuthor=${book.bookAuthor }&bookPrice=${book.bookPrice}&bookSize=${book.bookSize }&bookPage=${book.bookPage }&bookDate=${book.bookDate }&ISBN=${book.ISBN}&bookContent=${book.bookContent}&file=${book.imgName}&hid=${login.id}">장바구니</a></li>
                </ul>
                <!--//btnWrap-->
                
            </div>
            <!-- //테이블 영역-->
            </div>

            <!--북디테일 영역-->
            <div id="bookDetailWrap">
                <!--디테일 박스-->
                <div class="detailBox">
                    <ul>
                        <li class="informationBook">책내용</li>
                        <li class="borderColor"></li>
                    </ul>
                    <!--서머리-->
                    <div class="bookSummery">
                        <p>
            			${book.bookContent}
                        </p>


                    </div>
                    <!--//서머리-->
                </div>
                <!--//디테일 박스-->

                <!--디테일 박스-->
                <div class="detailBox">
                    <ul>
                        <li class="informationBook">목차</li>
                        <li class="borderColor"></li>
                    </ul>
                    <!--서머리-->
                    <div class="bookSummery">
                        <p>
             		${book.bookIndex }
                        </p>


                    </div>
                    <!--//서머리-->
                </div>
                <!--//디테일 박스-->

                  <!--디테일 박스-->
                  <div class="detailBox">
                    <ul>
                        <li class="informationBook">저자소개</li>
                        <li class="borderColor"></li>
                    </ul>
                    <!--서머리-->
                    <div class="bookSummery">
                        <p>
                            	
               			${book.bookAuthorIntroduce }
                        </p>


                    </div>
                    <!--//서머리-->
                </div>
                <!--//디테일 박스-->
            
                
                
            </div>
            <!--//북디테일 영역-->
   		
           
         
        </div>
        <!--//inner 책 전체-->
               
     
   
    </div>

    <!--서브 책 소개-->
    <%@ include file="../main/footer.jsp"%> 