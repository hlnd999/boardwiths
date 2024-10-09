<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" scope="application"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
<header class="p-3 text-bg-white">
    <div class="container" style="width: 1440px">
        <div class="d-flex flex-wrap align-items-center justify-content-between">
            <a href="${ contextPath }/home.do" class="d-flex align-items-left mb-2 mb-lg-0 text-black text-decoration-none">
                <img class="d-flex align-items-left" src="${ contextPath }/resources/logo.png" width="320px" height="100%"/>
            </a>
            <div class="d-flex align-items-center">
                <div class="text-end">
                	<c:if test="${ loginUser == null }">
	                    <button type="button" class="btn" onclick="location.href='${contextPath}/loginView.us'" style="background: dodgerblue; color: white;">로그인</button>
	                    <button type="button" class="btn" onclick="location.href='${contextPath}/enroll.us'"style="background: blue; color: white;">회원가입</button>
                    </c:if>
                    <c:if test="${ loginUser != null }">
                		<c:if test="${ loginUser.isManager == 'N' }">
	                		<div class="dropdown">
	                		<span>${ loginUser.nickname }님</span>
	                		<button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">내 정보</button>
	                		<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton">
					                <li class="d-flex justify-content-between">
					                    <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/usersMyPage.us">마이페이지<br>확인하기</a>
					                    <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/usersChange.us">회원정보<br>수정하기</a>
					                    <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/receiveMessage.us">쪽지함<br>페이지</a>
					                </li>
					            </ul>
		                    <button type="button" class="btn" onclick="location.href='${contextPath}/logout.us'"style="background: blue; color: white;">로그아웃</button>
	                		</div>
	                    </c:if>
	                    <c:if test="${ loginUser.isManager == 'Y' }">
	                    	<span>${ loginUser.nickname } 관리자님</span>
	                		<button type="button" class="btn" onclick="location.href='${contextPath}/adminMain.ad'" style="background: dodgerblue; color: white;">관리페이지</button>
		                    <button type="button" class="btn" onclick="location.href='${contextPath}/logout.us'"style="background: blue; color: white;">로그아웃</button>
	                    </c:if>
                	</c:if>
                </div>
            </div>
        </div>
    </div>
</header>