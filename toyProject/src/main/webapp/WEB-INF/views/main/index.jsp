
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="root" value="${pageContext.request.contextPath} "/>


<script type="text/javascript">







</script>
    
<%@ include file="/WEB-INF/views/include/header.jsp" %>
    
    

  
    <link rel="stylesheet" type="text/css" href="${root}/resources/css/index.css">    
<!--콘텐츠-->

    <h2>
        <a><img alt="프로모션이미지" src="${root}/resources/images/0FB6C7666A5345B5BE9B5D46B874B91C.jpg"></a>

    </h2>



    <div id="schedule-list">

        <a>공연일정 전체보기</a>


    </div>

    <div id="main-img-list">
        <ul id="info-images">
            <li>
                <a>
                    <img alt="공연장 소개" src="${root}/resources/images/opera-house-2476927_1920.jpg">
                </a>
            </li>
            <li>
                <a>
                    <img alt="층별 안내" src="${root}/resources/images/vatican-1136071_1920.jpg">
                </a>
            </li>
            <li>
                <a>
                    <img alt="좌석 배치도" src="${root}/resources/images/spectacular-room-1727890_1920.jpg">
                </a>
            </li>
            <li>
                <a>
                    <img alt="오시는길" src="${root}/resources/images/opera-house-2476935_1280.jpg">
                </a>
            </li>
        </ul>
    
    </div>

<!--//콘텐츠-->
    
        
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

