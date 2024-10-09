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
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
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
	                <a href="${pageContext.servletContext.contextPath}/receiveMessage.us" class="nav-link text-white" aria-current="page">받은 쪽지함</a>
	            </li>
	            <li>
	                <a href="${pageContext.servletContext.contextPath}/sendMessage.us" class="nav-link text-white">보낸 쪽지함</a>
	            </li>
	        </ul>
	        <hr>
	    </div>
	
	    <div class="d-inline-block p-3 text-bg-light flex-grow-1 text-align-center" style="width: 1100px;">
	    
	    <!-- 쪽지 작성 폼 -->
        <div class="container">
            <h2 class="text-center my-4">쪽지 작성</h2>
            
            <form action="${contextPath}/insertMessage.us" method="post" class="row g-3">
                <div class="mb-3">
                    <label for="sender" class="form-label">보내는 사람</label>
                    
                    
                    <input type="text" class="form-control" id="sender" name="sender" value="${loginUser.nickname}" readonly>
                </div>
                <div class="mb-3">
                    <label for="receiver" class="form-label">받는 사람</label>
                    <input type="text" class="form-control" id="receiver" name="noteReceiver" required>
                </div>
                <div class="mb-3">
                    <label for="content" class="form-label">쪽지 내용</label>
                    <textarea class="form-control" id="content" name="noteContent" rows="5" required></textarea>
                </div>
                <div class="mb-3">
                    <button type="submit" class="btn btn-primary" id="noteSubmit">전송</button>
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
    
    <script>
    	
    	window.onload = () => {
    		const urlParams = new URLSearchParams(window.location.search);
			const receiver = urlParams.get('receiver');
			if (receiver) {
				document.getElementById('receiver').value = receiver;
			}
			
    		if('${message}' != '') {
    			alert('${message}')
    		}
    		
    		if('${receiver}' != ''){
    			document.getElementById('receiver').value = '${receiver}';
    		}
    		
    		if('${content}' != ''){
    			document.getElementById('content').value = '${content}';
    		}
    		
    		
    		
    		
    		
    		
    		
    		
    	}
    
    </script>
    
    
    
    
    
    
    
    
    
    
    
    
    
</body>
</html>
