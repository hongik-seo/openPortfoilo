<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/header.jsp" %>

<link rel="stylesheet" href="${nanam}/css/cart.css" >
  
  
  
 
  
  <script>
  
  $(function(){
  
	  	$("input[type='checkbox']").prop("checked",true);
	  		

	  
  		$("#allCartCheck").click(function(){
  			
  			var chk= $(this).is(":checked");
  		      
  		        if(chk) {
  		        	
  		       	$("input[type='checkbox']").prop('checked', true);
  		        
  		     	
  		        
  		        }else  {
  		        $("input[type='checkbox']").prop('checked', false);
  				
  		  
  		     	
  				}
  		        
  		        
  		});
  		
  	
  
	 		

 	//기본 수량
	var p=new Array();	
	
	
	$(".bookPrice").each(function(i){
		
		
		p[i]=$(".bookPrice").eq(i).val();
		
	});

	
	
	var n=new Array();	

	
	$(".bookNum").each(function(i){
		
		
		n[i]=$(".bookNum").eq(i).val();
		
	});
	
	
	var total=0;
	
	for(var i=0; i<p.length; i++){
		
		
		total+=parseInt(p[i])*parseInt(n[i]);
		
		
		
	}
	
	$("#totalPrice").val(total);
	
	

	
	
		
		
		
	$(".plusBtn").each(function(i){

	$(".plusBtn").eq(i).click(function(){

		pos=i;
		
		n[pos]=$(".bookNum").eq(i).val();
		p[pos]=$(".bookPrice").eq(i).val();
		
		
		$.ajax({
			traditional : true,
			type : 'get',
			dataType : 'text',
			url : "/nanam/pay/plusBook",
			data : {
				
				
				"nArr":n,
				"pArr":p
				
				

			},

			success : function(data) {
				console.log("request succeeded");
				
				var allData =parseInt(data);
				
				
			
				var plusTotal=$("#totalPrice").val(allData);
			
						

			},
			error : function(xhr, ajaxOptions, thrownError) {
				console && console.log("request failed");
			},

		});//endOfAjax
		
	});

});
	
	//체크박스
	var dataCut=new Array();
	var leng=$(":checked").not("#allCartCheck").length;
	
	$("#leng").val(leng);
	
	$(".plusChck").each(function(i) {
		
	$(".plusChck").eq(i).click(function() {
	
		//pos=i;
		
		var ISBN=$("#ISBN").eq(i).val();
		var price=$(".bookPrice").eq(i).val();	

		var eachChek = $(".plusChck").eq(i).is(":checked");
		
	
		
		
			
		var chLeng=$(":checked").not("#allCartCheck").length;
			
	
			if (eachChek==false) {

				
		
				
				n[i]=0;
				p[i]=0;
				
				
				$(".bookNum").eq(i).attr("disabled",true);
				$(".plusBtn").eq(i).attr("disabled",true);
				
				
			}else if(eachChek==true) {
				
				
				
				
				n[i]=$(".bookNum").eq(i).val();
				p[i]=$(".bookPrice").eq(i).val();
				
				
				
				$(".bookNum").eq(i).attr("disabled",false);
				$(".plusBtn").eq(i).attr("disabled",false);
				
				
			}
			
		
			$.ajax({
			traditional : true,
			type : 'get',
			dataType : 'text',
			url : "/nanam/pay/checkBookNum",
			data : {
				
				
				"nArr":n,
				"pArr":p,
				"chLeng":chLeng
			},

			success : function(data) {
				console.log("request succeeded");
				
				//var allData =parseInt(data);
			
				var dataCut=data.split(",");
				
				
				
				
					
					
				
				console.log(dataCut)
				
			
				
				$("#totalPrice").val(dataCut[0]);
				
				$("#leng").val(dataCut[1]);
				
				
				
				
			
				
				
			

			},
			error : function(xhr, ajaxOptions, thrownError) {
				console && console.log("request failed");
			},

			});//endOfAjax
	
		
				
		});
	
	
	

	});
	
	
	 
	 
	 
	 
	 
	 
	 
	 
	 
	$(".cartList").each(function(i){
		
		$(this).attr("id","list"+i++);
		
		
	});
	
	 
	$(".plusChck").each(function(i){
		
		$(this).attr("id","check"+i++);
		
		
	});
	
	$(".bookNum").each(function(i){
		
		$(this).attr("id","num"+i++);
		
		
	});
	$(".bookPrice").each(function(i){
		
		$(this).attr("id","price"+i++);
		
		
	});
	
	$(".removeBtn").each(function(i){
		
		$(this).attr("id","delete"+i++);
		
		
	});
	
	//삭제하기 
	
	
	
	

	$(".removeBtn").each(function(i) {


	$(".removeBtn").eq(i).click(function() {
	
		
		
		n[i]=0;
		p[i]=0;
		
				
		var cartISBN=$(".bookISBN").eq(i).val();
		var remove=$(".cartList").eq(i).css({"display":"none"});
		
		if(remove){
			
			 $("input[type='checkbox']").not("#allCartCheck").eq(i).prop('checked', false);
			 
			
			
		}
		
			var chLeng=$(":checked").not("#allCartCheck").length;
		
			var title=$(".title").eq(i).val();	
		
			$.ajax({
			traditional : true,
			type : 'get',
			dataType : 'text',
			url : "/nanam/pay/deleteBookList",
			data : {
				
				
				"nArr":n,
				"pArr":p,
				"title":title,
				"chLeng":chLeng,
				"cartISBN":cartISBN
				

			},

			success : function(data) {
				console.log("request succeeded");
				
				
				var dataCut=data.split(",");
				
				
				
				
					
					
				
				console.log(dataCut)
				
			
				
				$("#totalPrice").val(dataCut[0]);
				
				$("#leng").val(dataCut[1]);
				
					
				
			

			},
			error : function(xhr, ajaxOptions, thrownError) {
				console && console.log("request failed");
			},

			});//endOfAjax
	
		
				
		});
	
	

	});

	
	
	
	$(".buyBtn").click(function(){
		
		$(".bookISBN").each(function(i){
		
		var cartISBN=$(".bookISBN").eq(i).val();
		var cartId=$("#id").val();
		
		$.ajax({
			type : 'get',
			dataType : 'text',
			url : "/nanam/pay/cartDecide",
			data : {
				
				
				"cartId":cartId,
				"cartISBN":cartISBN
				

			},

			success : function(data) {
				alert("request succeeded");
				
			
				console.log(data)
					
			

			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert("request failed");
			},

			});//endOfAjax
	
		
		
		});
		
		
	});
	
	
	
	
	
	
	
});
	
	
	
</script>
  
  
  
 
  <c:set var="decide" value="${decide}"/>
  


    <form action="/nanam/pay/orderInsert" method="get" >
    
    
  <!--콘텐츠-->
        <div id="buyBooksWrap">
            <div id="buyBooksBox">
            
        
                
                <!--책구매 내부-->

                <div id="cartWrap">
    	<h2 >${login.id} 님의 장바구니 목록 </h2>
    	<input type="text" id="id" name="buyId" value="${login.id}">
                    <!--결제 정보창-->
                    <ul id="infoBoard">

                        <li>
                            <div style="color:#00c5aa;">
                                step01
                                책바구니

                            </div>

                        </li>
                        <li>
                            <div>
                                step02
                                주문하기

                            </div>

                        </li>
                        <li>
                            <div>
                                step03
                                결제하기

                            </div>
                        </li>
                        <li>
                            <div>
                                step04
                                주문완료

                            </div>
                        </li>

                    </ul>
                    <!--결제 정보창-->
                    <!--//결제 리스트-->
                    <div id="cart">
                        <!--주문 테이블-->
                        <table id="cartTable">
							<thead>
                            <tr>
                            	<th>
                            	
                            	 		<input type="checkbox" id="allCartCheck">
                            	</th>
                             
                                <th>
                                    이미지
                                </th>
                                <th>
                                    구매도서정보
                                </th>

                                <th>
                                    도서가격
                                </th>

                                <th>
                                    수량
                                </th>

                                <th>
                                    기능
                                </th>
                               
                            </tr>
                            
                           </thead>
                       
                           <tbody>
                           
                    
                        <c:forEach var="cart" items="${cartList}" varStatus="status">
                        
                       		
                       
                            <tr  class="cartList">
                            
                            	<td>
                            	
                            		<input type="checkbox" class="plusChck" >
                            	
                            	</td>
                         
                                <td>
        							<input type="text" name="bookImg" value="${cart.cartBookImageName}" style="display:none" >
									<img src="${nanam}/images/allbook_list/${cart.cartBookImageName}">
								
								</td>
                                <td>
                                  <input type="text" class="title" name="bookTitle" value="${cart.cartBookTitle}" style="display:none">${cart.cartBookTitle}
                                </td>

                                <td class="eachPrice">
                                 <input type="text"  name="bookPrice" class="bookPrice"  readonly value="${cart.cartBookPrice}" style="display:none">${cart.cartBookPrice}
                               	 <input type="text"  name="bookISBN" class="bookISBN"  readonly value="${cart.cartISBN}" >
                                
                                </td>
 								

                                <td>

                                    
                                    <input type="number" name="bookNum"  class="bookNum"  value="1"  min="1" max="20">
                                    <input type="button"  value="수량변경"  class="plusBtn" >
                                    
								
									
                                </td>
                               
									 
                               
                                <td>
                               	 <input type="button"  value="장바구니 비우기"  class="removeBtn" >
                               
                               
                                </td>
                            </tr>
                              
                          </c:forEach>
                     
          
                            </tbody>
                           
                            <tfoot>
                            <tr>
                            	<td>
                            	
                            	</td>
                                <td>

                                </td>
                                <td>

                                </td>

                                <td>
							
							
							
                                </td>
									
		
                                <td>
									<input type="text"  id="leng" name="leng"  readonly />

                                </td>
								 

                                <td id="allPrice">
                                   <input type="text"  id="totalPrice" name="totalPrice"  readonly />
                                    
                                </td>
                             
                            </tr>
							</tfoot>
                        </table>
                        <!--//주문 테이블-->

                        <div id="buyBtnWrap">
                         
                            <input type="submit" id="buy" class="buyBtn" value="주문하기">
                            
							

                        </div>
                    </div>
                    <!--//결제 리스트-->

                </div>
                <!--//책구매 내부-->
				
            </div>

            </div>
         </form>
        
         
         <!--//콘텐츠-->


<%@ include file="../main/footer.jsp" %>