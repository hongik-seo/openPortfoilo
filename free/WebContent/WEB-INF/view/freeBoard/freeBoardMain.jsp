<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="val" value="${LIST.COMMLIST.VAL}"  />
<!DOCTYPE html>
<html>
<head >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">


/*
1. ajax 셋팅  >> 라이브러리 , 빈객체를 하나 생성을 해야해요. 
2. ajax 문법 사용법 

$.ajax({

    url: "", >> form action >> 호출하고자 하는 url의 주소 EX: "./main.ino"

    type: "", >> form method >> GET , POST 

    dataType: "", ajax를 서버(java controller)와 데이터를 어떠한 형태로 소통할지를 결정해주는 부분 json 

    data: "", 서버로 넘겨줘야할 파라미터를 선언하는 부분 {"key" : value , "search" : search , .....}

    success: function(data){
      // ajax와 서버가 정상적으로 소통이 되었을때 
      function(data) >> data 안에 서버에서 넘겨준 결과값이 들어있음 ex : data.freeBoardList; data.search;
      
      
      // 검색조건을 다시 만들것 . 서브밋 >> ajax 동기화 >> 비동기화 
      // freeBoardList 를 가지고 화면에 html 로 표현해야함 . 
    },

    error: function (request, status, error){        
      // ajax와 서버가 정상적으로 소통되지 않았을때 
      console.log(status) , alert(error);
    }

  });
   
3. 실행 


*/
		
		



	$(function() {
		
		var autoCom = function(str){
		      str = str.replace(/[^0-9]/g, '');
		      var tmp = '';
		      if( str.length < 4){
		          return str;
		      }else if(str.length < 7){
		          tmp += str.substr(0, 4);
		          tmp += '/';
		          tmp += str.substr(4);
		          return tmp;
		      }else if(str.length < 9){
		          tmp += str.substr(0, 4);
		          tmp += '/';
		          tmp += str.substr(4, 2);
		          tmp += '/';
		          tmp += str.substr(6);
		          return tmp;
		      }
		      
		  
		      return str;
		}


		var startDate = document.getElementById('startDate');

		startDate.onkeypress = function(){
		  console.log(this.value);
		  this.value = autoCom( this.value ) ;  
	
		 
		
		
		}
		
		var endDate = document.getElementById('endDate');
		
		endDate.onkeypress = function(){
			  console.log(this.value);
			  this.value = autoCom( this.value ) ;  
		
			  
		
			  
		}
		
		
		
		$("#searchBtn").click(function() {

				var option=$("#option").val();
				var keyword=$("#keyword").val();
				var pageNum=$("#pageNum").val();
				var amount=$("#amount").val();
				var startDate=$("#startDate").val();
				var endDate=$("#endDate").val();
				
				
				
				
				
				var pattern=/^\s+|\s+$/g
				//var pattern =/\s/g;//공백
		        var regexp = /^[^0-9]/g; //숫자만
				
				
				var date_pattern = /^(19|20)\d{2}[\/](0[1-9]|1[012])[\/](0[1-9]|[12][0-9]|3[0-1])$/; //YYYY/MM/DD

				var removeSpecialText =/[^(0-9)]/gi;
				
				var korean  = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
				
				//var notEmp = new RegExp();
				
				
				var notEmp = new RegExp(pattern);
				
				var onlyNum= new RegExp(/^[^0-9]/g);
				
				
				//var onlyDate= new RegExp(/^(19|20)\d{2}(0[1-9]|1[012])(0[1-9]|[12][0-9]|3[0-1])$/);
				
				//////////////////////////////
			
				
				var koreanType= new  RegExp(korean);
				
				var dateType= new  RegExp(date_pattern);
				
				var removeSpecial= new RegExp(removeSpecialText);
				
				
				var startRemoveSpecialStr= startDate.replace(removeSpecialText,"")
				
				var endRemoveSpecialStr= endDate.replace(removeSpecialText,"")
				
				
				var startRemoveSpecialInt= parseInt(startDate.replace(removeSpecialText,""))
				
				
				//alert(startRemoveSpecialInt)
				
				var endRemoveSpecialInt = parseInt(endDate.replace(removeSpecialText,""))
				
				
				
				
				//alert(endRemoveSpecialInt)
				
				
				var compareStartYear =parseInt(startRemoveSpecialInt.toString().substr(0,4));
				
				
				var compareEndYear = parseInt(endRemoveSpecialInt.toString().substr(0,4));
				
				
				
				var compareStartMonth=parseInt(startRemoveSpecialInt.toString().substr(4,2));
				
				var compareEndMonth=parseInt(endRemoveSpecialInt.toString().substr(4,2));
				
				var compareStartDay=parseInt(startRemoveSpecialInt.toString().substr(6,2));
				
				var compareEndDay=parseInt(endRemoveSpecialInt.toString().substr(6,2));
				
		
				var findStartDate = new Date(compareStartYear.toString() +"-"+ compareStartMonth.toString() +"-"+ compareStartDay.toString());
				var findEndDate = new Date(compareEndYear.toString() +"-"+ compareEndMonth.toString() +"-"+ compareEndDay.toString());
				var minusDate = findEndDate -findStartDate;
				
				var second = 24 * 60 * 60 * 1000;

				
				
				var finUnderday=parseInt(minusDate / second);
				
				var finUnderMonth=parseInt(minusDate / (second * 30));
				
				//alert(finUnderday)
				
				console.log("일수 차이 : "+ parseInt(minusDate / second) +" 일");

				
				
				console.log("월수 차이 : "+ parseInt(minusDate / (second * 30)) +" 월");

			 	var cnt=0
				
				
				
				function userS(startRemoveSpecialStr){	
					
					if(startRemoveSpecialStr.length==8 ){
						
					 	s=startRemoveSpecialInt.toString().substr(0,4) + startRemoveSpecialInt.toString().substr(4,2) +startRemoveSpecialInt.toString().substr(6,2);
						
					   
					    return s;
					}
				
				}
					startDate=userS(startRemoveSpecialStr);
					
					
					
					
					
					
				function userE(startRemoveSpecialStr){	
					
					if(endRemoveSpecialStr.length==8){
						
						 e=endRemoveSpecialInt.toString().substr(0,4) + endRemoveSpecialInt.toString().substr(4,2) + +endRemoveSpecialInt.toString().substr(6,2);
						    
						 return e;
						
					}
				
				}	
					endDate=userE(startRemoveSpecialStr)
				
				
				
			
				
				//var finMonth=parseInt(minusDate / (second * 30));
				//var finMonth = parseInt(minusDate / second)
				//https://horangi.tistory.com/396
				
				console.log(compareStartYear)
				
				console.log(compareStartMonth)
				
				console.log(compareStartDay)
				
		
							
					if(option=='DCOM001' && !keyword.replace(pattern,"")){
						
						alert("키워드 입력창의 공백을 제거해주세요 ")
						return false;
						
						
						
					}else if(option=='DCOM002'&& !keyword.replace(pattern,"")){
						alert("키워드 입력창의 공백을 제거해주세요 ")
						return false;
						
					}else if(option=="DCOM001" && onlyNum.test($("#keyword").val())  ){
						
						
						
						alert("글 번호에는 숫자를 입력하세요")
						return false;
						
						
					}
					
			
				
				
				
				if(startRemoveSpecialInt>endRemoveSpecialInt){
					
					alert("시작일이 마지막일보다 큽니다.");
					return false;
					
				}else if(startRemoveSpecialStr.length>8 || endRemoveSpecialStr.length>8){
					
					alert("날짜 입력창에 8자리 숫자를 입력해주세요 ")
					return false;
					
				}else if((compareStartMonth>12 || compareStartMonth<1) || (compareEndMonth>12 || compareEndMonth<1) ){
					
					alert("월을 1~12 안으로 입력해주세요")
					
					return false;
			
			 	}else if((compareStartYear<1900) || (compareEndYear<1900)){
			 		
			 		
			 		alert("년도를 1900년도 이후로 입력해주세요")
			 		return false;
			 		
			 	}else if((compareStartMonth==1 || compareStartMonth==3 || compareStartMonth==5 || compareStartMonth==7 || compareStartMonth==8 || compareStartMonth==10 || compareStartMonth==12)&& 
					(compareEndMonth==1 || compareEndMonth==3 || compareEndMonth==5 || compareEndMonth==7 || compareEndMonth==8 || compareEndMonth==10 || compareEndMonth==12)		
				
				){
				
					
					cnt = 31;
				    
				    if(compareStartDay>cnt || compareEndDay>cnt ){
				    	
				    	alert("1월 3월 5월 7월 8월 10월 12월은 31일 안으로 입력해주세요")
				    	return false;
				    }
				    
				    
				    
				
				}else if((compareStartMonth==4 || compareStartMonth==6 || compareStartMonth==9 || compareStartMonth==11)&&
						(compareEndMonth==4 || compareEndMonth==6 || compareEndMonth==9 || compareEndMonth==11)
									
				
				){
				    cnt = 30;
				    
					if(compareStartDay>cnt || compareEndDay>cnt){
				    	
				    	alert("4월 6월 9월 11월은 30일 안으로 입력해주세요")
				    	return false;
				    }
				
				}else if(compareStartMonth==2 ||compareEndMonth==2 ){
					
					
				    if((compareStartYear%400 == 0 || (compareStartYear%4 == 0 && compareStartYear%100 != 0))&& 
				    	(compareEndYear%400 == 0 || (compareEndYear%4 == 0 && compareEndYear%100 != 0))
				    		
				    ){
				        cnt = 29;
				        if(compareStartDay>cnt || compareEndDay>cnt){
					    	
					    	alert("검색일시의 2월은 29일 안으로 입력해주세요")
					    	return false;
					    }
				        
				    }else{
				        cnt = 28;
				        
				        if(compareStartDay>cnt || compareEndDay>cnt){
					    	
					    	alert("검색일시의 2월은 28일 안으로 입력해주세요")
					    	return false;
					    }
				    }
				}
				console.log(finUnderday);
				
				if(finUnderday>31){
					
					
					alert("한달 안으로만 검색됩니다.");
			    	return false;
					
				}
			
				if(compareStartDay<0 ||compareEndDay<0){
					
					alert("일을 0보다 크게 입력해주세요");
			    	return false;
					
				}
				
				
			
			
		
			$.ajax({
				async:false,
			    url: "/search.ino",  
			 	dataType:"json",
				
			    data:{
			    	"option":option,
			    	"keyword":keyword,
			    	"pageNum":pageNum,
			    	"amount":amount,
			    	"startDate":startDate,
			    	"endDate":endDate
			    },
					
			    type: "GET",  
			 	//ContentType: "application/json; charset=UTF-8" ,
			    
			    success: function(data){
			    
			    	
					
			    	
			    	
					
					/*if(data.keyword==notEmp && (data.startDate || data.endDate) != onlyDate){
			    		
			    		
			    		alert("형식을 맞춰주세요");
			    		e.preventDefault();
			    	
			    	}*/
			    	
			    	
			    	
					var ap='';
			    
			   		var list=data.list
			    	
			    	for (var i = 0; i <list.length; i++) {
			               
			    		ap+="<table border=1>";
			    		ap+="<tbody>";
			    		ap+=   "<tr>";
			    		ap+=         "<td style='width: 55px; padding-left: 30px;' align='center' id='codeType'>"+ list[i].codeType + "</td>";
			    		ap+=         "<td style='width: 50px; padding-left: 10px;' align='center'>"+ list[i].num+"</td>";
			    		ap+=         "<td style='width: 125px;' align='center'>"+"<a href='./freeBoardDetail.ino?num="+list[i].num+"'>"+list[i].title+"</a></td>";
			    		ap+=         "<td style='width: 48px; padding-left: 50px;'align='center'>"+list[i].name+"</td>";
			    		ap+=         "<td style='width: 100px; padding-left: 95px;' align='center'>"+list[i].regdate+"</td>";
			               ap+=   "</tr>";
			               ap+=   "</div>"; 
			               ap+="</tbody>";
			               ap+="</table>";
			               
			               
			                
			            }
			             
			             if(list <= 0){
			            	 ap+="<tr>";
			               ap+=   "<td style='width: 600px; '' align='center'>조회된 글이 없습니다</td>";
			               ap+="</tr>";
			               
			              
			            }
			             
			             document.getElementById("here").innerHTML = ap;
						
			 
				    	
				    	
				    	
			    
			    
				var start=parseInt(data.pageMaker.startPage)-1
				
				var end=parseInt(data.pageMaker.endPage)+1
		 	
				var htmls=""; 		
				htmls  +="<ul class='pagination'>"
        		if(data.pageMaker.prev){
        			htmls	+="<li style='list-style: none' class='paginate_button previous'>"
        				htmls	+="<a href='/main.ino?pageNum="+start+"'>"
        					
        						htmls+="prev"
        						
        					htmls	+=	"</a>"
        				htmls	+="</li>"
        		}
        		
        		
        		
        		for(var i=data.pageMaker.startPage; i<=data.pageMaker.endPage; i++){
        			
        			htmls	+=	"<li  style='list-style: none'  class='paginate_button'>"
        			
        			if(i == data.pageMaker.pageNum ){
        				htmls += i;
        			}
        			else{
        				htmls	+=	"<a class='blockLink' href='/main.ino?pageNum="+i+"&amount="+data.pageMaker.amount+"&option="+data.option+"&keyword="+data.keyword+"&startDate="+data.startDate+"&endDate="+data.endDate+"'>"+i+"</a>" 
        						
        			}
        		
        			htmls	+=	"</li>"
        		}
        		
        		if (data.pageMaker.next){
        		
        			htmls	+="<li style='list-style: none' class='paginate_button next'>"
        				htmls	+=	"<a href='/main.ino?pageNum="+end+"'>"  
        					
        				htmls+="next"
        						
        					htmls	+=	"</a>"
        			
        					
        					
        					htmls	+="</li>"
        		}
        	
        	
        		htmls	+="</ul>"
			    
        		
        			document.getElementById("inHere").innerHTML = htmls;
        		
        		
			    },

			    error: function (request, status, error){        
			      // ajax와 서버가 정상적으로 소통되지 않았을때 
			      console.log(status) , alert(error);
			      
			      
			      //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

			    }

			    
			    
			    
			  });//endOfAjax
			
			
			
			  
		});//endOfsearch
		
		
			
			
		
		
		
		

	});
</script>


</head>


<body id="body" >

	<div>
		<h1>자유게시판</h1>
	</div>
	<div>
	
	<form id="testForm"  >
		 <select name="year"  >
		 
			<option>년도</option>
			
			
			 <c:forEach var="yearList" items="${list.yearList}" >
				<option  value="${yearList.DECODELIST}">${yearList.OPTIONLIST}</option>	
			 </c:forEach>
			
		
		</select>
	
	
		 <select id="option" name="option" >
		 
			<option value="all">전체</option>
			
			
			 <c:forEach var="commList" items="${list.commList}" >
				<option  class="commList" value="${commList.DECODELIST}" >${commList.OPTIONLIST}</option>	
			 </c:forEach>
			
		
		</select>
		<input type="text" id="keyword" name="keyword" value="${list.keyword}"/>
		<button id="searchBtn"type="button">검색</button>
	</form>	
	</div>
	
	<div>
		시작일 : <input id="startDate"  name="startDate" type="text" placeholder="YYYY/MM/DD" maxlength="10"  /> ~
		종료일 : <input id="endDate"    name="endDate"  type="text"  placeholder="YYYY/MM/DD"  maxlength="10"/>
	</div>
	<div style="width:650px;" align="right">
		<a href="./freeBoardInsert.ino">글쓰기</a>
	</div>
	<hr style="width: 600px;">
	<div  style="padding-bottom: 10px;">
		<table border="1">
			<thead>
				<tr>
					<td style="width: 55px; padding-left: 30px;" align="center">타입</td>
					<td style="width: 50px; padding-left: 10px;" align="center">글번호</td>
					<td style="width: 125px;" align="center">글제목</td>
					<td style="width: 48px; padding-left: 50px;" align="center">글쓴이</td>
					<td style="width: 100px; padding-left: 95px;"align="center">작성일시</td>
				</tr>
			</thead>
		</table>
	</div>
	<hr style="width: 600px;">

	<div id="here">
		<table border="1">
			<tbody id="change">
				
					<c:forEach   var="dto"  items="${list.list }">
					
					<tr class="orders" >
						<td class="codeType" style="width: 55px; padding-left: 30px;"  align="center">${dto.codeType}</td>
						<td	class="num" style="width: 50px; padding-left: 10px;" align="center">${dto.num }</td>
						<td class="title" style="width: 125px; "" align="center"><a class="link" href="./freeBoardDetail.ino?num=${dto.num }">${dto.title }</a></td>
						<td class="name" style="width: 48px; padding-left: 50px;" align="center">${dto.name }</td>
						<td class="regdate" style="width: 100px; padding-left: 95px;" align="center">${dto.regdate }</td>
					</tr>
				
					</c:forEach>
			
					
			</tbody>
		</table>
	</div>
					<div id="inHere">
						<ul class='pagination'>
                            		<c:if test="${list.pageMaker.prev}">
                            		<li style='list-style: none' class='paginate_button previous'>
                            			<a href='/main.ino?pageNum=${list.pageMaker.startPage -1 }'>Previous</a>
                            		</li>
                            		
                            		</c:if>	
                            		
                            		<c:forEach var='num'   begin='${list.pageMaker.startPage}' end='${list.pageMaker.endPage }'>
                            		
                            			<li  style='list-style: none'  class='paginate_button'   >
                            			<c:choose>
                            				<c:when test="${num == list.pageMaker.pageNum}">
                            					<span style="color: red;">${num}</span>
                            				</c:when>
                            				<c:otherwise>
                            					<a class="blockLink" href="/main.ino?pageNum=${num}&amount=${list.pageMaker.amount }&option=${list.option}&keyword=${list.keyword}&startDate=${list.startDate}&endDate=${list.endDate}">${num}</a>	
                            				</c:otherwise>
                            			</c:choose>
                            				
                            			</li>
                            			
                            		</c:forEach>
                            		
                            		<c:if test="${list.pageMaker.next}">
                            		
                            			<li style="list-style: none" class="paginate_button next">
                            			<a href="/main.ino?pageNum=${list.pageMaker.endPage +1 }">Next</a>
                            			
                            			</li>
                            		</c:if>
                            	
                            	
                            	</ul>
                            </div>	
      
			
</body>
</html>