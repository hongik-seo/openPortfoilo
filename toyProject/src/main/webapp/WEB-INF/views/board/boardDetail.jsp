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
	<script>
    $(function(){


        $(".menu").each(function(i){

            $($(".menu :odd").eq(i)).hover(function(){

                $($(".even-box").eq(i)).toggle();


            })

        })


    });


	</script>   

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

                <tbody>
                    <tr>
                        <td>

                            관리자

                        </td>
                        <td>
                            임의값

                        </td>
                        <td>
                            임의값

                        </td>

                        <td>
                            ${fileDB}

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
            <section id="detail-body">
            

                Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                   

            </section>

            <table id="next-prev-table" border="1">

                <thead>
                    <tr>
                        <th>
                            이전글

                        </th>
                        <td>
                            <a>
                            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                            </a>

                        </td>
        
                    </tr>
                    <tr>

                        
                        <th>
                            다음글

                        </th>
                        <td>

                            <a>
                            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                            </a>    
                        </td>

                    </tr>

                </thead>
              
                



            </table>


        </div>


        </div>
        <!--//콘텐츠-->    

<%@ include file="/WEB-INF/views/include/footer.jsp" %>