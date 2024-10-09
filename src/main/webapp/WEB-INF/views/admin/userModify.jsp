<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 정보 수정 페이지</title>
	<link href="${contextPath }/resources/css/userInfo.css" rel="stylesheet" type="text/css"/>
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet"> -->
    <!-- <link href="https://maxcdn.bootstrapcdn.com/font-awesome/5.2.0/css/font-awesome.min.css" rel="stylesheet"> -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
                    <h3 class="bg-warning" style="display:inline;">회원 정보 수정</h3>
                    <i class="fa fa-quote-right text-warning" aria-hidden="true"></i>
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
				<form id="userModifyForm" method="post" action="${contextPath }/userModify.ad">               
                	<input type="hidden" name="usersNo" value="${user.usersNo }"/>
                	<input type="hidden" name="page" value="${page }"/>
	                <table class="table align-middle" style="height: 100%;">
	                    <tr>
	                        <td class="align-middle">
	                        	아이디
                        	</td>
	                        <td class="align-middle">
	                        	<input type="text" class="form-control" name="id" disabled value="${user.id }" style="width:200px; display:inline;"/>
                        	</td>
	                    </tr>
						
						<tr>
	                        <td class="align-middle">비밀번호</td>
	                        <td class="align-middle">
	                            <button type="button" class="btn btn-danger" id="pwdReset" style="width: 200px;">비밀번호 초기화</button>
	                        </td>
	                    </tr>
						
	                    <tr>
	                        <td class="align-middle">닉네임</td>
	                        <td class="align-middle">
	                        	<input type="text" class="form-control" name="nickname" value="${user.nickname }" required style="width:200px; display:inline;"/>
	                        	&nbsp;&nbsp;
	                        	<span class="badge text-bg-info">불건전 닉네임에 대해 변경이 가능합니다.</span>	
                        	</td>
	                    </tr>
				
	                    <tr>
	                    	<c:set var="emailId" value="${fn:split(user.email, '@')[0]}"/>
	                    	<c:set var="emailDomain" value="${fn:split(user.email, '@')[1] }"/>
	                    	
	                        <td class="align-middle">이메일</td>
	                        <td class="align-middle">
	                            <input type="text" class="form-control" name="emailId" disabled value="${emailId }" style="width:200px; display:inline;"/>&nbsp;&nbsp;@
	                            <select name="emailDomain" class="form-select" disabled style="width:200px; height: 38px; display:inline;">
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
	                           	<button type="button" class="btn gradeBtn ${user.grade == 'S' ? 'btn-warning' : 'btn-secondary'}" style="width:80px;">관리자</button>
	                            &nbsp;&nbsp;
	                            <button type="button" class="btn gradeBtn ${user.grade == 'A' ? 'btn-warning' : 'btn-secondary'}" style="width:80px;">우수</button>
	                            &nbsp;&nbsp;
	                            <button type="button" class="btn gradeBtn ${user.grade == 'B' ? 'btn-warning' : 'btn-secondary'}" style="width:80px;">일반</button>
	                            &nbsp;&nbsp;
	                            <span class="badge text-bg-info">선택시 등급이 변경됩니다.</span>
	                        </td>
	                    </tr>
	                    
	                    <tr>
	                        <td class="align-middle">회원상태</td>
	                        <td class="align-middle">
	                            <button type="button" class="btn statusBtn ${user.usersStatus == 'Y' ? 'btn-warning' : 'btn-secondary'}" style="width:50px;">Y</button>
	                            &nbsp;&nbsp;
	                            <button type="button" class="btn statusBtn ${user.usersStatus == 'N' ? 'btn-warning' : 'btn-secondary'}" style="width:50px;">N</button>
	                        	&nbsp;&nbsp;
	                        	<span class="badge text-bg-info">선택시 상태가 변경됩니다.</span>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td class="align-middle">신고 횟수</td>
	                        <td class="align-middle">
	                            <input type="number" class="form-control" name="reportCount" value="${user.reportCount }" required min="0" style="width:200px; display:inline;"/>
	                        	&nbsp;&nbsp;
	                        	<span class="badge text-bg-info">불합리한 신고횟수에 대한 변경이 가능합니다.</span>	
	                        </td>
	                    </tr>
	                    <tr>
	                        <td class="align-middle">정보수정일자</td>
	                        <td class="align-middle">
	                        	<input type="text" class="form-control" style="width:200px; display:inline;" disabled value="<fmt:formatDate value="${user.updateDate }" type="date" dateStyle="full" />"/>
	                        </td>
	                    </tr>
	                </table>
                </form>
                <div></div>
            </div>
           <div id="pageButton"> 
           		<br/>
           		<button type="button" class="btn btn-primary" id="updateBtn">저장하기</button> 
                &nbsp;&nbsp;&nbsp;&nbsp;
                <button type="button" class="btn btn-primary" id="backBtn">뒤로가기</button> 
                &nbsp;&nbsp;&nbsp;&nbsp;
                <button type="button" class="btn btn-primary" id="userListBtn">회원목록</button>
            </div>

        </div>
        <div class="blank">오른쪽</div>
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
    			location.href='${contextPath}/userList.ad?page=' + '${page}';
    		})
    		
    		document.querySelector('#backBtn').addEventListener('click', () => {
    			location.href='${contextPath}/userInfo.ad?usersNo=' + ${user.usersNo} + '&page=' + '${page}';
    		})
    		
    		document.querySelector('#updateBtn').addEventListener('click', () => {
    			document.querySelector('#userModifyForm').submit();
    		})
    		
    		const gradeBtnList = document.querySelectorAll('.gradeBtn');
    		for(const g of gradeBtnList) {
    			g.addEventListener('click', function() {
    				if(!this.className.includes('btn-warning')) { // 회색버튼을 클릭했을 때
   						// ajax
    					$.ajax({
    						url: '${contextPath}/updateGrade.ad',
    						type: 'POST',
    						data: {
    							grade: this.innerText,
    							usersNo: ${user.usersNo}	
    						}, 
    						success: data => {
    							if(data == 'success') { 
    								// 기존의 노랑 버튼을 회색 버튼으로 바꾼다.
    								// 변경된 회원등급에 대한 버튼을 노랑이로 바꾼다.
    								for(const gb of gradeBtnList) {
    									if(gb.innerText == this.innerText) {
    										gb.classList.remove('btn-secondary');
    										gb.classList.add('btn-warning');
    									} else {
    										gb.classList.remove('btn-warning');
    										gb.classList.add('btn-secondary');
    									}
    								}
    							} else if(data == 'fail'){
    								alert('회원 정보 수정 중 오류 발생!')
    							}
    						},
    						error: data => alert('오류가 발생하였습니다.')
    					})
    				}
    			})
    		}
    		// 회원 상태 변경
 			const statusBtnList = document.querySelectorAll('.statusBtn');
    		for(let s of statusBtnList) {
				s.addEventListener('click', function() { // 회색버튼에서만 ajax 작동해야함
				    				
    				if(this.className.includes('secondary')) {
    					const status = this.innerText;
    					const myTd = this.parentElement;
    					const userNo = document.querySelector('#userModifyForm').children[0].value;
    					
    					$.ajax({
    						url: '${contextPath}/updateStatus.ad',
    						type: 'POST',
    						data: {usersNo : ${user.usersNo}, usersStatus: status},
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
    		
    		
    		// 비밀번호 초기화 기능
    		document.querySelector('#pwdReset').addEventListener('click', () => {
    			// 유저 번호, 유저 이메일
    			const usersNo = '${user.usersNo}';
    			const toEmail = '${user.email}';
    			if(confirm('정말 초기화하시겠습니까?')) {
	    			$.ajax({
	    				url: '${contextPath}/pwdReset.ad',
	    				type: 'POST',
	    				data: {
	    					usersNo: usersNo,
	    					toEmail: toEmail
	    				},
	    				success: data => {
	    					if(data == 'success') {
	    						alert('비밀번호 초기화 성공');
	    					} else if(data == 'fail') {
	    						alert('비밀번호 초기화 실패');
	    					}
	    				},
	    				error: data => alert('서비스 요청에 실패하였습니다.')
	    				
	    			})
    			}
    		})
    	}
    </script>
    
</body>
</html>