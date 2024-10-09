<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>
<c:set var="selCategory" value="${ param.category }"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${ contextPath }/resources/css/boardList.css">
	<jsp:include page="../common/navbar.jsp"/>
</head>
<body> 
	<div class="container d-flex m-auto" style="width: 1440px;">
		<div class="p-3 text-bg-dark text-center" style="width: 240px;">
			<span class="d-block fs-4">
			Boardwiths
			</span>
			<hr>
			<ul class="nav nav-pills flex-column mb-auto">
				<li class="nav-item">
					<a href="list.bo?category=1" class="nav-link text-white w-100 mb-1">공지사항</a>
				</li>
				<hr>
				
				<li>
					<a href="list.bo?category=2,3" class="nav-link text-white w-100 mb-1">구매/판매 전체보기</a>
					<ul class="nav flex-column ms-3">
						<li>
							<a href="list.bo?category=2" class="nav-link text-white w-100 mb-1">- 구매게시판</a>
						</li>
						<li>
							<a href="list.bo?category=3" class="nav-link text-white w-100 mb-1">- 판매게시판</a>
						</li>
					</ul>
				</li>
			
				<li>
					<a href="list.bo?category=4,5" class="nav-link text-white w-100 mb-1">매칭/후기 전체보기</a>
					<ul class="nav flex-column ms-3">
						<li>
							<a href="list.bo?category=4" class="nav-link text-white w-100 mb-1">- 매칭게시판</a>
						</li>
						<li>
							<a href="list.bo?category=5" class="nav-link text-white w-100 mb-1">- 후기게시판</a>
						</li>
					</ul>
				</li>
				
				<hr>
				<li>
					<a href="queryList.bo" class="nav-link text-white w-100 mb-1">문의게시판</a>
				</li>
			</ul>
	        <hr>
	    </div>
	    <div class="d-block p-3 text-bg-light flex-grow-1 text-align-center" style="width: 1100px;">
	    <!-- 게시판 top -->
			<div class="container d-flex justify-content-between">
	        	<!--  게시판 표시 -->
	        	<a class="d-flex text-black text-decoration-none fw-bold fs-5" href="${ contextPath }/querylist.bo">
					문의 게시판 >
				</a>
	     	</div>
		    <br>
	        <table class="table table-hover align-middle">
	            <thead>
	                <tr>
	                    <th scope="col" width="100px">완료 여부</th>
	                    <th scope="col">제목</th>
	                    <th scope="col" width="100px">작성자</th>
	                    <th scope="col" width="120px">작성일</th>
	                </tr>
	            </thead>
	            <tbody>
	                <c:forEach items="${ list }" var="b">
	                    <tr style="height: 60px">
	                        <th style="display: none;" scope="row">${ b.boardNo }</th>
	                        <td>
	                        <c:if test="${ b.isComplete eq 'Y'}">
	                        	완료
	                        </c:if>
	                        <c:if test="${ b.isComplete eq 'N'}">
	                        	미완료
	                        </c:if>
	                        </td>
	                        <td>${ b.title }</td>
	                        <td>${ b.nickname }</td>
	                        <td>${ b.createDate }</td>
	                    </tr>
	                </c:forEach>
	            </tbody>
	        </table>
	        
	        <c:if test="${ pi.listCount eq 0 }">
	        	<p class="fs-4 text-center">조회된 게시글이 없습니다.</p>
	        </c:if>
	        <c:if test="${ pi.listCount ne 0 }">
		        <nav aria-label="Standard pagination example">
		            <ul class="pagination justify-content-center">
		            <!-- 이전 버튼 -->
			            <li class="page-item">
			                <c:url var="goBack" value="${ loc }">
			                	<c:param name="category" value="${ selCategory }"/>
			                	<c:if test="${ not empty value }">
				                	<c:param name="condition" value="${ condition }"/>
				                	<c:param name="value" value="${ value }"/>
				                </c:if>
			                    <c:param name="page" value="${ pi.currentPage-1 }"/>
			                </c:url>
			                <a class="page-link <c:if test="${ pi.currentPage == 1}">disabled</c:if>" href="${ goBack }" aria-label="Previous">
			                    <span aria-hidden="true">&laquo;</span>
			                </a>
			            </li>
		            
		            <!-- 페이지 넘버링 버튼 -->
			            <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
			                <c:url var="goNum" value="${ loc }">
			                    <c:param name="category" value="${ selCategory }"/>
			                	<c:if test="${ not empty value }">
				                	<c:param name="condition" value="${ condition }"/>
				                	<c:param name="value" value="${ value }"/>
				                </c:if>
			                    <c:param name="page" value="${ p }"/>	
			                </c:url>
			                <li class="page-item <c:if test="${ p == pi.currentPage }">active</c:if>"><a class="page-link" href="${ goNum }">${ p }</a></li>
			            </c:forEach>
			            
		            <!-- 다음 버튼 -->
			            <li class="page-item">
			                <c:url var="goNext" value="${ loc }">
			                	<c:param name="category" value="${ selCategory }"/>
			                	<c:if test="${ not empty value }">
				                	<c:param name="condition" value="${ condition }"/>
				                	<c:param name="value" value="${ value }"/>
				                </c:if>
			                    <c:param name="page" value="${ pi.currentPage + 1}"/>
			                </c:url>
			                <a class="page-link <c:if test="${ pi.currentPage == pi.maxPage}">disabled</c:if>" href="${ goNext }" aria-label="Next">
			                    <span aria-hidden="true">&raquo;</span>
			                </a>
			            </li>
					</ul>
			    </nav>
	        </c:if>
	        <c:if test="${ loginUser ne null }">
				<div class="d-block text-end">
        			<button class="btn btn-primary" type="button" onclick="location.href='${ contextPath }/query.bo'">글쓰기</button>
   				</div>
			</c:if>
	    </div>
	</div>

    
    <!-- 풋터 -->
	<div class="container">
		<footer class="py-3 my-4">
			<ul class="nav justify-content-center border-bottom pb-3 mb-3">
				<li class="nav-item"><a href="${ contextPath }/communityrule" class="nav-link px-2 text-body-secondary">커뮤니티 규칙</a></li>
				<li class="nav-item"><a href="${ contextPath }/regulation" class="nav-link px-2 text-body-secondary">서비스 약관/정책</a></li>
				<li class="nav-item"><a href="${ contextPath }/personal_info" class="nav-link px-2 text-body-secondary">개인정보취급방침</a></li>
			</ul>
			<p class="text-center text-body-secondary">회사명: 보드라이프 | 서울시 중구 을지로 | 등록번호: 594-39-29383 | <br>
			Copyright © boardwiths / All rights reserved</p>
		</footer>
	</div>
</body>

<script>

window.onload = () => {
	// 게시글 클릭 시 상세보기로 이동
	const tbody = document.querySelector('tbody');
	const tds = tbody.querySelectorAll('td');
	for(const td of tds){
		td.addEventListener('click', function(){
			const trTh = this.parentElement.querySelector('th');
			const boardNo = trTh.innerText;
			location.href="${contextPath}/selectBoard.bo?bNo=" + boardNo + "&page=" + ${pi.currentPage}
		});
	}
}
</script>

</html>
