<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




<%@ include file="../main/header.jsp" %>

<script>


$(function(){
	
	var total=parseInt($("#totalPrice").val());
	var pay=parseInt($("#pay").val());
	var point=parseInt($("#userPoint").val());
	
	
	if(pay !="" && pay==total && point>0 && point>=total &&total>0  ){
		
		$("#payBtn").prop("disabled",false);
		
	}else {
		
		$("#payBtn").prop("disabled",true);
	}
	
	
	
	
	$("#pay").blur(function(){
	
		var total=parseInt($("#totalPrice").val());
		var pay=parseInt($("#pay").val());
		var point=parseInt($("#userPoint").val());
		
		
		if(pay !="" && pay==total && point>0 && point>=total &&total>0  ){
			
			$("#payBtn").prop("disabled",false);
			
		}else {
			
			$("#payBtn").prop("disabled",true);
		}
		
		
		
	});
	
	
	
	
	
	
	
});


</script>





    
<link rel="stylesheet" href="${nanam}/css/cart.css" >
<link rel="stylesheet" href="${nanam}/css/pay.css" > 
<c:set var="total" value="${total}"/>    
<c:set var="point" value="${point}"/> 
    
<form action="/nanam/pay/afterPay" method="get">
      <!--콘텐츠-->
    <div id="buyBooksWrap">
       
            
            <!--//basebar-->
            <!--책구매 내부-->

            <div id="cartWrap">
                <h2 >${login.id} 님의 주문 목록 </h2>
    		<input type="text" id="payId" name="buyId" value="${login.id}">
                <!--결제 정보창-->
                <ul id="infoBoard">

                    <li>
                        <div>
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
                        <div style="color:#00c5aa;">
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
                                    총가격
                                </th>

                    
                               
                            </tr>
                            
                           </thead>
                       
                          <tbody>
                           
                       
                        <c:forEach var="buy" items="${orderList}" varStatus="status">
                       
                       
                       
                            <tr  class="cartList">
                              
                                <td>
        							<input type="text" name="bookImg" value="${buy.cartBookImageName}" style="display:none" >
									<img src="${nanam}/images/allbook_list/${buy.cartBookImageName}">
								
								</td>
                                <td>
                                  <input type="text" class="bookTitle" name="bookTitle" value="${buy.cartBookTitle}" style="display:none">${buy.cartBookTitle}
                                </td>

                                <td class="eachPrice">
                                 <input type="text"  name="bookPrice" class="bookPrice"  readonly value="${buy.buyEachPrice}" style="display:none">${buy.buyEachPrice}
                                </td>
 								

                                <td>

                                    
                                    <input type="number" name="bookNum"  class="bookNum"  value="${buy.buyEachNum}" style="display:none">${buy.buyEachNum}
                                    
                                 
								
									
                                </td>
                               
									 
                               
                                <td>
                               
                               
                               
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
								 
                                <td id="allPrice">
                                  <input name="totalPrice" id="totalPrice" value="${total}" style="display:none">  ${total}
                                </td>
                               
                          
                            </tr>
							</tfoot>
                        </table>
                        
                        <!--//주문 테이블-->
            
            </div>
            <!--//결제 리스트-->
          
            </div>
        <!--//책구매 내부-->
        <!--주문 테이블 영역-->
       
      
  
        <!--주문테이블 3 영역-->
        <div id="payFormWrap">
     				 아이디 ${login.id}님의 포인트<input name="userPoint" id="userPoint" value="${login.point}"  readonly>
     				 
     				 
           			 <input name="userPhone" id="userPhone" value="${login.phone}" style="display:none">
                    <!--주문 테이블3-->
                    <table id="payFirstTable" class="orderTable" >
                        <tr>
                            <td>
                                결제수단
                            </td>
                            
                            <td>
                                 포인트    
                    
                    
                            </td>
                        </tr>
                        <tr>
                            <td>
                                포인트사용
                            </td>
                            <td>
                                <input type="text" id="pay" name="payPoint" value="${total}"  >원 
                            </td>
                        </tr>
                    </table>
                    <!--//주문 테이블3-->
            
           

        </div>
        <div id="orderBtnWrap">
            <input type="submit" id="payBtn"  class="oderBtn"  value="결제하기">
            <input type="reset" id="notPayBtn" class="oderBtn"  value="취소하기">

        </div>
        
     </div>
  </form>
<%@ include file="../main/footer.jsp" %>