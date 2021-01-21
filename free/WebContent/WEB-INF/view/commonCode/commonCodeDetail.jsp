<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="defualtCode" value="${list.defualt}"/>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

$(function(){

	/*추가 인풋창 추가 

	체크박스 항상 활성화 

	추가쪽엔 체크박스 없어도 됨

	체크박스 클릭후 수정 버튼 눌렀을때 체크되어있는 로우가 활성화 

	코드는 수정이 안되게 

	삭제
	
	*/
	
	var j=0;
	
	var text="";
	var radio="";
	var checkbox="";

	
	var allArr=new Array();
	
	var len=$("input[type='radio']").length;

	
	var flag="";
	
	function Init(text,radio,checkbox){
		
		this.text=text;
		this.radio=radio;
		this.checkbox=checkbox;
		
	}
	
	
	
	
	
	function Flag(flag){
		
		this.flag=flag;
	}
	
	
	

	function disabled() {
			
		Init.text=$(".text").prop("disabled", true);

		Init.radio=$(".radio").prop("disabled", true);

		
	}
	
	function readOnly(){
		
		
		var defaultValue=$("input[name='defualtCode']").val();
		
		for(var i=0; i<$("input[name='newCode']").length; i++){
			
			var undi =$($("input[name='newCode']").get(i)).val();
			
			
			if(undi.toString() ==="undefined"){
					
			$("input[name='newCode']").eq(i).attr("value",defaultValue);
			
			}
		}
		
	}
	
	
	disabled();
	
		$("#plusBtn").click(function() {

				var code = $(".code").val();
				
				

				var defualtCode=$("input[name='defualtCode']").val();
				var htmls = "";
				
				console.log(defualtCode)

				if (j < 3 ) {
					
					
					len++
					htmls += "<tr>"
					htmls += "<td>"
					htmls += "<input  type='hidden' name='defaultCode' value='"+defualtCode+"' readonly>"
					
					htmls += "<input  style='width:100px' class='code' name='newCode' value='"+code+"' readonly>"
					htmls += "</td>"
					htmls += "<td>"
					htmls += "<input  class='decode' name='newDecode'>"
					htmls += "</td>"
					htmls += "<td>"
					htmls += "<input  class='codeName' name='newCodeName'>"
					htmls += "</td>"
					htmls += "<td>"
					htmls += "Y:<input  class='useyn' type='radio' name="+len+'newRadio'+" value='Y'>"
					htmls += "N:<input  class='useyn' type='radio' name="+len+'newRadio'+" value='N'>"
					htmls += "</td>"
					htmls += "</tr>"

					j++;

					$("#tbl").append(htmls)

					
					
				}
				
				readOnly()
				
					
				
				$($("input[name $='newRadio']:even")).prop("checked",true);
				
					
			
						
			})

		
			

		$(".chck").each(function(i){
		
			
			$($(".chck").eq(i)).click(function(){
				
				
				$("#modiBtn").click(function() {
					
					if($($(".chck").eq(i)).is(":checked") == true){	
				
					
						
						$(".code").eq(i).prop("disabled",false);
		
						$(".decode").eq(i).prop("disabled",false);
					
		
						$(".codeName").eq(i).prop("disabled",false);
						
		
						$(".testRadio").eq(i).children().prop("disabled",false);
					
						
					
						
						Flag.flag="U";
					
					}
					
					$($(".chck").eq(i)).prop("checked",false);
					
				
						
				});
		
				
			})
			
		})
		

		$(".chck").each(function(i){
		
			
			
			
			$($(".chck").eq(i)).click(function(){
				
				
				   
				
				
				$("#removeBtn").click(function(){
					
				
				if($($(".chck").eq(i)).is(":checked") == true){	
				
						$($("input[name='oriCode']").get(i)).css("color","red");
		
						$($("input[name='oriDecode']").get(i)).css("color","red");
			
		
						$($("input[name $='oriRadio']").get(i)).prop("disabled",true);
			
						$($("input[name='oriCodeName']").get(i)).css("color","red");
						
						var fontOricode = $($("input[name='oriCodeName']").get(i)).css("color").toString();
						
						
						if(fontOricode==="rgb(255, 0, 0)"){
							
							
							Flag.flag="D";	
							
							console.log(Flag.flag)
							
						}

					}
						
		
				
						$($(".chck").eq(i)).prop("checked",false);
					
					});
				
				
				})
			
			})
					
			

		$("#onBtn").click(function() {

			var code = "";
			

			var oriDecode = "";
			var oriCodeName = "";
			var oriRadio = "";

			var newDecode="";
			var newCodeName="";
			var newRadio="";
			

			var update = {};
			var insert={};			
			var remove={};
			
			//업데이트
			
			for(var i=0; i<$("input[name='oriCode']").length; i++){
				if($($("input[name='oriCode']").get(i)).is("disabled")==false && Flag.flag=="U"){
					
					oriCode = $($("input[name='oriCode']").get(i)).val();	
					oriDecode = $($("input[name='oriDecode']").get(i)).val();
					oriCodeName = $($("input[name='oriCodeName']").get(i)).val();
					oriRadio = $($("input[name $='oriRadio']").get(i)).val();
					
						
						update = {
								"uCode" : oriCode,
								"uDecode" : oriDecode,
								"uDecodeName" : oriCodeName,
								"uUseyn" : oriRadio
						};
					
						allArr.push(update)
	
						console.log(update)
						
					}
			
			
			}
			
			//삭제
		
			
			
			for(var i=0; i<$("input[name='oriCode']").length; i++){
			var fontOricode = $($("input[name='oriCodeName']").get(i)).css("color").toString();
				
				
			if(fontOricode==="rgb(255, 0, 0)"){
				
			removeCode = $($("input[name='oriCode']").get(i)).val();	
			removeDecode = $($("input[name='oriDecode']").get(i)).val();
			removeCodeName = $($("input[name='oriCodeName']").get(i)).val();
			removeRadio = $($("input[name $='oriRadio']").get(i)).val();
			
			
			
			
			if(Flag.flag=="D"){
			
				remove={
					
					"dCode":removeCode,
					"dDecode":removeDecode
					
						};
					allArr.push(remove);
				
					}
			
				}
			
		
			}
			
			
			//인서트
			for (var i = 0; i < $("input[name='newCode']").length; i++) {
				
				oriDeCode=$($("input[name='oriDecode']").get(i)).val();
				
				
				newCode = $($("input[name='newCode']").get(i)).val();
				
				newDecode=$($("input[name='newDecode']").get(i)).val();
				newCodeName=$($("input[name='newCodeName']").get(i)).val();
				newRadio=$($("input[name $='newRadio']").get(i)).val();
				
				if(oriDeCode==newDecode){
					
					alert("중복된 코드입니다.")
					
					return false;
					
				}
				
				insert = {
						"iCode":newCode,
						"iDecode":newDecode,
						"iDecodeName":newCodeName,
						"iUseyn":newRadio	
					};
				

				allArr.push(insert)
			
				
			}
				
			console.log(allArr);
			
			
			$.ajax({
				traditional : true,
				async : true,
				url : "/commCodeInsertPro.ino",
				dataType : "json",
				data : JSON.stringify(allArr),		
				type : "POST",
				contentType : "application/json; charset=UTF-8",

				success : function(data) {

					
					if(data!=null){
						
						alert("등록에 성공했습니다.");
						location.reload();
						
						
					}
					
					
				},

			});//endOfAjax	

		})
		
		

	})
</script>


</head>
<body>
   <div>
      <h1>추가코드 Main</h1>
   </div>
   <div style="width:650px;" align="right">
      <a href="/commCodeInsert.ino">인서트페이지로</a>
   </div>
   
   <div>
   
   <input type="button" id="plusBtn" value="추가">
   <input type="button" id="onBtn" value="등록">
   <input type="button" id="modiBtn" value="수정">
   <input type="button" id="removeBtn"value="삭제">
   </div>

   <hr style="width: 600px">
   <table style="width: 600px">
      <tr>
         <th align="left" style="padding-left: 50px;">코드</th>
         <th>코드명</th>
         <th>내용</th>
         <th>사용유무</th>
      </tr>
                
   </table>
	
	
	<input type="hidden" name="defualtCode" value="${defualtCode}" />
	   <table id="tbl">
	   
	 
	   <c:forEach var="nRow" varStatus="status" items="${list.list}">
	      <tr>
	      <td class="testCode">
	      
	  		
	      
	      	<input class="chck" type="checkbox"> <input type='text' style="width:80px" class="code text" name="oriCode" value="${nRow.CODE}" readonly>
	     	
	    
	     
	       </td>
	       
	       <td class="testDecode"> 
	         <input class="decode text" type='text' name="oriDecode" value="${nRow.DECODE }" readonly>
	        </td>
	        <td class="testCodeName"> 
	         <input class="codeName text" type='text' name="oriCodeName"  value="${nRow.DECODE_NAME} " >
	        </td>
	        <td class="testRadio"> 
	         Y:<input type="radio" class="useyn radio"  name="${status.index}oriRadio" value="Y" <c:if  test="${nRow.USE_YN eq 'Y'}" >checked='checked'</c:if>>
	         N:<input type="radio" class="useyn radio" name="${status.index}oriRadio" value="N" <c:if  test="${nRow.USE_YN eq 'N'}" > checked='checked'</c:if>>
	      </td>
	      </tr>
	     
	   </c:forEach>
		</table>
	
</body>
</html>