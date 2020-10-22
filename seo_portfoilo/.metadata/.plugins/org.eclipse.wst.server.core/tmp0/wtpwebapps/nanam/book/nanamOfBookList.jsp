<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ include file="../main/header.jsp"%>

<link rel="stylesheet" href="${nanam}/css/bookList.css">

<title>새로나온 책</title>
 <!-- 책전체-->
    <div id="newBooksWrap" class="booksWrap">
        <!--inner 책 전체-->
        <div id="newBooksBox" class="booksBox">
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
                        <a href="#">나남의 책</a>
                    </li>
                </ul>
            </div>
            <!--//basebar-->
            <!--진짜 콘텐츠 영역-->
            <div class="booksArea">
                <!--책 리스트 전체영역-->
                 <c:forEach var="book"  items="${nanamBook}" varStatus="status">
                <div class="list">
                        <!--테이블-->
                        <table class="bookTable">
                            <tbody>
                                <!--책리스트 1-->
                                <tr>
                                    <td>
                                   
										
                                        <a title="책설명 보기" href="/nanam/book/showBookDetail?bookList=${book.bookList }&bookTitle=${book.bookTitle }&bookAuthor=${book.bookAuthor }&bookPrice=${book.bookPrice}&bookSize=${book.bookSize }&bookPage=${book.bookPage }&bookDate=${book.bookDate }&ISBN=${book.ISBN}&bookContent=${book.bookContent}&file=${book.imgName}">
                                            <img src="${nanam}/images/nanambook_list/${img}${book.imgName}">
                                             </a>
                                            <div id="modify">
                                                <p class="title">
													${book.bookTitle}
                                                </p>
                                                <p class="athor">
                                                   ${book.bookAuthor}
                                                </p>
                                                <p class="price">
                                                    ${book.bookPrice}원
                                                </p>
                                                <p class="publishYear">
                                                    
													${book.bookDate}		
                                                </p>
                                                <p class="bookText">
                                                  ${book.bookContent}
                                                </p>
                                            </div>
                                     	
                                    </td>

                            
                                </tr>
                                <!--//책리스트 1-->


                                
                            </tbody>
                        </table>
                        <!--//테이블-->
                        <!--페이저 히스토리-->

                    </div>
                    </c:forEach>
                    <!--//책 리스트 전체 영역-->
                    
                </div>
                <!--//진짜 콘텐츠 영역-->




            </div>
            <!--inner 책 전체-->
            </div>
<%@ include file="../main/footer.jsp"%>