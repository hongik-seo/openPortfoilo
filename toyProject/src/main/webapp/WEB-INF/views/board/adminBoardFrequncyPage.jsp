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
   	<link rel="stylesheet"  type="text/css" href="${root}/resources/css/nav.css">
	<link rel="stylesheet"  type="text/css" href="${root}/resources/css/adminBoardWritePage.css">
    <title>자주하는 질문</title>
	
	<script type="text/javascript">
	
		$(function(){
			
			
			
		for(var i=0; i<$("article").find("select").length; i++){
			
			$($($("article").eq(i)).find("select")).prop("disabled",true);
			$($($("article").eq(i)).find("input[type='text']")).prop("disabled",true);
			$($($("article").eq(i)).find("textarea")).prop("disabled",true);
			$($($("article").eq(i)).find("input[type='file']")).prop("disabled",true);
			$($($("article").eq(i)).find("option")).prop("disabled",true);
			
		
			
			
		}
			
		if($("input[name='boardWriter']").val() ==""){
			
			history.back();
			alert("login해주세요")	
			
		}
	
			
			
			$("input[name='freqbox']").each(function(i){
			
				
				
				$($("input[name='freqbox']").eq(i)).on("click",function(){	
						
						$(this).toggleClass("flag");
						

						if($(this).hasClass("flag")){
							
							
							$($($("article").eq(i)).find("select")).prop("disabled",false);
							$($($("article").eq(i)).find("input[type='text']")).prop("disabled",false);
							$($($("article").eq(i)).find("textarea")).prop("disabled",false);
							$($($("article").eq(i)).find("input[type='file']")).prop("disabled",false);
							$($($("article").eq(i)).find("option")).prop("disabled",false);
							
							alert("해제하시겠습니까?")
						
							
						}else{
							

							$($($("article").eq(i)).find("select")).prop("disabled",true);
							$($($("article").eq(i)).find("input[type='text']")).prop("disabled",true);
							$($($("article").eq(i)).find("textarea")).prop("disabled",true);
							$($($("article").eq(i)).find("input[type='file']")).prop("disabled",true);
							$($($("article").eq(i)).find("option")).prop("disabled",true);
							
							alert("막으시겠습니까?")		

							
							
						}
						
						
				});
				
			
				
			})
			
		
			
			
			
			$("button[type='button']").click(function(){
				
				var boardKind="";
				var boardSubject="";
				var boardContent="";
				var boardWriter="";
				
				var arr=new Array();
				
				var frequncyJson={};
				
				
				/*
				$("form[name='fileForm']").each(function(j){
					
					$($("form[name='fileForm']").eq(j)).attr("action","")
					
					$($("form[name='fileForm']").eq(j)).attr("method","post")
					
					$($("form[name='fileForm']").eq(j)).attr("enctype","multipart/form-data")
					
					$($("form[name='fileForm']").eq(j)).submit();
					
					
				})
				*/
				
				
				$("input[name='boardWriter']").each(function(i){
					
					boardKind= $($("select[name='boardKind']").get(i)).val();
					
					boardSubject=$($("input[name='boardSubject']").get(i)).val();
					
					boardContent=$($("textarea[name='boardContent']").get(i)).val();
					
					boardWriter=$($("input[name='boardWriter']").get(i)).val();
					
					
					
					
					if($($("select[name='boardKind']").get(i)).is("disabled")==false || $($("input[name='boardSubject']").get(i)).is("disabled")==false || $($("textarea[name='boardContent']").get(i)).is("disabled")==false  || $($("input[name='boardWriter']").get(i)).is("disabled")==false){
						
					
					frequncyJson={
									"boardKind":boardKind,
									"boardSubject":boardSubject,
									"boardContent":boardContent,
									"boardWriter":boardWriter
									
					
								};
					
					}
					
					arr.push(frequncyJson);
					
				})
				
				console.log(arr);
				
				
				$.ajax({
	        	    url:'/board/insertFrequncy', //request 보낼 서버의 경로
	        	    type:'POST', // 메소드(get, post, put 등)
	        	    dataType:"json",
	        	    data:JSON.stringify(arr),
	        	    contentType : "application/json; charset=UTF-8",
	        	    
	        	    success: function(data) {
	        	      
	        	    	
	        	    	console.log(data);
	        	    	if(data!=null){
	        	    		
	        	    		
	        	    		location.reload();
	        	    	}
	        	    	
	        	    	
	        	    	
	        	    },
	        	    error: function(err) {
	        	        //서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행
	        	    }
	        	
	        	});
				
				
				
				
				
				
				
			})		
			
			
			
			
			
		})
	
	</script>



</head>

<%@ include file="/WEB-INF/views/include/header.jsp" %>   

 	<nav>
    <h1>업로드 게시판</h1>
    <ul id="member-tab">
        <li ><a>공지사항</a></li>
        <li ><a>자주하는 질문</a></li>
        
        
    </ul>
</nav>
       <div id="wrap">
         
        <article> 
        
      
        <select name="boardKind">
            <optgroup label="자주하는 질문">
                <option value='01'>공연안내*예매</option>
                <option value='02'>대관</option>
                <option value='03'>기타</option>
            </optgroup>
           
        </select>
        <p>제목</p> <input type="text"  class="write" name="boardSubject">

    
        <p>작성자</p> <input type="text"  class="write" name="boardWriter" value="${adminSession}" readonly="readonly">



        <p>본문</p> <textarea id="content" name="boardContent" class="write" cols="40" rows="8"></textarea>
		
		
   		
   		
        <input type="checkbox" name="freqbox">
    </article>
    <article>
         
        <select name="boardKind">
          <optgroup label="자주하는 질문">
                <option value='01'>공연안내*예매</option>
                <option value='02'>대관</option>
                <option value='03'>기타</option>
            </optgroup>
           
        </select>
        <p>제목</p> <input type="text"  class="write" name="boardSubject">

    
        <p>작성자</p> <input type="text"  class="write" name="boardWriter" value="${adminSession}" readonly="readonly">



        <p>본문</p> <textarea  name="boardContent" class="write" cols="40" rows="8"></textarea>

        <input type="checkbox" name="freqbox" >
    </article>  
         
    <article>
      <select name="boardKind">
             <optgroup label="자주하는 질문">
                <option value='01'>공연안내*예매</option>
                <option value='02'>대관</option>
                <option value='03'>기타</option>
            </optgroup>
            
        </select>
        <p>제목</p> <input type="text"  class="write" name="boardSubject">

    
        <p>작성자</p> <input type="text"  class="write" name="boardWriter" value="${adminSession}" readonly="readonly">



        <p>본문</p> <textarea  name="boardContent" class="write" cols="40" rows="8"></textarea>
		
        <input type="checkbox" name="freqbox" >
       
    </article>
    <article>     
       <select name="boardKind">
            <optgroup label="자주하는 질문">
                <option value='01'>공연안내*예매</option>
                <option value='02'>대관</option>
                <option value='03'>기타</option>
            </optgroup>
             
            
        </select>
        <p>제목</p> <input type="text"  class="write" name="boardSubject">

    
        <p>작성자</p> <input type="text" class="write" name="boardWriter" value="${adminSession}" readonly="readonly">



        <p>본문</p> <textarea name="boardContent" class="write" cols="40" rows="8"></textarea>
		
		
        <input type="checkbox" name="freqbox" >
       
		 <button type="button" >등록</button>
    </article>   
  	
  	
  	
  	
    </div>

</div>
<!--//인풋전체 영역-->
<!-- //인풋 전체영역 -->

<%@ include file="/WEB-INF/views/include/footer.jsp" %>