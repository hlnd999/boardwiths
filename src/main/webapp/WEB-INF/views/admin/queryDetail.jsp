<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>문의내용 조회 페이지</title>
	<link href="${contextPath }/resources/css/gameDetail.css" rel="stylesheet" type="text/css"/>
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet">
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
	<div id="header"><%@ include file="../common/navbar.jsp"%></div>
    <div id="mid">
        <div class="blank"><!-- 왼쪽 --></div>
        <nav style="background:black;">
            <jsp:include page="adminMenu.jsp"/>       
        </nav>
        <div id="adminContainer">
            <div id="admin_title">
                <div>
                	<i class="fa fa-quote-left text-warning" aria-hidden="true"></i>
                    <h3 class="bg-warning" style="display:inline;">문의내용 상세조회</h3>
                    <i class="fa fa-quote-right text-warning" aria-hidden="true"></i>
                </div>
            </div>
            <div id="admin_search"> 
                <div><!-- 공백 --></div>
                <div></div>
                <div></div>
                <div><!-- 공백 --></div>
            </div>
            <div id="admin_submit">
                <div></div>
                <div></div>
                <div></div>
            </div>
            <div id="admin_list"> 
                <div></div>
               		<form id="gameForm" action="" method="post" enctype="multipart/form-data">
		                <table class="table align-middle" style="height:100%;">
		                    <tbody>
		                    	<tr>
		                            <td class="align-middle">작성일</td>
		                            <td class="align-middle">
		                                <input type="text" class="form-control" value="${board.createDate }" disabled style="display:inline; width:200px; height:38px;"/>
		                            </td>
		                        </tr>
		                        <tr>
		                            <td class="align-middle">문의글 제목</td>
		                            <td class="align-middle">
		                                <input type="text" class="form-control" value="${board.title }" disabled style="width:400px; height:38px; display:inline;"/>
		                                &nbsp;&nbsp;&nbsp;
		                                <span></span>
		                            </td>
		                        </tr>
		                        <tr>
		                            <td class="align-middle">작성자</td>
		                            <td class="align-middle">
		                                <input type="text" class="form-control" value="${query.nickname }" disabled style="width:400px; height:38px; display:inline;"/>
		                                &nbsp;&nbsp;&nbsp;
		                                <span></span>
		                            </td>
		                        </tr>
		                        <tr>
		                            <td class="align-middle">문의 사유</td>
		                            <td class="align-middle">
		                            	<input type="text" class="form-control" class="gameInfo" value="${fn:split(query.queryReason, ' ')[0] }" disabled style="width:400px; height:38px; display:inline;"/>
	                            	</td>
		                        </tr>
		                        <tr>
		                            <td class="align-middle">기타 사유</td>
		                            <td class="align-middle">
		                                <input type="text" class="form-control" value="${fn:split(query.queryReason, ' ')[1] }" disabled style="width:400px; height:38px; display:inline;"/>
		                                &nbsp;&nbsp;
		                                <span></span>
		                            </td>
		                        </tr>
		                        <tr>
		                            <td class="align-middle">문의 내용</td>
		                            <td class="align-middle">
		                            	<textarea disabled class="form-control" rows="10" style="height: 200px; resize:none;">${board.content }</textarea>
		                            </td>
		                        </tr>
		                        <tr>
		                            <td class="align-middle">컨펌 여부</td>
		                            <td class="align-middle">
	                                <input type="hidden" name="boardNo" value="${board.boardNo }"/>
	                    			<button type="button" class="btn confirmBtn ${board.isComplete == 'Y' ? 'btn-warning' : 'btn-secondary'}" style="width:50px;">Y</button>
                            		&nbsp;&nbsp;
                            		<button type="button" class="btn confirmBtn ${board.isComplete == 'N' ? 'btn-warning' : 'btn-secondary'}" style="width:50px;">N</button>
		                            </td>
		                        </tr>
		                    </tbody>
		                </table>
                	</form>
                <div></div>
            </div>
            <div id="pageButton"> <!-- 버튼 공간 -->
            	<br/>
                <button id="emailModalBtn" class="btn btn-primary">답변하기</button>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <button id="deleteBtn" class="btn btn-danger">삭제하기</button> <!-- JS의 전역변수에 저장된 데이터를 전송한다 -->
                &nbsp;&nbsp;&nbsp;&nbsp;
                <button id="queryListBtn" class="btn btn-primary">문의목록</button>
            </div>

        </div>
        <div class="blank"><!-- 오른쪽 --></div>
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
    
    <!-- 이메일 모달2 -->
    <div class="modal" id="emailModal">
	    <div class="modal-dialog modal-dialog-scrollable">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h4 class="modal-title">문의 답장</h4>
	                <button type="button" class="btn-close" id="emailModalCloseBtn" data-bs-dismiss="modal">
	                	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
					 		<path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z"/>
						</svg>
	                </button>
	            </div>
	            <div class="modal-body">
	                <h1>메일 발송</h1>
	                <span class="badge bg-info text-dark">수신인</span><br/><br/>
                    <input class="form-control" id="message-address" value=""><br>
                    <span class="badge bg-info text-dark">메일제목</span><br/><br/>
                    <input class="form-control" id="message-title"> <br>
                    <textarea name="message" cols="60" rows="20" class="form-control" id="message-content" placeholder="답변을 입력해주세요."></textarea>
                    <button type="submit" class="btn btn-primary mt-2" id="emailSendModal">발송</button>
	            </div>
	
	            <div class="modal-footer">
	                <button type="button" class="btn btn-danger" id="emailCloseModal" data-bs-dismiss="modal">Close</button>
	            </div>
	        </div>
	    </div>
	</div>
    
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		window.onload = () => {
			// 삭제하기
			document.querySelector('#deleteBtn').addEventListener('click', () => {
				if(confirm('정말 삭제하시겠습니까?')) {
					const boardNo = document.querySelectorAll('.confirmBtn')[0].previousElementSibling.value;
					$.ajax({ //동기처리 => async: false
						url: '${contextPath}/deleteQuery.ad',
						type: 'POST',
						data: {boardNo: boardNo},
						success: data => {
							if(data == 'success') {
								alert('삭제가 완료되었습니다.');
								location.href='${contextPath}/AllQueryList.ad';
							} else {
								alert('삭제가 실패하였습니다.');
							}
						}
					})
				}
			})
			
			//문의목록으로 가기
			document.querySelector('#queryListBtn').addEventListener('click', () => {
				location.href='${contextPath}/AllQueryList.ad?page='+${page};
			})
			
			// 컨펌여부 비동기 처리
        	const confirmList = document.querySelectorAll('.confirmBtn');
        	for(const c of confirmList) {
        		c.addEventListener('click', function() {
        			if(this.className.includes('secondary')) {
        				// 회색버튼 클릭한 경우 컨펌상태값을 변경해야 한다.
        				const refBoardNo = this.parentElement.children[0].value;
						const changeConfirm = this.innerText;
        				$.ajax({
        					url: '${contextPath}/updateQuery.ad',
        					data: {refBoardNo: refBoardNo, queryConfirm: changeConfirm},
        					success: data =>{
        						if(data == 'success') {
        							const btnList = this.parentElement.querySelectorAll('button');
        							
        							for(const b of btnList) {
        								if(b.innerText != changeConfirm) {
        									b.classList.add('btn-secondary');
                							b.classList.remove('btn-warning');
        								} else {
        									b.classList.remove('btn-secondary');
                							b.classList.add('btn-warning');
        								}
        							}
        						} else {
        							alert('컨펌 변경 중 오류 발생');
        						}
        					},
        					error: data => alert('에러 발생'),
        				})
        			}
        		})
        	}
        	
        	document.querySelector('#emailModalBtn').addEventListener('click', () => {
        		$.ajax({
        			url: '${contextPath}/getEmail.ad',
        			data: {usersNo: ${board.usersNo}},
        			success: data => {
        				if(data != '') {
        					$('#emailModal').modal('show');
        					document.querySelector('#message-address').value = data;
        					document.querySelector('#message-title').value = "[${board.nickname}]님의 [${board.title }] 에 대한 답변입니다.";
        				} else if(data == '') {
        					alert('fail')
        				}
        			},
        			error: data => alert('에러')
        		})
        	})
        	
        	document.querySelector('#emailSendModal').addEventListener('click', () => {
        		const email = document.querySelector('#message-address').value;
        		const title = document.querySelector('#message-title').value;
        		const content = document.querySelector('#message-content').value;
        		
        		$.ajax({
        			url: '${contextPath}/querySendEmail.ad',
        			data: {
        				toEmail: email,
        				sendTitle: title,
        				sendText: content
        			},
        			success: data => {
        				if(data == 'success') {
        					alert('메일 발송을 성공하였습니다.');
        					$('#emailModal').modal('hide');
        				} else if(data == 'fail') {
        					alert('메일 발송을 실패하였습니다.');
        					$('#emailModal').modal('hide');
        				}
        			},
        			error: data => alert('서비스 요청에 실패하였습니다.')
        		})
        	})
		}
	</script>
</body>
</html>