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
					<a href="queryList.bo" class="nav-link text-white w-100 mb-1" id="queryList">문의게시판</a>
				</li>
			</ul>
	        <hr>
	    </div>
	
	    <div class="d-inline-block p-3 text-bg-light flex-grow-1 text-align-center" style="width: 1100px;">
	    	
		    <!-- 아티클 탑 버튼 -->
		    <div class="container d-flex justify-content-between mb-3">
	        	<!--  게시판 표시 -->
	        	<a class="d-flex text-black text-decoration-none fw-bold fs-5" href="${ contextPath }/list.bo?category=${ b.category }">
					<c:choose>
						<c:when test="${ b.category eq 1 }">공지사항 ></c:when>
						<c:when test="${ b.category eq 2 }">구매 게시판 ></c:when>
						<c:when test="${ b.category eq 3 }">판매 게시판 ></c:when>
						<c:when test="${ b.category eq 4 }">매칭 게시판 ></c:when>
						<c:when test="${ b.category eq 5 }">후기 게시판 ></c:when>
					</c:choose>
				</a>
			    <div>
				    <button id="toTheList" type="button" class="btn btn-secondary">목록으로</button>
			    </div>
		    </div>
			<form class="needs-validation" method="POST" id="detailForm">
				<input type="hidden" value="${ b.boardNo }" name="boardNo"/>
				<input type="hidden" value="${ page }" name="page"/>
				<input type="hidden" value="${ b.category }" name="category"/>
				
			    <div class="me-auto bg-white p-3">
				    <!-- 아티클 타이틀 -->
				    <c:if test="${b.category ne 6}">
				    	<div class="fs-6 p-3">No.${ b.boardNo }</div>
				    </c:if>
				    <div class="fs-4 p-3">${ b.title }</div>
				<div class="container d-flex justify-content-between mb-3">
				    <!-- 유저 인포 -->
				    <input type="hidden" value="${ b.usersNo }" name="usersNo"/>
				    <div class="d-inline-block fs-5 p-3">
				    	<img src="${ contextPath }/resources/profile basic.jpg" class="rounded-circle " style="width: 50px; height: 50px; object-fit: cover;" alt="Profile Picture"/>
				        &nbsp;
				        <div class="d-inline-block">${ b.nickname }</div>
				    </div>
				    <!-- 게시글 인포 -->
				    <c:if test="${b.category ne 6}">
					    <div class="d-flex fs-6 p-3 align-items-center">
					        조회수 ${ b.boardCount } | 좋아요 ${ boardLikes }
					    </div>
				    </c:if>
				</div> 
				    <hr/>
				    <!-- 컨텐츠 -->
				    <c:if test="${ b.category ne 1 and b.category ne 6}">
					    <div class="container mb-2 d-flex justify-content-center">
				    		<div class="d-inline-block col-4 text-center">
				    			<img src="${ contextPath }/resources/uploadFiles/${ GimgRename }" class="img-thumbnail" style="width: 180px; height:240px;" alt="게임 사진"/>
				    		</div>
				    		<div class="d-inline-block bg-secondary bg-gradient text-white p-3 col-7">
				    		게임정보
				    		<hr/>
				    		게임이름 : ${ g.gameName }<br/>
				    		제조사 : ${ g.gameCompany }<br/>
				    		게임 장르 : ${ g.gameGenre }<br/>
				    		게임 시간 : ${ g.gamePlayTime }<br/>
				    		게임 난이도 : ${ g.gameLevel }<br/>
				    		게임 인원 : ${ g.gamePeople }<br/>
				    		</div>
					    </div>
				    </c:if>
				    
				    <!-- 게시판 별 추가 정보 -->
				    
				    <div class="container mb-2 d-flex flex-start">
					    <c:if test="${ b.category eq 2 or b.category eq 3}">
					    	<hr/>
						    <div class="container bg-info bg-gradient bg-opacity-25 my-3 p-1">
						        <div class="d-flex align-items-center">
							        <div class="p-3 fs-4">보드게임 구매/판매 정보</div>
							        <div class="flex-grow-1 p-3">
							        	가격 : ${ bmk.price }원 | 상태 :
							        	<c:choose>
							        		<c:when test="${ bmk.status eq 'A'}">좋음</c:when>
							        		<c:when test="${ bmk.status eq 'B'}">중간 </c:when>
							        		<c:when test="${ bmk.status eq 'C'}">나쁨</c:when>
							        	</c:choose>
							        </div>
								</div>
					        </div>
					    </c:if>
					    
					    <c:if test="${ b.category eq 4 }">
				    		<hr/>
				    	    <div class="container bg-info bg-gradient bg-opacity-25 my-3 p-1">
						        <div class="d-flex align-items-center">
							        <div class="p-3 fs-4">매칭 정보</div>
							        <div class="flex-grow-1 p-3">
								        인원 : ${ bmc.member } / ${ bmc.maxMember }<br/>
								        플레이 장소 : ${ bmc.place } | 모집 기간 : ${ bmc.dueDate } 까지
							        </div>
								</div>
					        </div>
					    </c:if>
					    
					    <c:if test="${ b.category eq 6}">
					    	<hr/>
						    <div class="container bg-info bg-gradient bg-opacity-25 my-3 p-1">
						        <div class="d-flex align-items-center">
							        <div class="p-3 fs-4">문의 사유</div>
							        <div class="flex-grow-1 p-3">
							        	${ bq.queryReason }
							        </div>
								</div>
					        </div>
					    </c:if>
				    </div>
				    
				    <div class="d-inline-block fs-6 p-3 w-100" style="height: 500px;">
				    	<div class="d-inline-block fs-6 p-3 w-100 d-flex justify-content-center align-items-center">
				    		<c:if test="${ not empty BimgRename }">
						    	<img src="${ contextPath }/resources/uploadFiles/${ BimgRename }" class="img-thumbnail" alt="첨부사진"/>
						    </c:if>
						</div>
				    <p>${ b.content }</p>
				    </div>
				    <br/>
				    <div class="fs-6 p-3 justify-content-center text-center">
				    	<c:if test="${b.isComplete = 'N' }">
						    <c:if test="${ b.category ne 1 and b.category ne 6}">
						    	<c:if test="${ b.category eq 2 and not empty loginUser and (loginUser.usersNo ne b.usersNo)}">
								    <button class="btn btn-primary">구매 신청</button>
							    </c:if>
							    <c:if test="${ b.category eq 3 and not empty loginUser and (loginUser.usersNo ne b.usersNo)}">
								    <button class="btn btn-primary">판매 신청</button>
							    </c:if>
							    <c:if test="${ b.category eq 4 and not empty loginUser and (loginUser.usersNo ne b.usersNo)}">
								    <button class="btn btn-primary ">참가 신청</button>
							    </c:if>
							</c:if>
						</c:if>
						<c:if test="${ b.category ne 6 }">
							<button id="likeButton" class="btn btn-outline-danger <c:if test="${ checkBLikes ne 0 }">active</c:if>">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
									<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314"/>
								</svg>
								좋아요 ${ boardLikes }
							</button>
						</c:if>
						<c:if test="${ b.category eq 6}">
							<button id="likeButton" class="btn btn-outline-danger" style="display:none;">
							</button>
						</c:if>
					</div>
					
					
				   
				    <!-- 하단 버튼 박스 -->
				    <div class="mb-3">
				    	<c:if test="${ not empty loginUser and (loginUser.usersNo ne b.usersNo)}">
					    	<button class="btn btn-warning" type="button" id="ReportModal">신고하기</button>
						</c:if>
					    <c:if test="${ loginUser.usersNo eq b.usersNo }">
							<button class="btn btn-secondary" type="button" id="updateForm">글 수정</button>
							<button class="btn btn-danger" type="button" id="deleteModal">글 삭제</button>
						</c:if>
				    </div>
				    <!-- 댓글 -->
				    <div>
				    	<div class="input-group">
				    		<!-- 로그인했을때 -->
				    		<c:if test="${ loginUser ne null }">
								<span class="input-group-text">${ loginUser.nickname }</span>
									<textarea class="form-control" rows="3" id="comContent" style="resize: none;" placeholder="댓글을 남겨보세요."></textarea>
								<button class="btn btn-outline-primary btn-lg" id="comSubmit" type="button" <c:if test="${ empty loginUser }">disabled</c:if>>작성하기</button>
							</c:if>
							<!-- 로그인안했을때 -->
							<c:if test="${ loginUser eq null }">
								<textarea class="form-control" rows="3" id="comContent" style="resize: none;" placeholder="비회원은 로그인 후에 댓글 작성이 가능합니다." disabled></textarea>
								<input id="comSubmit" type="hidden"></input>
							</c:if>
						</div>
						<br>
						<table class="table">
							<thead class="align-middle">
								<tr class="cursor-default">
									<th width="130px">작성자</th>
									<th>작성내용</th>
									<th width="130px">작성일자</th>
									<th width="130px"></th>
								</tr>
							</thead>
							
							<tbody class="align-middle">
								<c:forEach items="${ cList }" var="c">
									<tr>
										<td>${ c.nickname }</td>
										<td>${ c.comContent }</td>
										<td>${ c.comDate }</td>
										<td>
											<input type="hidden" value="${ c.comNo }" name="comNo">									
											<c:if test="${ c.usersNo eq loginUser.usersNo }">
													<button type="button" class="btn btn-secondary">
														<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
													 		<path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.5.5 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11z"></path>
														</svg>
													</button>
													&nbsp;
													<button type="button" class="btn btn-secondary">
														<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16">
															<path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5m-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5M4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06m6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528M8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5"></path>
														</svg>
													</button>
											</c:if>
											<input type="hidden" value="${ c.comContent }" id="comContent">
										</td>
									</tr>
								</c:forEach>
							</tbody>
							
						</table>
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
        			<p class="mb-0 text-danger">삭제 후 게시글은 복구할 수 없습니다.</p>
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
	
	<!-- 신고 모달창 -->
	<div class="modal fade" tabindex="-1" role="dialog" id="modalRepChoice">
		<div class="modal-dialog" role="document">
    		<div class="modal-content rounded-3 shadow">
      			<div class="modal-body p-4 text-center">
        			<h3 class="mb-0">"${ b.nickname }" <br/> 해당 유저를 신고합니다. <br/> 계속 하시겠습니까?</h3>
        			<p class="mb-0 text-danger">신고 후 취소는 불가능합니다.</p>
      			</div>
      			<div class="modal-footer flex-nowrap p-0">
        			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-end" data-bs-target="#modalRepReason" data-bs-toggle="modal" data-bs-dismiss="modal">
        				<strong class="text-danger">네</strong>
        			</button>
        			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0" data-bs-dismiss="modal">아니오</button>
      			</div>
    		</div>
  		</div>
	</div>
	<div class="modal fade" tabindex="-1" role="dialog" id="modalRepReason" aria-hidden="true">
		<div class="modal-dialog" role="document">
    		<div class="modal-content rounded-3 shadow">
      			<div class="modal-body p-4">
        			<p class="mb-0">신고 사유를 작성해주세요.</p>
        			
        			<form id="reportForm">
        				<input type="hidden" value="${ b.boardNo }" name="reportBoard"/>
						<input type="hidden" value="${ b.usersNo }" name="reportReceiver"/>
						<input type="hidden" id="originalUrl" name="originalUrl"/>
        			<div class="mb-3">
				        <textarea class="form-control" id="reportMsg" name="reportMsg"></textarea>
			        </div>
			        </form>
			        
      			</div>
      			<div class="modal-footer flex-nowrap p-0">
        			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-end" id="reportUsers" data-bs-target="#modalRepConfirm" data-bs-toggle="modal" data-bs-dismiss="modal">
        				<strong class="text-danger">신고하기</strong>
        			</button>
        			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0" data-bs-dismiss="modal">취소하기</button>
      			</div>
    		</div>
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
	
    const queryList = document.getElementById('queryList');
    const loginUser = '${loginUser}'; 
	
	
	//좋아요 버튼
	document.getElementById('likeButton').addEventListener('click', () => {
		const likeButton = document.getElementById('likeButton');
	    const boardNo = ${ b.boardNo };
	    let url = '';
	    let alertMessage = '';

	    if (likeButton.classList.contains('active')) {
	        url = '${contextPath}/deleteBLikes.bo';
	        alertMessage = '게시글 [좋아요] 취소했습니다.';
	    } else {
	        url = '${contextPath}/insertBLikes.bo';
	        alertMessage = '게시글을 [좋아요] 했습니다.';
	    }
	    
	    $.ajax({
	        type: "POST",
	        url: url,
	        data: { boardNo: boardNo },
	        dataType: 'json',
	        success: data => {
	            if(data.result === -1) {
	                alert('로그인 후에 [좋아요] 할 수 있습니다.');
	            } else if(data.result > 0) {
	                likeButton.classList.toggle('active');
	                alert(alertMessage);
	            } else {
	                alert('[좋아요]에 실패했습니다.');
	            }
	        }
	    });
	});
	
	
	//비회원 문의게시판 접근 제한


    queryList.addEventListener('click', function(e) {
        if (!loginUser) {
            e.preventDefault();
            alert('로그인 후 이용할 수 있는 메뉴입니다.');
        }
    });
	
	const form = document.getElementById('detailForm');
	const rForm = document.getElementById('reportForm');
	
	
	if(document.getElementById('deleteModal') != null){
		document.getElementById('deleteModal').addEventListener('click', () => {
			$('#modalDelChoice').modal('show');
		});
	}
	
	if(document.getElementById('ReportModal') != null){
		document.getElementById('ReportModal').addEventListener('click', () => {
			$('#modalRepChoice').modal('show');
		});
	}
	
	document.getElementById('reportUsers').addEventListener('click', () => {
		const originalUrl = document.getElementById('originalUrl');
		originalUrl.value = window.location.href;
		rForm.action = '${contextPath}/reportUsers.us';
		rForm.method = "POST"
		rForm.submit();
	});
	
	document.getElementById('delete').addEventListener('click', () => {
		form.action = '${contextPath}/delete.bo';
		form.submit();
	});
	
	const updateForm = document.getElementById('updateForm');
	if(updateForm){
		updateForm.addEventListener('click', () => {
			if('${ b.category}' === '1') {
				form.action = '${contextPath}/updateNotice.bo';
				form.method = "POST"
				form.submit();
			} else if('${ b.category}' === '2' || '${ b.category }' === '3') {
				form.action = '${contextPath}/updateBuyView.bo';
				form.method = "POST"
				form.submit();
			} else if ('${ b.category}' === '4'){
				form.action = '${contextPath}/updateMatching.bo';
				form.method = "POST"
				form.submit();
			} else if ('${ b.category}' === '5'){
				form.action = '${contextPath}/updateReview.bo';
				form.method = "POST"
				form.submit();
			} else if('${ b.category}' === '6'){
				form.action = '${contextPath}/updateQuery.bo';
				form.method = "POST"
				form.submit();
			}
		});
	}
	
	document.getElementById('toTheList').addEventListener('click', () => {
	    history.back();
	});
	
	//댓글 기능
	document.getElementById('comSubmit').addEventListener('click', () => {
		$.ajax({
			url:'${contextPath}/insertComments.bo',
			data: {comContent: document.getElementById('comContent').value, refBoardNo:${b.boardNo}, usersNo: '${loginUser.usersNo}', nickname:'${loginUser.nickname}'},
			dataType: 'json',
			success: data => {
				const tbody = document.querySelector('tbody');
				tbody.innerHTML='';
				
				for(const c of data){
					const tr = document.createElement('tr');
					
					const writerTd = document.createElement('td');
					writerTd.innerText = c.nickname;
					const contentTd = document.createElement('td');
					contentTd.innerText = c.comContent;
					const dateTd = document.createElement('td');
					dateTd.innerText = c.comDate;
					
					const iconTd = document.createElement('td');
					if(c.usersNo == '${loginUser.usersNo}') {
	                    iconTd.innerHTML = '<input type="hidden" value="' + c.comNo +  '"name="comNo"><button type="button" class="btn btn-secondary"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16"><path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.5.5 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11z"></path></svg></button>&nbsp;<button type="button" class="btn btn-secondary"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16"><path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5m-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5M4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06m6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528M8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5"></path></svg></button><input type="hidden" value="'+ c.comContent +'">';
					}
					
					tr.append(writerTd);
					tr.append(contentTd);
					tr.append(dateTd);
					tr.append(iconTd);	
					
					tbody.append(tr);
					
				}
				document.getElementById('comContent').value='';
			},
			error: data => console.log(data)
		});
	});
	

	
	const tbody = document.querySelector('tbody');
	
	tbody.addEventListener('mouseover', (e) => {
		const eventTarget = e.target;
		const targetTagName = eventTarget.tagName.toLowerCase();
		console.log(targetTagName);
	});
	
	tbody.addEventListener('click', e => {
		const eventTarget = e.target;
		const targetTagName = eventTarget.tagName.toLowerCase();
		let targetSVG = null;
		switch(targetTagName){
		case 'button': targetSVG = eventTarget.children[0]; break;
		case 'svg': targetSVG = eventTarget; break;
		case 'path': targetSVG = eventTarget.parentElement; break;
		}
		console.log(targetSVG.tagName.toUpperCase());
		
		const myTd = targetSVG.parentElement.parentElement;
		const comNo = myTd.children[0].value;
		const contentTd = myTd.parentElement.children[1];
		
		if(targetSVG != null) {
			if(targetSVG.className.baseVal.includes('pencil')){
				if(document.getElementsByClassName('bi-check-lg').length > 0){
					changePencilTrash();
				}
				
				contentTd.innerHTML = '<textarea rows="2" cols="30" style="resize:none">' + contentTd.innerText + '</textarea>';
				
				//check, x 표시
				myTd.children[1].innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-lg" viewBox="0 0 16 16"><path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425a.247.247 0 0 1 .02-.022"/></svg>';
				myTd.children[2].innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16"><path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z"/></svg>';
				
			} else if(targetSVG.className.baseVal.includes('trash')) {
				if(confirm('정말 삭제하시겠습니까?')){
						$.ajax({
						url: '${contextPath}/deleteComments.bo',
						data: {comNo: comNo},
						success: data => {
							if(data == 'success'){
								myTd.parentElement.remove();
							} else {
								alert('댓글 삭제 중 오류가 발생했습니다.');
							}
						},
						error: data => console.log(data)
					});
				}
			} else if(targetSVG.className.baseVal.includes('check')){
				$.ajax({
					url: "${contextPath}/updateComments.bo",
					data: {ComNo: comNo, comContent:contentTd.children[0].value},
					success: data => {
						if(data == 'success'){
							changePencilTrash(contentTd.children[0].value);
						} else {
							alert('댓글수정 중 오류가 발생했습니다.')
						}
					},
					error: data => console.log(data)
				});
			} else if(targetSVG.className.baseVal.includes('x')){
				changePencilTrash();
			}
		}
	});
}

const changePencilTrash = (type) => {
	const beforeCheck = document.getElementsByClassName('bi-check-lg')[0]; // check icon
	const beforeCheckSpan = beforeCheck.parentElement; // 이전에 있던 check icon을 감싸는 span
	const beforeXSpan = beforeCheckSpan.nextElementSibling; // 이전에 있던 check icon의 span의 다음 span = x의 span
	const beforeTd = beforeCheckSpan.parentElement; // check와 x를 감싸는 td
	const beforeId = beforeTd.children[0].value; // 이전에 클릭했던 댓글 번호
	const beforeContent = beforeTd.children[3].value; // 이전에 클릭했던 댓글 내용
	const beforeContentTd = beforeTd.parentElement.children[1]; // content가 들어가있는 Td
	const beforeIconTd = beforeTd.parentElement.children[3]; // icon이 들어가 있는 Td
	
	//다시 pencil trash 넣기
	beforeIconTd.children[1].innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16"><path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.5.5 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11z"></path></svg>';
    beforeIconTd.children[2].innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16"><path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5m-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5M4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06m6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528M8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5"></path></svg>';

	if(type == undefined){
		beforeContentTd.innerHTML = beforeContent;
	} else {
		beforeContentTd.innerHTML = type;
		beforeTd.children[3].value = type;
	}
}
</script>
</html>
