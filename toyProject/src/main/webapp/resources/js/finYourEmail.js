

function finYourEmail(){
	
	
	
	var fromStr="hongcha11@naver.com";
	
	var titleStr="This is Email test.";
		
	var contentStr="Learn how to send email using Spring.";
		
	var name=document.getElementById("emailName").value
	
	var from=document.getElementsByName("emailFrom")[0].value
	
	
	var title=document.getElementsByName("emailTitle")[0].value
	
	var content=document.getElementsByName("emailContent")[0].value
	
	var inputKey=document.getElementById("inputKey").value
	
	var confirmKey=document.getElementById("confirmKey").value
	
	var mailTo=document.getElementById("emailTo").value
	
	console.log(confirmKey)

	if(name !=$.trim(name)){
		
		alert("귀하의 이름 창의 앞뒤 공백을 제거해주세요");
		return false;
	}else if(name.trim().length<1){
		
		alert("귀하의 이름을 입력해주세요")
		return false;
		
	}else if(from != $.trim(from)){
		alert("발송 이메일의 앞뒤 공백을 제거해주세요");
		from.focus();
		return false;
		
			
	}else if(from.trim().length<1){
		
		alert("발송 이메일을 입력해주세요");
		from.focus();
		return false;
	
	}else if ( title !=$.trim(title) ) {
		alert("제목의 앞뒤 공백을 제거해주세요");
		title.focus();
		return false;	
		 
		
	}else if(title.trim().length<1){	
		
		title.focus();
		alert("제목을 입력해주세요")
		return false;
	 
	}else if(content.trim().length<1){
		
		alert("콘텐츠 값을 입력해주세요");
		content.focus();
		return false;
		
	}else if(title !=titleStr){
		
		alert("유효하지 않은 제목입니다.")
		return false;
	
	
	}else if(from !=fromStr){
		
		alert("유효하지 않은 발신인입니다.")
		return false;
		
	}else if(content!=contentStr){
		
		alert("유효하지 않은 내용입니다.")
		return false;
	
	}else if(inputKey != confirmKey){
		
		alert("인증키를 확인해 주세요");
		return false;
	
	}else{
		
		var app="";
    	
    	app+="<form id='to-inputUserInfo' action='/member/inputUserInfo' method='post'>"
    	app+= "<input type='hidden' name='mailTo' value="+mailTo+">"
    	app+= "<input type='hidden' name='emailName' value="+name+">"
    	app+= "<input type='hidden' name='emailKey' value="+inputKey+">"
    	app+="</form>" 
    	
    		document.getElementById("frm-area").innerHTML =app
    	
    		$("#to-inputUserInfo").submit();
			
			
		return true;
		
		
	}
	
	


}