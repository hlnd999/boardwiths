<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
        /*메뉴바 스타일*/
        nav ul{list-style-type: none; line-height:100px; font-size:18px;}
        nav span:hover{background:pink; cursor:pointer;}
    </style>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	
</head>
<body>
     <c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/> 
     <%-- <ul class="nav nav-pills flex-column text-center d-inline-block p-3 text-bg-dark" style="font-weight: bold;">
         <li class="nav-item">
        	 <a class="nav-link adminNav" aria-current="page" href="${contextPath}/adminMain.ad">관리자 메인</a>
         </li>
         <li class="nav-item">
         	<a class="nav-link adminNav" aria-current="page" href="${contextPath}/dailyInfoSearch.ad?term=week">일자별 이용량</a>
         </li>
         <li class="nav-item">
         	<a class="nav-link adminNav" aria-current="page" href="${contextPath}/weekSearchUsers.ad">회원 목록</a>
         </li>
         
         <li class="nav-item">
         	<a class="nav-link adminNav" aria-current="page" href="${contextPath}/weekReportList.ad">신고 목록</a>
         </li>
         <li class="nav-item">
         	<a class="nav-link adminNav" aria-current="page" href="${contextPath}/gameList.ad">게임 목록</a>
         </li>
         <li class="nav-item">
         	<a class="nav-link adminNav" aria-current="page" href="${contextPath}/queryList.ad">문의 목록</a>
         </li>
     </ul>  --%>
     
     <ul style="color: white; font-weight:bold;">
         <li>
             <span onclick="location.href='${contextPath}/adminMain.ad'" class="adminNav">관리자 메인</span> 
         </li>
         <li>
             <span onclick="location.href='${contextPath}/dailyInfoSearch.ad?term=week'" class="adminNav">일자별 이용량</span> 
             <!-- dailyInfoSearch.ad?term=week 로 변경함 -->
         </li>
         <li>
             <span onclick="location.href='${contextPath}/weekSearchUsers.ad'"class="adminNav">회원 목록</span> 
             <!-- /weekSearchUsers.ad -->
         </li>
         <li>
             <span onclick="location.href='${contextPath}/weekReportList.ad'" class="adminNav">신고 목록</span> 
             <!--  /weekReportList.ad -->
         </li>
         <li>
             <span onclick="location.href='${contextPath}/gameList.ad'" class="adminNav">게임 목록</span> 
         </li>
         <li>
             <span onclick="location.href='${contextPath}/weekQueryList.ad'" class="adminNav">문의 목록</span> 
         </li>
     </ul>
        
     <script>
	  	/* window.onload = () => {
            const adminNavs = document.querySelectorAll('.adminNav');
            for(const n of adminNavs) {
                n.addEventListener('click', function() {
                    for(let i = 0; i < 6; i++) {
                        if(this == adminNavs[i]) {
                            //adminNavs[i].style.fontSize = 30;
                        } else {
                            //adminNavs[i].style.background = 'black';
                        }
                    }
                })
            } 
        } */
 	</script>
</body>
</html>