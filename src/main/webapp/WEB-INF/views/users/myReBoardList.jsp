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
	                <a href="${pageContext.servletContext.contextPath}/usersChange.us" class="nav-link text-white">회원정보 수정</a>
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
	    
	    <!-- 검색창 -->
        <!-- 게시판 top -->
			<div class="container d-flex justify-content-between mb-3">
	        	<!--  게시판 표시 -->
	        	<a class="d-flex text-black text-decoration-none fw-bold fs-5" href="myReBoardList.us">
	        		댓글단 글
				</a>
	        	
	        	<!-- 검색창 -->
	        	<form id="searchForm" action="searchBoardList.bo" method="get">
	        		<input type="hidden" name="category" value="${ selCategory }">
		        	<div class="input-group mb-1">
		        		<select name="condition" class="form-select-sm" aria-label="Default select example">
							<option selected value="noSelect">전체 검색</option>
							<option value="writer">닉네임</option>
							<option value="title">제목/내용</option>
						</select>
	         		<input name="value" type="text" class="form-control" placeholder="검색하기..." aria-describedby="project-search-addon">
			          	<div class="input-group-append">
			          		<button class="btn btn-primary" type="submit" id="project-search-addon">
			          			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
									<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
								</svg>
			          		</button>
			          	</div>
	        		</div>
	        	</form>
	     	</div>
		        
		        
	        <table class="table table-hover align-middle">
	            <thead>
	                <tr>
	                    <th scope="col" width="70px">글번호</th>
	                    <th scope="col" width="150px">카테고리</th>
	                    <th scope="col">글제목</th>
	                    <th scope="col" width="100px">작성자</th>
	                    <th scope="col" width="80px">작성일</th>
	                    <th scope="col" width="80px">조회수</th>
	                </tr>
	            </thead>
	            <tbody>
	                <c:forEach items="${ list }" var="c">
	                    <tr style="height: 60px">
	                    	<td>
		                    	<input type="hidden" name="boardNo" value="${ b.boardNo }"/>
		                    	${ c.boardNo }
	                    	</td>
	                        <td>
		                        <c:if test="${ c.category == 1 }">
		                        	[공지]
		                        </c:if>
		                        <c:if test="${ c.category == 2 }">
		                        	[구매]
		                        </c:if>
		                        <c:if test="${ c.category == 3 }">
		                        	[판매]
		                        </c:if>
		                        <c:if test="${ c.category == 4 }">
		                        	[매칭]
		                        </c:if>
		                        <c:if test="${ c.category == 5 }">
		                        	[후기]
		                        </c:if>
		                        <c:if test="${ c.category == 6 }">
		                        	[문의]
		                        </c:if>
	                        </td>
	                        <td>${ c.title }</td>
	                        <td>${ c.nickname }</td>
	                        <td>${ c.createDate }</td>
	                        <td>${ c.boardCount }</td>
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
	         const tr = this.parentElement;
	         const boardNo = tr.querySelector('input[name="boardNo"]').value;
	         
	         
	         location.href="${contextPath}/selectBoard.bo?bNo=" + boardNo + "&page=" + ${pi.currentPage};
	         
	      })
	   }

	
	// 상세보기 후 'boardDetail.jsp'로 연결 => writeBoard.jsp를 복사 붙여넣기 후 코드르 바꿔 구현

    const cbx = document.getElementsByClassName('checkbox');
    for(const cb of cbx){
        //cb/addEventListener('click', )
    }


    // 전체 선택
//     var all = document.getElementById("all");
//     var checkboxes = document.getElementsByName("checkbox");

//     all.addEventListener('click', function() {
//         for (var i = 0; i < checkboxes.length; i++) {
//             checkboxes[i].checked = all.checked;
//         }
//     });
    
    
    
}
</script>

</html>
