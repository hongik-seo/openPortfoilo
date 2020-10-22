<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/header.jsp" %>
<!--  
<script>

$(function(){
	
	
	
var title=new Array();
var num=new Array();
var price=new Array();



	


$(".title").each(function(i){
	
	
	title=$(".title").eq(i).text();
	
});



var num=new Array();	


$(".num").each(function(i){
	
	
	num=$(".num").eq(i).text();
	
});


var price=new Array();

$(".price").each(function(i){

	price=$(".price").eq(i).text();	


});

var id=$("#id").text();

	
	
		
		$.ajax({
			traditional : true,
			type : 'get',
			dataType : 'text',
			url : "/nanam/pay/changePayTable",
			data : {
				
				"id":id,
				"price":price,
				"title":title,
				"num":num
				
				

			},

			success : function(data) {
				console.log("request succeeded");
			
						

			},
			error : function(xhr, ajaxOptions, thrownError) {
				console && console.log("request failed");
			},

		});//endOfAjax	
		
		
		
		
		
	});



</script>

-->
<script>
    var checkUnload = true;
    $(window).on("beforeunload", function(){
        if(checkUnload) 
        	
        	var id=$("id").text();
        	
        	
        	$.ajax({
    			traditional : true,
    			type : 'get',
    			dataType : 'text',
    			url : "/nanam/pay/deletePayList",
    			data : {
    				
    				"id":id
    				
    				

    			},

    			success : function(data) {
    				console.log("request succeeded");
    				
    					

    			},
    			error : function(xhr, ajaxOptions, thrownError) {
    				console && console.log("request failed");
    			},

    		});//endOfAjax
        	
        	
        	
        	return "이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다.";
    });
</script>


<h1 id="id">${login.id}님이시키신</h1>
<h6> ${login.id}님의 포인트는 ${login.point} 입니다.</h6>


<c:forEach var="result" items="${pay}" varStatus="status">
	
	<div style="color:blue" class="title">${result.cartBookTitle}</div>
	<div style="color:black" class="num">${result.buyEachNum}</div>
	<div style="color:red" class="price" >${result.cartBookPrice}</div>
	
</c:forEach>



<h3>이 배송 준비중 입니다.</h3>




<a id="fin" href="${nanam}/main/index.jsp">메인 페이지 이동</a>


<%@ include file="../main/footer.jsp" %>