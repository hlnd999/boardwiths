<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원정보 상세보기 페이지</title>
	<link href="${contextPath }/resources/css/userInfo.css" rel="stylesheet" type="text/css"/>
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
	<div id="header">
		<%@ include file="../common/navbar.jsp"%>
	</div>
    <div id="mid">
        <div class="blank"><!-- 왼쪽 --></div>
        <nav style="background:black;">
            <jsp:include page="adminMenu.jsp"/>         
        </nav>
        <div id="adminContainer">
            <div id="admin_title">
                <div>
                	<i class="fa fa-quote-left text-primary" aria-hidden="true"></i>
                    <h3 class="bg-warning" style="display:inline;">회원 정보 상세조회</h3>
                    <i class="fa fa-quote-right text-primary" aria-hidden="true"></i>
               	</div>
            </div>
            <div id="admin_search"> <!-- 검색바 넣을 자리-->
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
                <table class="table align-middle align-middle">
                    <tr>
                        <td class="align-middle">아이디</td>
                        <td class="align-middle">
                        	<input type="text" class="form-control" name="id" readonly value="${user.id }" style="width:200px; display:inline;"/>
                       	</td>
                    </tr>

                    <tr>
                        <td class="align-middle">닉네임</td>
                        <td class="align-middle">
                        	<input type="text" class="form-control" name="nickname" readonly value="${user.nickname }" style="width:200px; display:inline;"/>
                       	</td>
                    </tr>

                    <tr>
                    	<c:set var="emailId" value="${fn:split(user.email, '@')[0]}"/>
                    	<c:set var="emailDomain" value="${fn:split(user.email, '@')[1] }"/>
                    	
                        <td class="align-middle">이메일</td>
                        <td class="align-middle">
                            <input type="text" name="emailId" class="form-control" readonly value="${emailId }" style="width:200px; display:inline;"/>&nbsp;&nbsp;@
                            <select name="emailDomain" disabled class="form-select" style="width:200px; height:38px; display:inline;">
                                <option <c:if test="${fn:contains(emailDomain, 'naver') }">selected</c:if>>naver.com</option>
                                <option <c:if test="${fn:contains(emailDomain, 'google') }">selected</c:if>>google.com</option>
                                <option <c:if test="${fn:contains(emailDomain, 'hanmail') }">selected</c:if>>hanmail.net</option>
                                <option <c:if test="${fn:contains(emailDomain, 'example') }">selected</c:if>>example.com</option>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td class="align-middle">회원등급</td>
                        <td class="align-middle">
                        	<c:if test="${user.grade == 'S'}">
                        		<button type="button" class="btn statusBtn btn-warning" style="width:80px;">관리자</button>
                        	</c:if>
                           	<c:if test="${user.grade == 'A'}">
                        		<button type="button" class="btn statusBtn btn-warning" style="width:80px;">우수</button>
                        	</c:if>
                        	<c:if test="${user.grade == 'B'}">
                        		<button type="button" class="btn statusBtn btn-warning" style="width:80px;">일반</button>
                        	</c:if>
                        </td>
                    </tr>

                    <tr>
                        <td class="align-middle">회원상태</td>
                        <td class="align-middle">
                        	<c:if test="${user.usersStatus == 'Y'}">
                        		<button type="button" class="btn statusBtn btn-warning" style="width:80px;">Y</button>
                        	</c:if>
                        	<c:if test="${user.usersStatus == 'N'}">
                        		<button type="button" class="btn statusBtn btn-warning" style="width:80px;">N</button>
                        	</c:if>
                        </td>
                    </tr>
                    <tr>
                        <td class="align-middle">탈퇴 메시지</td>
                        <td class="align-middle">
                            <c:if test="${empty user.leaveMsg }">
                            	<input type="hidden" value="${user.email }"/>
                           		<span>탈퇴메시지가 존재하지 않습니다.<br/><br/></span>
                           		<button type="button" class="btn btn-secondary" id="leaveMsgBtn" style="width:150px;">이메일 전송</button>
                            </c:if>
                            <c:if test="${!empty user.leaveMsg }">
                            	<input type="hidden" value="${user.email }"/>
                            	<span>${user.leaveMsg }<br/><br/></span>
                            	<button type="button" class="btn btn-primary" id="leaveMsgBtn" style="width:150px;">이메일 전송</button>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td class="align-middle">신고 횟수</td>
                        <td class="align-middle">
                            <input type="number" class="form-control" name="reportCount" value="${user.reportCount }" min="0" readonly style="width:200px; height:38px; display:inline;"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="align-middle">정보수정일자</td>
                        <td class="align-middle">
                        	<input type="text" class="form-control" readonly value="<fmt:formatDate value="${user.updateDate }" type="date" dateStyle="full"/>" style="width:200px; height:38px; display:inline;"/>
                        </td>
                    </tr>
                </table>
                <div></div>
            </div>
            <div id="pageButton"> <!-- 페이지 버튼 공간 -->
                <button type="button" class="btn btn-primary" id="updateBtn">수정하기</button> 
                &nbsp;&nbsp;&nbsp;&nbsp;
                <button type="button" class="btn btn-primary" onclick="history.back()">뒤로가기</button>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <button type="button" class="btn btn-primary" id="userListBtn">회원목록</button>
            </div>

        </div>
        <div class="blank"><!-- 오른쪽 --></div>
    </div>
    
    <!-- 이메일 모달2 -->
    <div class="modal" id="emailModal">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h4 class="modal-title">탈퇴메시지 답장</h4>
	                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	            </div>
	            <div class="modal-body">
	                <h1>메일 발송</h1>
                    <input class="form-control" id="recipient-name" value=""> <br>
                    <input class="form-control" id="message-title"> <br>
                    <textarea name="message" cols="60" rows="20" class="form-control" id="message-text"></textarea>
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
    
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
    	window.onload = () => {
    		document.querySelector('#userListBtn').addEventListener('click', () => {
    			location.href='${contextPath}/userList.ad?page=' + ${page};
    		})
    		
    		document.querySelector('#updateBtn').addEventListener('click', () => {
    			location.href='${contextPath}/userModifyForm.ad?usersNo=' + ${user.usersNo} + '&page=' + ${page};
    		})
    		
    		//이메일 전송 컨텐츠 입력 모달창 출력
    		document.querySelector('#leaveMsgBtn').addEventListener('click', function() {
    			const toEmail = this.previousElementSibling.previousElementSibling.value;
    			const sendTitle = '그 동안의 보드위즈 이용에 감사드립니다.';
    			const sendText = '회원님의 의견에 귀기울여 더 성장할 수 있는 보드위즈가 되겠습니다.';
    			document.querySelector('#recipient-name').value = toEmail;
    			document.querySelector('#message-title').value = sendTitle;
    			document.querySelector('#message-text').value = sendText;
    			$('#emailModal').modal('show');
    		})
    		
    		//이메일 전송 모달 닫기
    		document.querySelector('#emailCloseModal').addEventListener('click', () => {
    			$('#emailModal').modal('hide');
    		})
    		//이메일 전송하기
    		document.querySelector('#emailSendModal').addEventListener('click', () => {
    			const toEmail = document.querySelector('#recipient-name').value;
    			const sendTitle = document.querySelector('#message-title').value;
    			const sendText = document.querySelector('#message-text').value;
    			
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
    	}
    
    
    
    
    </script>
    
    
</body>
</html>