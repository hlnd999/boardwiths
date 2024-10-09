<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" scope="application"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${ contextPath }/resources/css/boardList.css">
	<jsp:include page="../common/navbar.jsp"/>
</head>
<body>
		<div class="container" style="display:flex; width: 1440px;">
	    	<div class="d-block p-3 text-bg-dark text-center" style="width: 240px; height: 1000px;">
	            <span class="d-block fs-4">
	            Boardwiths
	            </span>
	        <hr>
	        <ul class="nav nav-pills flex-column mb-auto">
	            <li class="nav-item">
	                <a href="${pageContext.servletContext.contextPath}/usersMyPage.us" class="nav-link text-white" aria-current="page">마이페이지</a>
	            </li>
	            <li>
	                <a href="${pageContext.servletContext.contextPath}/userChange.us" class="nav-link text-white">회원정보 수정</a>
	            </li>
	            <li>
	                <a href="${pageContext.servletContext.contextPath}/siteOut.us" class="nav-link text-white">탈퇴하기</a>
	            </li>
	            <hr>
	            <li>
	                <a href="${pageContext.servletContext.contextPath}/myBoardList.us" class="nav-link text-white">작성글</a>
	            </li>
	            <li>
	                <a href="${pageContext.servletContext.contextPath}/myReplyList.us" class="nav-link text-white">작성댓글</a>
	            </li>
	            <li>
	                <a href="${pageContext.servletContext.contextPath}/myReBoardList.us" class="nav-link text-white">댓글단 글</a>
	            </li>
	            <li>
	                <a href="${pageContext.servletContext.contextPath}/myBoardLikeList.us" class="nav-link text-white">좋아요한 글</a>
	            </li>
	        </ul>
	        <hr>
	    </div>
	
	    <div class="d-inline-block p-3 text-bg-light flex-grow-1 text-align-center" style="width: 1100px;">
	    
        <div class="container d-flex justify-content-between mb-3">
        	<a class="d-flex text-black text-decoration-none fw-bold fs-5" href="${pageContext.servletContext.contextPath}/usermypage.us">마이페이지</a>
        	<div class="input-group mb-0" style="width:20%">
        	</div>
     	</div>
	
	
	        <table class="table table-hover">
		            <thead class="align-middle">
		                <tr>
		                    <th scope="col" width="100px" height="60">이름</th><td>${ loginUser.usersName }</td>
		                </tr>
		                <tr>
		                    <th scope="col" width="100px" height="60">닉네임</th><td>${ loginUser.nickname }</td>
		                </tr>
		                <tr>
		                    <th scope="col" width="100px" height="60">아이디</th><td>${ loginUser.id }</td>
		                </tr>
		                <tr>
		                    <th scope="col" width="100px" height="60">비밀번호</th><td>**********</td>
		                </tr>
		                <tr>
		                    <th scope="col" width="100px" height="60">휴대전화</th><td>${ empty loginUser.phone ? '-' : loginUser.phone }</td>
		                </tr>
		                <tr>
		                    <th scope="col" width="100px" height="60">이메일</th><td>${ empty loginUser.email ? '-' : loginUser.email }</td>
		                </tr>
		                <tr>
		                    <th scope="col" width="100px" height="60">회원등급</th><td>${ loginUser.grade }</td>
		                </tr>
		                 <tr>
		                    <th scope="col" width="100px" height="60">회원번호</th><td>${ loginUser.usersNo }</td>
		                </tr>
		                <tr>
		                    <th scope="col" width="100px" height="60">가입날짜</th><td>${ loginUser.enrollDate }</td>
		                </tr>
		                <tr>
		                    <th scope="col" width="100px" height="60">신고횟수</th><td>${ loginUser.reportCount }</td>
		                </tr>
		            </thead>
	           </table>
	        
	         <div class="mh-100" style="width: 100px; height: 280px;"></div>
	        
	    </div>
	</div>
	

	<div class="container py-3 my-4">
	    <ul class="nav justify-content-center pb-3 mb-3" style="position:sticky; ">
	      <li class="nav-item"><a href="${pageContext.servletContext.contextPath}/common/communityrule" class="nav-link px-2 text-body-secondary">커뮤니티 규칙</a></li>
	      <li class="nav-item"><a href="${pageContext.servletContext.contextPath}/common/regulation" class="nav-link px-2 text-body-secondary">서비스 약관/정책</a></li>
	      <li class="nav-item"><a href="${pageContext.servletContext.contextPath}/common/personal_info" class="nav-link px-2 text-body-secondary">개인정보취급방침</a></li>
	    </ul>
	    <p class="text-center text-body-secondary">회사명: 보드라이프 | 서울시 중구 을지로 | 등록번호: 594-39-29383 | <br>
	    Copyright © boardwiths / All rights reserved</p>
	</div>
    
    <script>
	    window.onload = () => {
	    	$('.nav-link').hover(function() {
	            $(this).addClass('active');
	        }, function() {
	            $(this).removeClass('active');
	        });
	    	
	        const loginUser = '${loginUser}';
	        if(loginUser == ''){
	            alert('로그인 후 이용해주세요.');
	            location.href='${pageContext.servletContext.contextPath}/loginView.us';
	        }
	    }
	</script>
	
</body>
</html>
