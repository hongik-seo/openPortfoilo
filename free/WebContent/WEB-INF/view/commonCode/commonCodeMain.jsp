<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script type="text/javascript">


	
</script>


</head>
<body>
   <div>
      <h1>공통코드 Main</h1>
   </div>
   <div style="width:650px;" align="right">
      <a href="/commCodeInsert.ino">인서트페이지로</a>
   </div>

   <hr style="width: 600px">
   <table style="width: 600px">
      <tr>
         <th align="left">코드</th>
         <th>코드명</th>
         <th>사용유무</th>
      </tr>

   </table>
   
  
   <c:forEach var="nRow" items="${list}">
      <div style="width: 120px; float: left;">${nRow.CODE }</div>
         <div style="width: 300px; float: left;"><a  href="#" onclick="window.open('/commonCodeDetail.ino?num=${nRow.CODE }', 'popup test','width = 800, height = 500, top = 100, left = 200')" >${nRow.CODE_NAME }</a></div>
         <div style="width: 150px; float: left;">${nRow.USE_YN }</div>
      <hr style="width: 600px">
   </c:forEach>

</body>
</html>