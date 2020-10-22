<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




<%@ include file="../main/header.jsp" %>




	<h1>결과</h1>
    <table border="1" >
        <tr>
            <td>이름</td>
            <td>아이디</td>
            <td>비밀번호</td>
            <td>이메일</td>
            <td>주소</td>
            <td>수정일</td>
            <td>보유 포인트</td>
        </tr>
        <tr>
            <td id="name">${login.name}</td>
            <td id="id">${login.id}</td>
            <td id="pwd">${login.pwd}</td>
            <td id="email">${login.email}</td>
            <td id="address">${login.address}</td>
            <td id="indate">${login.adjustIndate}</td>
            <td>${login.point}</td>
            
        </tr>
    </table>
    <a href="${nanam}/main/index.jsp">메인 페이지 이동</a>
    
<%@ include file="../main/footer.jsp" %>