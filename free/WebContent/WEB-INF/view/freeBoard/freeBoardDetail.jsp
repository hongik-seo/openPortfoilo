<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<c:set var="freeBoardDto" value="${freeBoardDto}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>




<script>


	$(function() {//startWithready

		
		$("#toList").click(function(){
			
		
			var a=$(location).attr('href');
			alert(a);
			
		});
		
		
			
			$("#modifyBtn").on("click",function(e){
			
			
			e.preventDefault();

			var title = $("input[name='title']");

			var content = $("textarea[name='content']");

			
			if ( title.val()!=$.trim(title.val()) ) {

				alert("제목의 앞뒤 공백을 제거해주세요");
				
				title.focus();
				return false;	
				 
				
			}else if(title.val().trim().length<1){	
				
				
				title.focus();
				alert("제목을 입력해주세요")
				return false;
			 
			}else if(content.val().trim().length<1){
				
				
				
				alert("콘텐츠 값을 입력해주세요");
				content.focus();
				return false;
				
			}else{
			
				
				
				$.ajax({
					async:false,
				    url: "/freeBoardModify.ino",  
				 	dataType:"json",
				    data:$("#insertForm").serialize(),
				    type: "POST",  
				 	//ContentType: "application/json; charset=UTF-8" ,
				    
				    success: function(data,request, status, error,cause){        
					    
				    	console.log(data)
				    	
				    	if(data.resultStr=="fail"){
				    		
				    		alert("길이를 50자로 제한 하세요")
				    		return false;
				    		
				    	}else{
				    		
				    		location.href="/main.ino";
				    		
				    	}
				   	
				    },

				    error: function (){        
				      // ajax와 서버가 정상적으로 소통되지 않았을때 
				    
				     
				   
				    }

				  });//endOfAjax
				
				
						
				}
			});//endofModifyBtnClick
				
				
			$("#deleteBtn").on('click',function(){
				
				
				$.ajax({
					async:false,
				    url: "./freeBoardDelete.ino",  
				 	dataType:"json",
				    data:$("#insertForm").serialize(),
				    type: "POST",  
				 	//ContentType: "application/json; charset=UTF-8" ,
				    
				    success: function(data){
				    	
				    	
				    	
				   
				   	
				    },

				    error: function (request, status, error){        
				      // ajax와 서버가 정상적으로 소통되지 않았을때 
				      console.log(status) , alert(error);
				      
				      
				      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

				    }

				  });//endOfAjax
				
				
				
			});
			

});//endOfready
</script>


<body>
	
	
	<div>
		<h1>자유게시판</h1>
	</div>
	
	
	<div style="width:650px;" align="right">
		<a href="./main.ino?pageNum=${list.pageMaker.pageNum}" id="toList">리스트로</a>
	</div>
	<hr style="width: 600px">

	
	<form id="insertForm" name="insertForm">
		<input type="hidden" name="num" value="${freeBoardDto.num }" />
		<table border="1">
			<tbody>
				<tr>
					<td style="width: 150px;" align="center">타입 :</td>
					<td style="width: 400px;">
						<select name="codeType">
							<option class="option" value="01" <c:if test="${freeBoardDto.codeType eq '01'}">selected</c:if>>자유</option>
							
							<option class="option" value="02" <c:if test="${freeBoardDto.codeType eq '02'}">selected</c:if>>익명</option>
							
							<option class="option" value="03" <c:if test="${freeBoardDto.codeType eq'03'}">selected</c:if>>QnA</option>
						</select>
					</td>
				</tr>
				<tr>
					<td style="width: 150px;"align="center">이름 :</td>
					<td style="width: 400px;"><input type="text" name="name" value="${freeBoardDto.name }" readonly/></td>
				</tr>
				<tr>
					<td style="width: 150px;"align="center">제목 :</td>
					<td style="width: 400px;"><input type="text" name="title"  value="${freeBoardDto.title }"/></td>
				</tr>
				<tr>
					<td style="width: 150px;"align="center">내용 :</td>
					<td style="width: 400px;"><textarea name="content" rows="25" cols="65"  >${freeBoardDto.content }</textarea></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td></td>
					<td align="right">
					<input type="button" value="수정" id="modifyBtn">
					<input type="button" value="삭제" id="deleteBtn" >
					<input type="button" value="취소" onclick="location.href='./main.ino'">
					
					&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
			</tfoot>
		</table>

	</form>


<%-- 	<input type="hidden" name="num" value="${freeBoardDto.num }" />

		<div style="width: 150px; float: left;">이름 :</div>
		<div style="width: 500px; float: left;" align="left"><input type="text" name="name" value="${freeBoardDto.name }" readonly/></div>

		<div style="width: 150px; float: left;">제목 :</div>
		<div style="width: 500px; float: left;" align="left"><input type="text" name="title"  value="${freeBoardDto.title }"/></div>

		<div style="width: 150px; float: left;">작성날자</div>
		<div style="width: 500px; float: left;" align="left"><input type="text" name="regdate"  value="${freeBoardDto.regdate }"/></div>

		<div style="width: 150px; float: left;">내용 :</div>
		<div style="width: 500px; float: left;" align="left"><textarea name="content" rows="25" cols="65"  >${freeBoardDto.content }</textarea></div>
		<div align="right">
		<input type="button" value="수정" onclick="modify()">
		<input type="button" value="삭제" onclick="location.href='./freeBoardDelete.ino?num=${freeBoardDto.num }'">

		<input type="button" value="취소" onclick="location.href='./main.ino'">
		&nbsp;&nbsp;&nbsp;
		</div> --%>

</body>
</html>