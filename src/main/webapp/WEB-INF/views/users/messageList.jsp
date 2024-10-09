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
	    
	    <!-- 검색창 -->
        <div class="container d-flex justify-content-between mb-3">
        	<a class="d-flex text-black text-decoration-none fw-bold fs-5" href="${contextPath}/myBoardList.us">내가 쓴 글 ></a>
        	<a class="d-flex text-black text-decoration-none fw-bold fs-5" href="${contextPath}/myReplyList.us">작성댓 글 ></a>
        	<a class="d-flex text-black text-decoration-none fw-bold fs-5" href="${contextPath}/myReBoardList.us">댓글단 글 ></a>
        	<a class="d-flex text-black text-decoration-none fw-bold fs-5" href="${contextPath}/myBoardLikeList.us">좋아요 글 ></a>
        	<a class="d-flex text-black text-decoration-none fw-bold fs-5" href="${contextPath}/messageList.us" >쪽지함 ></a>
        	<div class="input-group mb-0" style="width:20%">
         		<input type="text" class="form-control" placeholder="검색하기..." aria-describedby="project-search-addon">
          
	          	<div class="input-group-append">
	          		<button class="btn btn-primary" type="button" id="project-search-addon">
	          			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
							<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
						</svg>
	          		</button>
	          	</div>
          
        	</div>
         
     	</div>
		        
		        
	        <table class="table table-hover align-middle">
	            <thead>
	                <tr>
	                    <th scope="col" width="100px">선택</th>
	                    <th scope="col" width="200px">보낸사람</th>
	                    <th scope="col">내용</th>
	                    <th scope="col" width="200px">작성일</th>
	                </tr>
	            </thead>
	            <tbody>
	                <c:forEach items="${ list }" var="n">
	                    <tr style="height: 80px">
	                        <th><input type="checkbox" class="checkbox"></th>
	                        <td>${ n.nickname }</td>
	                        <td>${ n.noteContent }</td>
	                        <td>${ n.noteDate }</td>
	                    </tr>
	                </c:forEach>
	            </tbody>
	        </table>
	        
	        <nav aria-label="Standard pagination example">
	                <ul class="pagination justify-content-center">
	                    <!-- 이전 버튼 -->
	                    <li class="page-item">
	                        <c:url var="goBack" value="${ loc }">
	                            <c:param name="page" value="${ pi.currentPage-1 }"/>
	                        </c:url>
	                        <a class="page-link <c:if test="${ pi.currentPage == 1}">disabled</c:if>" href="${ goBack }" aria-label="Previous">
	                            <span aria-hidden="true">&laquo;</span>
	                        </a>
	                    </li>
	                    <!-- 페이지 넘버링 버튼 -->
	                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
	                        <c:url var="goNum" value="${ loc }">
	                            <c:param name="page" value="${ p }"/>
	                        </c:url>
	                        <li class="page-item <c:if test="${ p == pi.currentPage }">active</c:if>"><a class="page-link" href="${ goNum }">${ p }</a></li>
	                    </c:forEach>
	                    <!-- 다음 버튼 -->
	                    <li class="page-item">
	                        <c:url var="goNext" value="${ loc }">
	                            <c:param name="page" value="${ pi.currentPage + 1}"/>
	                        </c:url>
	                        <a class="page-link <c:if test="${ pi.currentPage == pi.maxPage}">disabled</c:if>" href="${ goNext }" aria-label="Next">
	                            <span aria-hidden="true">&raquo;</span>
	                        </a>
	                    </li>
	                </ul>
	            </nav>
	            
	            <div class="actions">
                     <a class="write" href="${contextPath}/messageInfo.us">쪽지쓰기</a>
                     <button type="button" class="btn btn-secondary">삭제</button>
                     <button type="button" class="btn btn-secondary">답장</button>
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

<script>
window.onload = () => {
	
	$('.nav-link').hover(function() {
        $(this).addClass('active');
    }, function() {
        $(this).removeClass('active');
    });
	
	const tbody = document.querySelector('tbody');
	const tds = tbody.querySelectorAll('td');
	for(const td of tds){
		td.addEventListener('click', function(){
			const trTds = this.parentElement.querySelectorAll('td');
			const boardId = trTds[1].innerText;
			
			
			location.href="${contextPath}/selectBoard.bo?bId=" + boardId + "&page=" + ${pi.currentPage}
			
		})
	}
	
	// 상세보기 후 'boardDetail.jsp'로 연결 => writeBoard.jsp를 복사 붙여넣기 후 코드르 바꿔 구현
	
	const cbx = documemt.getElementsByClassName('checkbox');
	for(const cb of cbx){
		//cb/addEventListener('click', )
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
</script>

</html>
