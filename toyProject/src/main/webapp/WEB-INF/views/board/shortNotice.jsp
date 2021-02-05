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

                    

                </thead>

                <tbody>
                    <tr>
                        <td>
                            임의값

                        </td>
                        <td>
                            임의값

                        </td>

                        <td>
              		${file}

                        </td>

                        <td>
                            임의값

                        </td>

                        <td>
                            임의값

                        </td>


                    </tr>

                </tbody>

            </table>


        </div>


  </div>
        <!--//콘텐츠-->
        
<%@ include file="/WEB-INF/views/include/footer.jsp" %>   
            