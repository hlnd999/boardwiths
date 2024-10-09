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
    <link rel="stylesheet" href="${ contextPath }/resources/css/boardDetail.css">
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
	    	<h2 class="text-center my-4">쪽지 읽기</h2>
			<form class="needs-validation" method="POST" id="detailForm">
				<input type="hidden" value="${ noteNo }" name="noteNo">
			    <div class="bg-white p-3">
				    <div class="fs-6 p-4">
				    	<c:if test="${ option == '1'}"> 
				    		보낸 사람 : ${ nickname }
				    	</c:if>
				    	<c:if test="${ option == '2' }"> 
				    		받은 사람 : ${ nickname }
				    	</c:if>
				    </div>
				    <div class="fs-6 p-3">
				    보낸 날짜 : ${ noteDate }
				    </div>
				    <hr/>
				    
				    <div class="d-inline-block fs-6 p-3" style="height: 500px">${ noteContent }</div>

					<hr/>
					 <!-- 하단 버튼 박스 -->
				    <div class="mb-3">
				    	<c:if test="${ option == '1'}">
							<button type="button" class="btn btn-secondary" onclick="location.href='${contextPath}/writeMessage.us?receiver=${nickname}'">답장</button>
						</c:if>
						<button class="btn btn-danger" type="button" id="deleteModal">삭제</button>
				    </div>
				   
			    </div>
			</form>
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
	const form = document.getElementById('detailForm');
	
	
	if(document.getElementById('deleteModal') != null){
		document.getElementById('deleteModal').addEventListener('click', () => {
			$('#modalDelChoice').modal('show');
		});
	}
	document.getElementById('delete').addEventListener('click', () => {
        form.action = '${contextPath}/deleteMessage.us';
        form.submit();
     });
	
	
}
</script>
</html>
