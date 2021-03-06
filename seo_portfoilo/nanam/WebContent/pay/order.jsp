<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    
<%@ include file="../main/header.jsp" %>

<link rel="stylesheet" href="${nanam}/css/order.css" >

<link rel="stylesheet" href="${nanam}/css/cart.css" >



<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}


</script>

<script>


 $(function(){
	 
	 
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
		
		$("#total").val(total);
	 
	 
	 
	 
 });


</script>


<script>
    var checkUnload = true;
    $(window).on("beforeunload", function(){
        if(checkUnload) 
        	
        	var id=$("id").val();
        	
        	
        	$.ajax({
    			traditional : true,
    			type : 'get',
    			dataType : 'text',
    			url : "/nanam/pay/deleteOrderList",
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


 	

<form method="get" action="/nanam/pay/beforePay">





<div id ="cartWrap">




		<h2 >${login.id} 님의 주문 목록 </h2>
		<h3>${login.id} 님의 포인트${login.point }</h3>
    	<input type="text" id="id" name="buyId" value="${login.id}" style="display:none">
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
                           
                       
                        <c:forEach var="buy" items="${buy}" varStatus="status">
                       
                       
                       
                            <tr  class="cartList">
                              
                                <td>
        							<input type="text" name="bookImg" value="${buy.cartBookImageName}" style="display:none" >
									<img src="${nanam}/images/allbook_list/${buy.cartBookImageName}">
								
								</td>
                                <td>
                                  <input type="text" class="title" name="bookTitle" value="${buy.cartBookTitle}" style="display:none">${buy.cartBookTitle}
                                </td>

                                <td class="eachPrice">
                                 <input type="text"  name="bookPrice" class="bookPrice"  readonly value="${buy.cartBookPrice}" style="display:none">${buy.cartBookPrice}
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
									포인트 :<input name="point" value=${login.point } />
									
                                </td>
								 
                                <td id="allPrice">
                                  <input name="total" id="total" readonly>
                                </td>
                               
                          
                            </tr>
							</tfoot>
                        </table>
                        
                        <!--//주문 테이블-->

            
            </div>
            <!--//결제 리스트-->
          
        
        <!--//책구매 내부-->
 
        
            
        <div class="buyFormWrap">
      
           
                    <!--주문 테이블-->
                    <table id="orderFirstTable" class="orderTable" >
                        <tr>
                            <td>
                                주문자		
                    
                    
                            </td>
                        </tr>
                        <tr>
                            <td>
                                주문 하시는 분*
                            </td>
                            <td>
                                <input type="text" name="name" value="${login.name}">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                전화번호*
                            </td>
                            <td>
                                <input type="tel" name="phone" value="${login.phone}" >
                            </td>
                    
                        </tr>
                        <tr>
                            <td>
                                이메일
                            </td>
                            <td>
                                <input type="email" name="email" value="${login.email}" >
                            </td>
                        </tr>
                        <tr>
                            <td>
                               우편번호*
                            </td>
                            <td>
                                <input type="text" name="zipcode" value="${login.zipcode}">
                            </td>
                        </tr>
                          <tr>
                            <td>
                                주소*
                            </td>
                            <td>
                                <input type="text" name="address" value="${login.address}" >
                            </td>
                        </tr> 
                        
                        <tr>
                            <td>
                                상세주소*
                            </td>
                            <td>
                                <input type="text" name="detailAddress" value="${login.detailAddress}" >
                            </td>
                        </tr>
                    </table>
                    <!--//주문 테이블-->
                    
           

        </div>
        <!--//주문 테이블 영역-->
         <!--주문 테이블2 영역-->
         <div class="buyFormWrap">
         			<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" id="findAddressBtn" >
                    <!--주문 테이블2-->
                    <table id="orderSecondTable" class="orderTable"  >
                        <tr>
                            <td>
                                받으시는분     
                    
                    
                            </td>
                        </tr>
                        <tr>
                            <td>
                                받으시는 분*
                            </td>
                            <td>
                                <input type="text" name="orderName" value="${login.name}">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                휴대전화번호*
                            </td>
                            <td>
                                <input type="tel" name="orderPhone" value="${login.phone}">
                            </td>
                    
                        </tr>
                         <tr>
                            <td>
                  	우편번호*
                            </td>
                            <td>
                                 <input type="text" id="sample6_postcode"   class="join notMust" name="orderZipcode" value="${login.zipcode }"> 
                            </td>
                        </tr>
                      
                        <tr>
                            <td>
                                주소*      
                            </td>
                            <td>
                               <input type="text" id="sample6_address"  class="join notMust" name="orderAddress" value="${login.address}"><br> 
                            </td>
                        </tr>
                        <tr>
                            <td>
                                상세주소*
                            </td>
                            <td>
                                <input type="text"  id="sample6_detailAddress" name="orderDetailAddress" value="${login.detailAddress}">
                            </td>
                        </tr>
                        <tr>
                            <td>
                  	주소 참고항목
                            </td>
                            <td>
                               <input
								type="text" id="sample6_extraAddress"  class="join notMust" >
                                
                            </td>
                        </tr>
                        
                        <tr>
                            <td>
                  	요청사항
                            </td>
                            <td>
                               <input
								type="text" id="orderCall"  class="join notMust" >
                                
                            </td>
                        </tr>
                        
                    </table>
                    <!--//주문 테이블2-->
         
						
					
				
						
           

        </div>
        
        <!--//주문 테이블2 영역-->
        <!--주문테이블 3 영역-->
       
        <div id="oderBtnWrap">
            <input type="submit" class="oderBtn" id="nextOderBtn"  value="결제하기">
			<input type="reset" class="oderBtn" id="nextOderBtn"  value="취소하기">
        </div>

</div>
</form>
<%@ include file="../main/footer.jsp" %>