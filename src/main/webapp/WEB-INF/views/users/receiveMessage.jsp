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
	                <a href="${pageContext.servletContext.contextPath}/receiveMessage.us" class="nav-link text-white" aria-current="page">받은 쪽지함</a>
	            </li>
	            <li>
	                <a href="${pageContext.servletContext.contextPath}/sendMessage.us" class="nav-link text-white">보낸 쪽지함</a>
	            </li>
	        </ul>
	        <hr>
	    </div>
	
	    <div class="d-inline-block p-3 text-bg-light flex-grow-1 text-align-center" style="width: 1100px;">
	    
	    <!-- 검색창 였던것-->
        <div class="container d-flex justify-content-between mb-3">
        	<a class="d-flex text-black text-decoration-none fw-bold fs-5" href="${contextPath}/receiveMessage.us" >받은 쪽지함</a>
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
	                        <th>
	                        	<input type="checkbox" class="checkbox" name="checkbox">
                        	</th>
	                        <td>
	                        	<input type="hidden" name="noteNo" value="${ n.noteNo }"/>
	                        	${ n.nickname }
	                        </td>
	                        <td>
	                        	<input type="hidden" name="noteNo" value="${ n.noteNo }"/>
	                        	${ n.noteContent }
	                        </td>
	                        <td>
	                        	<input type="hidden" name="noteNo" value="${ n.noteNo }"/>
	                        	${ n.noteDate }
	                        </td>
	                    </tr>
	                </c:forEach>
	            </tbody>
	        </table>
	        
	        
	        
	        <input type="checkbox" value="전체선택" id="all" >전체선택
	        
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
                     <button type="button" class="btn btn-primary" onclick="location.href='${contextPath}/writeMessage.us'">쪽지쓰기</button>
                     <button class="btn btn-danger" type="button" id="deleteModal">삭제</button>
                </div>
	            
	            
	            
	    </div>
	</div>
	
    <!-- 삭제 모달창 -->
    <div class="modal fade" tabindex="-1" role="dialog" id="modalDelChoice">
		<div class="modal-dialog" role="document">
    		<div class="modal-content rounded-3 shadow">
      			<div class="modal-body p-4 text-center">
        			<h3 class="mb-0">정말로 삭제하시겠습니까?</h3>
        			<p class="mb-0 text-danger">삭제 후 쪽지는 복구할 수 없습니다.</p>
      			</div>
      			<div class="modal-footer flex-nowrap p-0">
        			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-end" id="delete">
        				<strong>네</strong>
        			</button>
        			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0" data-bs-dismiss="modal">아니오</button>
      			</div>
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
			
			const noteNo = this.children[0].value;
			location.href='${contextPath}/messageDetail.us?noteNo='+ noteNo ;
			
			
			
		})
	}
	
	// 상세보기 후 'boardDetail.jsp'로 연결 => writeBoard.jsp를 복사 붙여넣기 후 코드르 바꿔 구현

    const cbx = document.getElementsByClassName('checkbox');
    for(const cb of cbx){
        //cb/addEventListener('click', )
    }


    // 전체 선택
    var all = document.getElementById("all");
    var checkboxes = document.getElementsByName("checkbox");

    all.addEventListener('click', function() {
        for (var i = 0; i < checkboxes.length; i++) {
            checkboxes[i].checked = all.checked;
        }
    });
    
    // 삭제 모달
	const form = document.getElementById('detailForm');
	const rForm = document.getElementById('reportForm');
	
	
	if(document.getElementById('deleteModal') != null){
        document.getElementById('deleteModal').addEventListener('click', () => {
            const anyChecked = Array.from(checkboxes).some(checkbox => checkbox.checked);
            if (!anyChecked) {
                alert("삭제할 쪽지를 체크해주세요.");
                return;
            }
            $('#modalDelChoice').modal('show');
        });
    }
	
	$(document).ready(function() {
	    // 글자수 제한
	    const tds = document.querySelectorAll('td:nth-child(3)'); // 세 번째 열의 td 요소들을 모두 선택

	    tds.forEach(td => {
	        let content = td.innerText.trim(); // 내용을 가져오고 좌우 공백 제거
	        if (content.length > 20) { // 20글자보다 길 경우
	            td.innerHTML = content.substring(0, 20) + '...'; // 20글자까지만 보여주고 나머지는 ...으로 표시
	        }
	    });

	});
	
	
	// 선택된 쪽지 삭제 
	const delBtn = document.querySelector('#delete');
	const checkBoxList = document.querySelectorAll('.checkbox'); 
	const noteNoArr = [];
	
	
	delBtn.addEventListener('click', () => {
		for(const checkBox of checkBoxList) {
			if(checkBox.checked) {
				const noteNo = checkBox.parentElement.nextElementSibling.children[0].value;
				
				noteNoArr.push(noteNo);
			} 
		}
		console.log(noteNoArr);
		// 삭제가 성공했다면 게임목록을 재출력하도록 요청함으로서 삭제 결과가 곧바로 반영될 수 있게 함
		$.ajax({ //동기처리 => async: false
			url: '${contextPath}/deleteCheckMsg.us',
			type: 'GET',
			data: {noteNoArr: noteNoArr},
			success: data => {
				if(data == 'success') {
					location.href='${contextPath}/receiveMessage.us';
				}
			}
		})
		
	})

	
	
    
    
}		
</script>

</html>
