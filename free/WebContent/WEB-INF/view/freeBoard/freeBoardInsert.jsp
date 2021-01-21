<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>



$(function() {//startWithready

	
	
	
	$("#writeBtn").click(function(e){
	
		e.preventDefault();
		
	   	var name = $("input[name='name']");

		var title = $("input[name='title']");

		var content = $("textarea[name='content']");

		
		
		if(name.val() != $.trim(name.val())){
			alert("이름의 앞뒤 공백을 제거해주세요");
			name.focus();
			return false;
			
				
		}else if(name.val().trim().length<1){
			
			alert("이름 값을 입력해주세요");
			name.focus();
			return false;
		
		}else if ( title.val() !=$.trim(title.val()) ) {

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
			    url: "/freeBoardInsertPro.ino",  
			 	dataType:"json",
			    data:$("#testForm").serialize(),
			    type: "GET",  
			 	//ContentType: "application/json; charset=UTF-8" ,
			    
			 	
			 	
			    success: function(data){
			    	
			    	console.log(data)
			    	
		    	if(data.resultStr=="fail"){
		    		
					
					alert("길이를 50자로 줄여주세요 ")
		    		return false;
		    	
		    	}else{
		    		
		    			if(confirm("다음페이지로 이동합니다.")==true){
		    	
			   		
			   			return location.href="/freeBoardDetail.ino?num="+data.freeBoardDto.num
					
			   					
						}else{
					
							return false;
					
						}
			   	
		    		}
			    },

			    

			  });//endOfAjax
			
			
		}//endOfprevent
		
		
		
	 });//endOfinput

});//endOfready

</script>

<body>
	<div>
		<h1>자유게시판</h1>
	</div>
	<div style="width:650px;" align="right">
		<a href="./main.ino">리스트로</a>
	</div>
	<hr style="width: 600px">
<!--  <form  action="./freeBoardInsertPro.ino">-->
	<form  id="testForm" >
		<table border="1">
			<tbody>
				<tr>
					<td style="width: 150px;" align="center">타입 :</td>
					<td style="width: 400px;">
						<select  name="codeType">
							
							
							<option>글쓰기 타입</option>
							<c:forEach var="commList" items="${commList}">
								<option  value="${commList.DECODELIST}" >${commList.OPTIONLIST}</option>	
			 				</c:forEach>
					</select>
					</td>
				</tr>
				<tr>
					<td style="width: 150px;"align="center">이름 :</td>
					<td style="width: 400px;"><input type="text" name="name"/></td>
				</tr>
				<tr>
					<td style="width: 150px;"align="center">제목 :</td>
					<td style="width: 400px;"><input type="text" name="title"/></td>
				</tr>
				<tr>
					<td style="width: 150px;"align="center">내용 :</td>
					<td style="width: 400px;"><textarea name="content" rows="25" cols="65" ></textarea></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td>
					<td align="right">
					<input type="button" id="writeBtn" value="글쓰기">
					<input type="button" value="다시쓰기" onclick="reset()">
					<input type="button" value="취소" onclick="history.go(-1)">
					&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
			</tfoot>
		</table>

	</form>



</body>
</html>