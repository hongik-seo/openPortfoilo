<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				
				
				$(this).wrap("<form id='freqencyFrm' action='/board/questingView' method='get'>'<input type='hidden' name='on' value="+i+" >'</form>")
				
				
				$("#freqencyFrm").submit();
				
				
				
				
			})
			
		})
		
		
		
	$("li.result").each(function(i){
		
		
				
			$($("button[name='modiBtn']").eq(i)).click(function(){
				
				
				var boardKind= $($("input[name='boardKind']").eq(i)).val();		
				var boardSubject= $($("input[name='boardSubject']").eq(i)).val()		
				var boardContent=$($("textarea[name='boardContent']").eq(i)).val()
				
				
				
				alert(boardKind);
				
				location.href="/board/modify?boardKind="+boardKind+"&boardSubject="+boardSubject+"&boardContent="+boardContent;
				
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
                                   <a >Q ${freqList.boardStatus}</a>
                                   
                                </li>
                                <li class="q">
                                  <p class="subject"> ${freqList.boardSubject} </p>
								</li>
                                <li class="clear">
            					<c:if test="${adminSession eq 'pageAdmin'}">
            						<button type="button" name="modiBtn" >수정</button>
            					</c:if>
            					</li>
            		
                            </ul>
                        </div>
                    </li>

                    <li class="questing-even qli">
                        
                        <div class="even-box" >
                           A ${freqList.boardContent}
                        </div>
                       
                    </li> 
            		<li class="result">
            		

            			<input type="hidden"  name="boardKind" value="${freqList.boardKind}"/>
            			<input type="hidden"  name="boardSubject" value="${freqList.boardSubject}"/>
                   		<textarea name="boardContent" style="display:none">${freqList.boardContent}</textarea>
            		</li>
            	</ul>
            	
                    
      
            </c:forEach>
    </article>
        
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>