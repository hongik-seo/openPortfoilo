<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="nanam" value="${pageContext.request.contextPath}"/>

 <style type="text/css">
 	td{
 	font-size :10px;
 	} 
 	
 	table{
 		width:500px;
 	}
 </style>

<script type="text/javascript"
		src="${nanam}/js/jquery-3.1.1.min.js"></script>


<script>	






	$(function(){
		
	
		
		
		$("#ticketBtn").click(function(){
			var num=Math.floor( ( Math.random() * 10000 ) );
			console.log(num);	
			alert("콘솔창에서 번호를 확인하세요");
			
			
			$("#inputCultureNum").blur(function(){
				
				alert(num);
			
			if($("#inputCultureNum").val()!='' && $("#inputCultureNum").val() ==num ){
				
				
				$("#getFullPointBtn").prop("disabled",false);
				
			}else{
				
				$("#getFullPointBtn").prop("disabled",true);
			}
			
			});
			
			
		});
		
	
		
		
		
	
	
	

		$("#getFullPointBtn").click(function() {
			
		
				var pointId = $("#pointId").val();

				var pointPhone = $("#pointPhone").val();

				
				var point = $(":checked").val();
				

				$.ajax({

					type : 'get',
					dataType : 'text',
					url : "/nanam/pay/pointChargeUpdate",
					data : {

						"id" : pointId,
						"pointPhone" : pointPhone,
						"addPoint" :point

					},

					success : function(data) {

						self.opener = self;
						self.close();
					},
					error : function(xhr, ajaxOptions, thrownError) {
						console && console.log("request failed");
					},

				});//endOfAjax

			});
		

	});
</script>



<head>
<meta charset="UTF-8">
<title>포인트 충전 창</title>
</head>


   <table border=1>
            <thead>
                <tr>
                    <th colspan="2">
                        포인트 충전 창
                    </th>
                </tr>
                <tr>
                    <th colspan="2">
                        포인트 충전 금액
                    </th>
                </tr>
            <tbody>
            	<tr>
                    <td colspan="2">

               	  아이디     <input name="id" type="text" id="pointId" value="${login.id}" readonly>

                    </td>
                    
                   
                </tr>
            
                <tr>
                    <td colspan="2">

                      인증 :가입하신 휴대폰 번호<input type="text" id="pointPhone" name="pointPhone" placeholder="(하이픈 포함)">

                    </td>
                	  
                   
                </tr>
                
                <tr >
                    <td>
                        문화 상품권

                    </td>
                    <td colspan="2">
                       
                           
                        

                    </td>
                </tr>
                 <tr>
                <td colspan="2">
                    <input type="button" id="ticketBtn" value="문화상품권 번호 받기">
                     
                 <input id="inputCultureNum" type="text"  name="pointTicket" placeholder="문화상품권 번호 입력">
                </td>
               
               
                   
                </tr>
                <tr>
                    <td>
                        	<label for="pointNum1"></label>
                            <input id="pointNum1"   name="addPoint" type="radio" class="addPoint" value=10000>
                        
                    </td>

                    <td>
                        10,000원
                    </td>
                </tr>
                <tr>
                    <td>
               				<label for="pointNum2"></label>
                            <input id="pointNum2" name="addPoint" type="radio" class="addPoint" value=20000>
                        
                    </td>

                    <td>
                        20,000원
                    </td>
                </tr>
               
                <tr>
                    <td colspan="2">
                        <input type="button" id="getFullPointBtn" value="충전" disabled="">
                    </td>

                </tr>

            </tbody>    
           
        </table>
   
</html>