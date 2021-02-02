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
    <link rel="stylesheet"  type="text/css" href="${root}/resources/css/questing.css"> 

    <title>자주하는 질문</title>
	<script>
    $(function(){


        $(".q").each(function(i){

            $($(".q :odd").eq(i)).click(function(){

                $($(".even-box").eq(i)).toggle();
				$(this).css("color","red");

            })

        })


    });


	</script>   
	
	<script type="text/javascript">
	
	$(function(){
		
		$("a.on").each(function(i){
			
			
			$($("a.on").eq(i)).click(function(){
				
				var on=i.toString();
				
				$(this).wrap("<form id='freqencyFrm' action='/board/questingView' method='get'>'<input type='hidden' name='on' value="+on+" >'</from>")
				
				
				$("#freqencyFrm").submit();
				
				
				
				
			})
			
		})
		
		
	})
	
	</script>

</head>

<%@ include file="/WEB-INF/views/include/header.jsp" %>   

		 <nav>
            <h1>커뮤니티</h1>
            <ul id="member-tab">
                <li><a>공지사항</a></li>
                <li id="click-menu"><a>자주하는 질문</a></li>
                <li><a>자유게시판</a></li>
            </ul>
        </nav>

    <section id="community-wrap">
    
                <h2>자주하는 질문</h2>
            
            <ul id="btn-list">
                <li>
					
                    <a class="on">전체</a>

                </li>

                <li>
                    <a class="on">공연안내*예매</a>
                   

                </li>

                <li>
                     <a class="on">대관</a>   
                    

                </li>

                <li>
                    <a class="on">기타</a>
                   

                </li>

            </ul>

    </section>
    <article id="qn">
           
           <c:forEach var="freqList" items="${freqList}">
            <ul id="qn-list">
                    <li class="questing-odd qli">
                        <div class="odd-box">
                            <ul class="box-list">
                                <li class="q">
                                   <a>Q ${freqList.boardStatus}</a>
                                </li>
                                <li class="q">
                                  <p class="subject"> ${freqList.boardSubject } </p>

                                </li>
                            </ul>
                        </div>
                    </li>

                    <li class="questing-even qli">
                        
                        <div class="even-box" style="clear:both;">
                           A ${freqList.boardContent }
                        </div>
                    </li> 
            	</ul>
            </c:forEach>
    </article>
        
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>