<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>td:hover{cursor: pointer;}</style>
    <link rel="stylesheet" href="${ contextPath }/resources/css/boardList.css">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
	<!-- 헤더 -->
	<header class="p-3 text-bg-white">
        <div class="container-fluid">
            <div class="d-flex flex-wrap align-items-center justify-content-between">
                <a href="${ contextPath }/home.do" class="d-flex align-items-left mb-2 mb-lg-0 text-black text-decoration-none">
                    <img class="d-flex align-items-left" src="${ contextPath }/resources/image/logo.png" width="350px" height="100px"/>
                </a>
                <div class="d-flex align-items-center">
                    <div class="text-end">
                        <button type="button" class="btn btn-primary">로그인</button>
                        <button type="button" class="btn btn-warning">회원가입</button>
                    </div>
                </div>
            </div>
        </div>
    </header>
    
	<div class="container" style="display:flex; width: 1440px;">
	    <div class="d-inline-block p-3 text-bg-dark" style="width: 240px; height: 1000px;">
	        <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
	            <span class="fs-4">
	            Boardwiths
	            </span>
	        </a>
	        <hr>
	        <ul class="nav nav-pills flex-column mb-auto">
	            <li class="nav-item">
	                <a href="selectNotice.bo" class="nav-link text-white" aria-current="page">공지사항</a>
	            </li>
	            <li>
	                <a href="selectBuyList.bo" class="nav-link text-white">구매게시판</a>
	            </li>
	            <li>
	                <a href="selectSellList.bo" class="nav-link text-white">판매게시판</a>
	            </li>
	            <li>
	                <a href="selectMatchList.bo" class="nav-link text-white">매칭게시판</a>
	            </li>
	            <li>
	                <a href="selectReviewList.bo" class="nav-link text-white">후기게시판</a>
	            </li>
	            <li>
	                <a href="selectQueryList.bo" class="nav-link text-white">문의게시판</a>
	            </li>
	        </ul>
	        <hr>
	    </div>
	
	    <div class="d-inline-block p-3 text-bg-light flex-grow-1 text-align-center" style="width: 1100px;">
	    
	    <!-- 쪽지 작성 폼 -->
        <div class="container">
            <h2 class="text-center my-4">쪽지 작성</h2>
            
            <form action="${contextPath}/sendMessage.me" method="post" class="row g-3">
                <div class="mb-3">
                    <label for="sender" class="form-label">보내는 사람</label>
                    
                    
                    <input type="text" class="form-control" id="sender" name="sender" value="${currentUser.nickname}" readonly>
                </div>
                <div class="mb-3">
                    <label for="receiver" class="form-label">받는 사람</label>
                    <input type="text" class="form-control" id="receiver" name="receiver" required>
                </div>
                <div class="mb-3">
                    <label for="content" class="form-label">쪽지 내용</label>
                    <textarea class="form-control" id="content" name="content" rows="5" required></textarea>
                </div>
                <div class="mb-3">
                    <button type="submit" class="btn btn-primary">전송</button>
                    <button type="reset" class="btn btn-secondary">초기화</button>
                </div>
            </form>
        </div>
        
	    </div>
	</div>

    
    <!-- 풋터 -->
    <div class="container-fluid">
        <footer class="py-3 my-4">
            <ul class="nav justify-content-center border-bottom pb-3 mb-3">
                <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Home</a></li>
                <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Features</a></li>
                <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Pricing</a></li>
                <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">FAQs</a></li>
                <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">About</a></li>
            </ul>
            <p class="text-center text-body-secondary">© 2024 Company, Inc</p>
        </footer>
    </div>
</body>
</html>
