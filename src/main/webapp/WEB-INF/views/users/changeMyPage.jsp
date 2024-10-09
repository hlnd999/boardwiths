<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ contextPath }" scope="application"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
	*{
		font-family:'나눔스퀘어';
	}
	</style>
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
	                <a href="${ contextPath }/usersMyPage.us" class="nav-link text-white" aria-current="page">마이페이지</a>
	            </li>
	            <li>
	                <a href="${ contextPath }/usersChange.us" class="nav-link text-white">회원정보 수정</a>
	            </li>
	            <li>
	                <a href="${ contextPath }/siteOut.us" class="nav-link text-white">탈퇴하기</a>
	            </li>
	            <hr>
	            <li>
	                <a href="${ contextPath }/myBoardList.us" class="nav-link text-white">작성글</a>
	            </li>
	            <li>
	                <a href="${ contextPath }/myReplyList.us" class="nav-link text-white">작성댓글</a>
	            </li>
	            <li>
	                <a href="${ contextPath }/myReBoardList.us" class="nav-link text-white">댓글단 글</a>
	            </li>
	            <li>
	                <a href="${ contextPath }/myBoardLikeList.us" class="nav-link text-white">좋아요한 글</a>
	            </li>
	        </ul>
	        <hr>
	    </div>
    
        <div class="d-inline-block p-3 text-bg-light flex-grow-1 text-align-center" style="width: 1100px;">
            <div class="container d-flex justify-content-between mb-3">
                <a class="d-flex text-black text-decoration-none fw-bold fs-5" href="${ contextPath }/usersChange.us">회원정보 수정</a>
                <div class="input-group mb-0" style="width: 10%;"></div>
            </div>
    
      <div class="container mt-5 container mb-3">
<form id="changeMyForm" method="POST" action="${ contextPath }/usersChangeFinal.us">
    <input type="hidden" name="usersNo" value="${ loginUser.usersNo }"/>
    <table class="table table-hover align-middle">
        <thead class="align-middle">
            <tr>
                <th scope="col" width="100px" height="60">이름</th>
                <td id="usersNameCell" class="align-middle">
                    <input type="text" class="changeInput" value="${ loginUser.usersName }" name="usersName"/>
                </td>
            </tr>
            <tr>
                <th scope="col" width="100px" height="60">닉네임</th>
                <td id="nicknameCell" class="align-middle">
                    <input type="text" class="changeInput" value="${ loginUser.nickname }" name="nickname"/>
                </td>
            </tr>
            <tr>
                <th scope="col" width="100px" height="60">아이디</th>
                <td id="idCell" class="align-middle">
                    <input type="text" class="changeInput" value="${ loginUser.id }" name="id" />
                </td>
            </tr>
            <tr>
                <th scope="col" width="100px" height="60" style="display:none;">비밀번호</th>
                <td id="pwdCell" class="align-middle" style="display:none;">
                    <input type="password" class="changeInput" value="${ loginUser.pwd }" name="pwd"/>
                </td>
            </tr>
            <tr>
                <th scope="col" width="100px" height="60">휴대전화</th>
                <td id="phoneCell" class="align-middle">
                    <input type="text" class="changeInput" value="${ empty loginUser.phone ? '-' : loginUser.phone }" name="phone"/>
                </td>
            </tr>
            <tr>
                <th scope="col" width="100px" height="60">이메일</th>
                <td id="emailCell" class="align-middle">
                    <input type="text" class="changeInput" value="${ empty loginUser.email ? '-' : loginUser.email }" name="email"/>
                </td>
            </tr>
       	     <tr>
                  <th scope="col" width="100px" height="60">회원등급</th>
                  <td id="gradeCell" class="align-middle">${ loginUser.grade }</td>
              </tr>
              <tr>
                  <th scope="col" width="100px" height="60">회원번호</th>
                  <td id="usersNoCell" class="align-middle">${ loginUser.usersNo }</td>
              </tr>
              <tr>
                  <th scope="col" width="100px" height="60">가입날짜</th>
                  <td id="enrollDateCell" class="align-middle">${ loginUser.enrollDate }</td>
              </tr>
              <tr>
                  <th scope="col" width="100px" height="60">신고횟수</th>
                  <td id="reportCountCell" class="align-middle">${ loginUser.reportCount }</td>
              </tr>
              </thead>
            </table>
            <button id="saveButton" class="btn btn-success">저장하기</button>
		</form>

          </div>
    
        </div>
    </div>
           
    <div class="mh-100" style="width: 100px; height: 260px;"></div>
            
    <div class="container py-3 my-4">
        <ul class="nav justify-content-center pb-3 mb-3" style="position:sticky;">
            <li class="nav-item"><a href="${ contextPath }/common/communityrule" class="nav-link px-2 text-body-secondary">커뮤니티 규칙</a></li>
            <li class="nav-item"><a href="${ contextPath }/common/regulation" class="nav-link px-2 text-body-secondary">서비스 약관/정책</a></li>
            <li class="nav-item"><a href="${ contextPath }/common/personal_info" class="nav-link px-2 text-body-secondary">개인정보취급방침</a></li>
        </ul>
        <p class="text-center text-body-secondary">회사명: 보드라이프 | 서울시 중구 을지로 | 등록번호: 594-39-29383 | <br>
        Copyright © boardwiths / All rights reserved</p>
    </div>
    
<script>
window.onload = () => {
    $('.nav-link').hover(function() {
        $(this).addClass('active');
    }, function() {
        $(this).removeClass('active');
    });

//     document.querySelector('#saveButton').addEventListener('click', function() {
//         const usersName = document.querySelector('#usersNameCell input').value;
//         const nickname = document.querySelector('#nicknameCell input').value;
//         const id = document.querySelector('#idCell input').value;
//         const pwd = document.querySelector('#pwdCell input').value;
//         const phone = document.querySelector('#phoneCell input').value;
//         const email = document.querySelector('#emailCell input').value;

//         const changeInputs = document.getElementsByClassName('changeInput');
//         let count = 0;
//         for (let input of changeInputs) {
//             if (input.value.trim() != '') {
//                 count++;
//                 if (count == 6) {
//                     alert('정보가 성공적으로 업데이트되었습니다.');
//                     document.querySelector('#changeMyForm').submit();
//                 }
//             }
//         }
//     });
}
</script>




</body>
</html>