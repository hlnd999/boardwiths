<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 목록 페이지</title>
	<link href="${contextPath }/resources/css/userList.css" rel="stylesheet" type="text/css"/>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet"> -->
    <style>
		.card-icon-border-large {
            width: 50px;
            height: 50px;
            margin: -1.53rem auto 0px;
            text-align: center;
            background-color: rgb(255, 255, 255);
            border: 3px solid;
            border-radius: 50%;
            font-size: 0.94rem;
            line-height: 45px;
            color: rgb(102, 102, 102);
		}
		.text-primary { color: rgb(240, 194, 75) !important;}
	</style>
</head>
<body>
	<header>
		<%@ include file="../common/navbar.jsp"%>
	</header>
	
    <div id="mid">
        <div class="blank"><!-- 왼쪽 --></div>
        <nav style="background:black;">
            <jsp:include page="adminMenu.jsp"/>       
        </nav>
        <div id="daily">
            <div id="admin_title">
                <div>
                	<i class="fa fa-quote-left text-warning" aria-hidden="true"></i>
                    <h3 class="bg-warning" style="display:inline;">회원 목록</h3>
                    <i class="fa fa-quote-right text-warning" aria-hidden="true"></i>
                </div>
            </div>
            <div id="admin_search"> <!-- 검색바 넣을 자리-->
                <div><!-- 공백 --></div>
                <form autocomplete="off" id="usersForm" method="post" action="${contextPath }/searchUsers.ad" style="height: 100px;">
                    <label>
                    	<i class="fa fa-quote-left text-info" aria-hidden="true"></i>
                    	<span>아이디</span>
                   		<i class="fa fa-quote-right text-info" aria-hidden="true"></i>
                    	<input type="text" class="form-control" name="id" id="usersId" style="width:140px; display:inline;" value="<c:if test="${op.id != null }">${op.id }</c:if>" />
                   	</label>&nbsp;&nbsp;
                    <label>
                    	<i class="fa fa-quote-left text-info" aria-hidden="true"></i>
                    	<span>등급</span>
                   		<i class="fa fa-quote-right text-info" aria-hidden="true"></i>: 
                   	</label>
                    <select name="grade" id="grade" style="width: 75px; height:37.6px;">
                        <option value="-" <c:if test="${op.grade == '-' }">selected</c:if>>---------</option> <!-- MyBatis에서는 "-"로 비교해야함에 주의할 것-->
                        <option value="normal" <c:if test="${op.grade == 'normal' }">selected</c:if>>일반</option>
                        <option value="sup" <c:if test="${op.grade == 'sup' }">selected</c:if>>우수</option>
                        <option value="admin" <c:if test="${op.grade == 'admin' }">selected</c:if>>관리자</option>
                    </select>&nbsp;&nbsp;
                    <label>
                    	<i class="fa fa-quote-left text-info" aria-hidden="true"></i>
                    	<span>회원상태</span>
                   		<i class="fa fa-quote-right text-info" aria-hidden="true"></i> 
                   	</label>
                    <select name="usersStatus" id="usersStatus" style="width: 75px; height:37.6px;">
                        <option value="-" <c:if test="${op.usersStatus == '-' }">selected</c:if>>---------</option>
                        <option value="Y" <c:if test="${op.usersStatus == 'Y' }">selected</c:if>>활성</option>
                        <option value="N" <c:if test="${op.usersStatus == 'N' }">selected</c:if>>비활성</option>
                    </select>&nbsp;&nbsp;
                    
                    <label>
                    	<i class="fa fa-quote-left text-info" aria-hidden="true"></i>
                    	<span>가입일</span>
                   		<i class="fa fa-quote-right text-info" aria-hidden="true"></i>  
                    </label>
                    <input type="date" name="beginDt" id="beginDt" style="width:120px; height:37.6px; display:inline;" value="${op.beginDt }"/>
                    --- 
                    <input type="date" name="endDt" id="endDt" style="width:120px; height:37.6px; display:inline;" value="${op.endDt }"/>
                    <br/><br/>
                    <button id="searchBtn" type="button" class="btn btn-primary">조회하기</button>
                    &nbsp;&nbsp;
                    <button id="allBtn" type="button" class="btn btn-primary">전체보기</button>
                    &nbsp;&nbsp;
                    <button id="resetBtn" type="button" class="btn btn-light">검색조건 초기화</button> 
                </form>
                <div><!-- 공백 --></div>
            </div>
           <!--  <div id="admin_submit">
                <div></div>
                <div>
                    <button id="searchBtn" class="btn btn-primary">조회하기</button>
                    &nbsp;&nbsp;
                    <button id="allBtn" class="btn btn-primary">전체보기</button> 
                </div>
                <div></div>
            </div> -->
            <div id="admin_list"> 
                <div></div>
                <table class="table table-hover align-middle">
                	<thead>
	                    <tr>
	                        <th class="align-middle">아이디</th>
	                        <th class="align-middle">이름</th>
	                        <th class="align-middle">등급</th>
	                        <th class="align-middle">활성화</th>
	                        <th class="align-middle">수정일자</th>
	                        <th class="align-middle">정보수정</th>
	                        <th class="align-middle">탈퇴메세지</th>
	                    </tr>
                    </thead>
                    <tbody>
	                    <c:forEach items="${list }" var="u">
	                    	<tr>
	                    		<td class="align-middle">
	                    			<input type="hidden" name="usersNo" value="${u.usersNo }"/>
	                    			<span>${u.id }</span>
                    			</td>
	                    		<td class="align-middle">${u.usersName }</td>
	                    		<td class="align-middle">
	                    			<c:choose>
	                    				<c:when test="${u.grade == 'S' }">관리자</c:when>
	                    				<c:when test="${u.grade == 'A' }">우수</c:when>
	                    				<c:otherwise>일반</c:otherwise>
	                    			</c:choose>
	                   			</td>
	                    		<td class="align-middle">
	                    			<!-- <span class="select">&nbsp;&nbsp;Y&nbsp;&nbsp;</span> -->
	                    			<button type="button" class="btn statusBtn ${u.usersStatus == 'Y' ? 'btn-warning' : 'btn-secondary'}" style="width:50px;">Y</button>
	                            	&nbsp;&nbsp;
	                            	<!-- <span class="unselect">&nbsp;&nbsp;N&nbsp;&nbsp;</span> -->
	                            	<button type="button" class="btn statusBtn ${u.usersStatus == 'N' ? 'btn-warning' : 'btn-secondary'}" style="width:50px;">N</button>
	                   			</td>
	                    		<td class="align-middle">${u.updateDate }</td>
	                    		<td class="align-middle">
	                    			<!-- <button class="modify">수정하기</button>  -->
	                    			<button type="button" class="btn goInfoBtn btn-info" style="width: 80px;">Info</button>
                    			</td>
	                    		<td class="align-middle">
	                    			<!-- <button class="leave">확인하기</button> -->
	                    			<c:if test="${empty u.leaveMsg }">
	                    				<button type="button" class="btn btn-secondary" style="width:100px;">확인하기</button>
                    				</c:if>
                    				<c:if test="${!empty u.leaveMsg }">
                    					<input type="hidden" name="toEmail" class="toEmail" value="${u.email }"/>
                    					<input type="hidden" name="leaveMsg" class="leaveMsg" value="${u.leaveMsg }"/>
	                    				<button type="button" class="btn btn-danger goLeaveMsg" style="width:100px;">확인하기</button>
                    				</c:if>
                    			</td>
	                    	</tr>
	                    </c:forEach>
	                    
	                    <c:if test="${list.size() < pi.boardLimit }">
	                    	<c:forEach begin="${list.size() + 1 }" end="${pi.boardLimit }">
	                    		<tr>
		                    		<td class="align-middle">-</td>
		                    		<td class="align-middle">-</td>
		                    		<td class="align-middle">-</td>
		                    		<td class="align-middle">
		                    			<button type="button" class="btn btn-secondary" style="width:50px;">Y</button>
		                    			&nbsp;&nbsp;
		                    			<button type="button" class="btn btn-secondary" style="width:50px;">N</button>
		                    		</td>
		                    		<td class="align-middle">0000-00-00</td>
		                    		<td class="align-middle">
		                    			<!-- <button class="modify">-</button> -->
		                    			<button type="button" class="btn btn-secondary" style="width:100px;">Info</button>
		                    		</td>
		                    		<td class="align-middle">
		                    			<!-- <button class="leave">-</button> -->
		                    			<button type="button" class="btn btn-secondary" style="width:100px;">확인하기</button>
		                    		</td>
	                    		</tr>
	                    	</c:forEach>
	                    </c:if>
                   </tbody>
                </table>
                <div></div>
            </div>
            
            <div id="pageButton"> <!-- 페이지 버튼 공간 -->
                <div></div>
                <div class="pt-3">
                    <ul class="pagination justify-content-end mb-0">
                        <c:if test="${pi.currentPage <= 1 }">
                        	<li class="page-item disabled">
                            	<a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                        	</li>
                        </c:if>
                        <c:if test="${pi.currentPage > 1 }">
                        	<c:url var="goBack" value="${loc }">
                        		<c:param name="page" value="${pi.currentPage - 1 }"/>
                        		<c:if test="${!empty op }">
                        			<c:param name="id" value="${op.id }"/>
                        			<c:param name="grade" value="${op.grade }"/>
                        			<c:param name="usersStatus" value="${op.usersStatus }"/>
                        			<c:param name="beginDt" value="${op.beginDt }"/>
                        			<c:param name="endDt" value="${op.endDt }"/>
                        		</c:if>
                        	</c:url>
                        	<li class="page-item">
                            	<a class="page-link" href="${goBack }" tabindex="-1" aria-disabled="true">Previous</a>
                        	</li>
                        </c:if>
                        
                        <c:forEach begin="${pi.startPage }" end="${pi.endPage }" var="p">
                        	<c:if test="${pi.currentPage == p }">
                        		 <li class="page-item active"><a class="page-link" href="#">${p }</a></li>
                        	</c:if>
                        	<c:if test="${pi.currentPage != p }">
                        		<c:url var="goNum" value="${loc }">
                        			<c:param name="page" value="${p }"/>
                        			<c:if test="${!empty op }">
	                        			<c:param name="id" value="${op.id }"/>
	                        			<c:param name="grade" value="${op.grade }"/>
	                        			<c:param name="usersStatus" value="${op.usersStatus }"/>
	                        			<c:param name="beginDt" value="${op.beginDt }"/>
	                        			<c:param name="endDt" value="${op.endDt }"/>
	                        		</c:if>
                        		</c:url>
                        		<li class="page-item"><a class="page-link" href="${goNum }">${p }</a></li>
                        	</c:if>
                        </c:forEach>
                        
                        <c:if test="${pi.currentPage >= pi.maxPage }">
                        	<li class="page-item disabled">
                            	<a class="page-link" href="#">Next</a>
                        	</li>
                        </c:if>
                       	<c:if test="${pi.currentPage < pi.maxPage }">
                       		<c:url var="goNext" value="${loc }">
                       			<c:param name="page" value="${pi.currentPage + 1 }"/>
                       			<c:if test="${!empty op }">
                        			<c:param name="id" value="${op.id }"/>
                        			<c:param name="grade" value="${op.grade }"/>
                        			<c:param name="usersStatus" value="${op.usersStatus }"/>
                        			<c:param name="beginDt" value="${op.beginDt }"/>
                        			<c:param name="endDt" value="${op.endDt }"/>
                        		</c:if>
                       		</c:url>
                       		<li class="page-item">
                            	<a class="page-link" href="${goNext }">Next</a>
                        	</li>
                       	</c:if>
                    </ul>
                </div>
                <div></div>
            </div>
        </div>
        <div class="blank"><!-- 오른쪽 --></div>
    </div>
    
    <!-- Modal -->
    <div class="modal fade" id="leaveModal" tabindex="-1" aria-labelledby="leaveModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
	        <div class="modal-content">
	            <div class="modal-header">
	            <h1 class="modal-title fs-5" id="leaveModalLabel">탈퇴 메시지</h1>
	            <button type="button" class="btn-close" id="reportModalClose" data-bs-dismiss="modal" aria-label="Close">
	            	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
					 	<path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z"/>
					</svg>
	            </button>
	            </div>
	            <div class="modal-body" id="leaveModalBody">
	            	<!-- 신고 메시지 출력 -->
	            </div>
	            <div class="modal-footer">
	            <button type="button" class="btn btn-primary" id="emailModalCommit" data-bs-dismiss="modal">이메일 답장</button>
	            <button type="button" class="btn btn-primary" id="leaveModalCommit" data-bs-dismiss="modal">확인</button>
	            </div>
	        </div>
        </div>
    </div>
    
    <!-- 이메일 모달2 -->
    <div class="modal" id="emailModal">
	    <div class="modal-dialog modal-dialog-scrollable">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h4 class="modal-title">탈퇴메시지 답장</h4>
	                <button type="button" class="btn-close" id="emailModalCloseBtn" data-bs-dismiss="modal">
	                	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
					 		<path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z"/>
						</svg>
	                </button>
	            </div>
	            <div class="modal-body">
	                <h1>메일 발송</h1>
                    <input class="form-control" id="message-address" value=""> <br>
                    <input class="form-control" id="message-title"> <br>
                    <textarea name="message" cols="60" rows="20" class="form-control" id="message-content"></textarea>
                    <button type="submit" class="btn btn-primary mt-2" id="emailSendModal">발송</button>
	            </div>
	
	            <div class="modal-footer">
	                <button type="button" class="btn btn-danger" id="emailCloseModal" data-bs-dismiss="modal">Close</button>
	            </div>
	        </div>
	    </div>
	</div>
    
    <!-- 푸터 -->
    <div class="container">
		<footer class="py-3 my-4" style="background:white;">
			<ul class="nav justify-content-center border-bottom pb-3 mb-3">
				<li class="nav-item"><a href="${ contextPath }/communityrule" class="nav-link px-2 text-body-secondary" style="color:black;">커뮤니티 규칙</a></li>
				<li class="nav-item"><a href="${ contextPath }/regulation" class="nav-link px-2 text-body-secondary" style="color:black;">서비스 약관/정책</a></li>
				<li class="nav-item"><a href="${ contextPath }/personal_info" class="nav-link px-2 text-body-secondary" style="color:black;">개인정보취급방침</a></li>
			</ul>
			<p class="text-center text-body-secondary">회사명: 보드라이프 | 서울시 중구 을지로 | 등록번호: 594-39-29383 | <br>
			Copyright © boardwiths / All rights reserved</p>
		</footer>
	</div>
    
    <!-- <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script> -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
    	window.onload = () => {
    		// 전체리스트 출력
    		document.querySelector('#allBtn').addEventListener('click', () => {
    			location.href='${contextPath}/userList.ad';
    		})
    		
    		// 각 입력 요소에 접근하자
    		const form = document.querySelector('#usersForm');
    		const userId = document.querySelector('#usersId');
    		const grade = document.querySelector('#grade');
    		const usersStatus = document.querySelector('#usersStatus');
    		const beginDt = document.querySelector('#beginDt');
    		const endDt = document.querySelector('#endDt');
    		
    		document.querySelector('#searchBtn').addEventListener('click', () => {
    			//날짜가 하나만 입력되어 있는 경우 => 날짜 입력을 요청하자
    			if(beginDt.value == '') {
    				if(endDt.value != '') alert('날짜 입력을 확인해주세요!');
    			} 
    			if(endDt.value == '') {
    				if(beginDt.value != '') alert('날짜 입력을 확인해주세요!')
    			}
    			
    			// 날짜가 둘다 입력X 또는 둘다 입력O 일때만 컨트롤러로 ㄱㄱ
    			let dateCheck = false;
    			if(beginDt.value == '' && endDt.value == '') dateCheck = true;
    			if(beginDt.value != '' && endDt.value != '') dateCheck = true;
    			
    			if(dateCheck) {
    				form.submit();
    			}
    		})
    		
    		//btn-warning  btn-secondary
    		const statusBtnList = document.querySelectorAll('.statusBtn');
    		
    		for(let s of statusBtnList) {
    			s.addEventListener('click', function() { // 회색버튼에서만 ajax 작동해야함
    				if(this.className.includes('secondary')) {
    					const userNo = this.parentElement.parentElement.children[0].children[0].value;
    					const status = this.innerText;
    					const myTd = this.parentElement;
    					
    					$.ajax({
    						url: '${contextPath}/updateStatus.ad',
    						data: {usersNo : userNo, usersStatus: status},
    						success: data => {
    							if(data == 'success') { // 상태 변경이 성공한 경우
									// 클릭한 회색버튼을 노랑이로 바꾸고, 같은 tr에서의 노랑이를 회색버튼으로 바꿔야함    								
    								this.classList.add('btn-warning');  
									this.classList.remove('btn-secondary');
									
									if(myTd.children[0].innerText != status) {
										myTd.children[0].classList.remove('btn-warning');
										myTd.children[0].classList.add('btn-secondary');
									}
									
									if(myTd.children[1].innerText != status) {
										myTd.children[1].classList.remove('btn-warning');
										myTd.children[1].classList.add('btn-secondary');
									}
    							} else if(data == 'fail') { // 상태 변경이 실패한 경우
    								alert('서비스 요청이 실패하였습니다.');
    							}
    						},
    						error: data => console.log('실패')
    					})
    				}
    			})
    		}
    		
    		const goInfoBtnList = document.querySelectorAll('.goInfoBtn');
    		for(let b of goInfoBtnList) {
    			b.addEventListener('click', function() {
    				const usersNo = this.parentElement.parentElement.children[0].children[0].value;
					location.href='${contextPath}/userInfo.ad?usersNo=' + usersNo + '&page=' + ${pi.currentPage};    				
    			})
    		}
    		
    		const goLeaveMsgList = document.querySelectorAll('.goLeaveMsg');
    		for(const l of goLeaveMsgList) {
    			l.addEventListener('click', function() {
    				const leaveMsg = this.previousElementSibling.value;
    				const toEmail = this.previousElementSibling.previousElementSibling.value;
					document.querySelector('#leaveModalBody').innerHTML = 
						'<input type="hidden" value=' + toEmail +'>' + leaveMsg;
    				$('#leaveModal').modal('show');
    			})
    		}
    		
    		//모달창 확인 버튼 => 모달창 닫기
    		document.querySelector('#leaveModalCommit').addEventListener('click', () => {
    			$('#leaveModal').modal('hide');
    		})
    		//모달창 닫기 버튼 => 모달창 닫기
    		document.querySelector('#reportModalClose').addEventListener('click', () => {
    			$('#leaveModal').modal('hide');
    		})
    		
    		//모달창 이메일 답장 버튼 
    		document.querySelector('#emailModalCommit').addEventListener('click', () => {
    			// 기존의 모달박스 숨기기
    			$('#leaveModal').modal('hide');
    			
    			// 새로운 모달박스 보이기
    			const toEmail = document.querySelector('#leaveModalBody').children[0].value;
    			const sendTitle = '그 동안의 보드위즈 이용에 감사드립니다.';
    			const sendText = '회원님의 의견에 귀기울여 더 성장할 수 있는 보드위즈가 되겠습니다.';
    			document.querySelector('#message-address').value = toEmail;
    			document.querySelector('#message-title').value = sendTitle;
    			document.querySelector('#message-content').value = sendText;
    			$('#emailModal').modal('show');
    		})
    		
    		document.querySelector('#emailCloseModal').addEventListener('click', () => {
    			$('#emailModal').modal('hide');
    		});
    		
    		document.querySelector('#emailModalCloseBtn').addEventListener('click', () => {
    			$('#emailModal').modal('hide');
    		});
    		
    		
    		
    		
    		document.querySelector('#emailSendModal').addEventListener('click', () => {
    			const toEmail = document.querySelector('#message-address').value;
    			const sendTitle = document.querySelector('#message-title').value;
    			const sendText = document.querySelector('#message-content').value;
    			$.ajax({
    				url: '${contextPath}/leaveMsg.ad',
    				type: 'POST',
    				data: {
    					toEmail : toEmail,
    					sendTitle: sendTitle,
    					sendText : sendText
    				},
    				success: data => {
    					if(data == 'success') {
    						alert('이메일 전송 성공');
    					} else if(data == 'fail') {
    						alert('이메일 전송 실패');
    					}
    				},
    				error : data => alert('서비스 요청에 실패하였습니다.')
    			})
    			$('#emailModal').modal('hide');
    		})
    		
    		// 메뉴에서 접근시에 일주일치만 보여주는 디폴트 검색값 설정
    		if('${term}' != '') {
    			if('${term}' == 'week') {
    				endDt.value = new Date().toISOString().slice(0, 10);
    				// 오늘 날짜 객체 생성
    			    let today = new Date();
    			    // 일주일 전 날짜 계산
    			    let weekAgo = new Date(today);
    			    weekAgo.setDate(today.getDate() - 7);
    			    // 일주일 전 날짜를 YYYY-MM-DD 형식으로 변환
    			    let weekAgoFormatted = weekAgo.toISOString().split('T')[0];
    				beginDt.value = weekAgoFormatted;
    			}
    			if('${term}' == 'month') {
					endDt.value = new Date().toISOString().slice(0, 10);
    				// 오늘 날짜 객체 생성
    			    let today = new Date();
    			    // 한달 전 날짜 계산
    			    let monthAgo = new Date(today);
    			    monthAgo.setDate(today.getDate() - 30);
    			    // 일주일 전 날짜를 YYYY-MM-DD 형식으로 변환
    			    let monthAgoFormatted = monthAgo.toISOString().split('T')[0];
    				beginDt.value = monthAgoFormatted;
    			}
    		}
    		
    		document.querySelector('#resetBtn').addEventListener('click', () => {
    			userId.value = '';
        		grade.children[0].selected = true; 
        		usersStatus.children[0].selected = true;
        		beginDt.value = '';
        		endDt.value = '';
    		})
    		
    		// 인터셉터가 전달한 메시지가 있는 경우
    		if('${msg}' != '') {
    			alert('${msg}');
    		}
    		<% session.removeAttribute("msg"); %>
    	}
    </script>
</body>
</html>