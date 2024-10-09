<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ contextPath }" scope="application"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<jsp:include page="../common/navbar.jsp"/>
	<style>
	*{
		font-family:'나눔스퀘어';
	}
	</style>
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
            <a class="d-flex text-black text-decoration-none fw-bold fs-5" href="${ contextPath }/siteOut.us">회원 탈퇴</a>
            <div class="input-group mb-0" style="width: 10%;">
                <div class="d-flex justify-content-end">
                    <button id="withdrawButton" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">탈퇴하기</button>
                    
                    <!-- 모달 -->
                    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="staticBackdropLabel">마지막 인사</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    탈퇴취소 할 경우 마이페이지로 넘어갑니다!<br><br>그동안 저희 사이트를 이용해주셔서 감사합니다.<br>보드위즈.
                                </div>
                                <div class="modal-footer">
                                    <button href="${ contextPath }/usersMyPage.us" class="btn btn-secondary">탈퇴취소</button>
                                    <button id="goSiteOutBtn" class="btn btn-primary">탈퇴확인</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 회원 탈퇴 폼 -->
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <h2 class="text-center mb-4">회원 탈퇴 페이지</h2>
                    <form id="withdrawForm" method="post" action="${ contextPath }/siteOut.us">
                        <div class="mb-3">
                            <label for="leaveReason" class="form-label">탈퇴 사유</label>
                            <select class="form-select" id="leaveReason" name="leaveReason" required>
                                <option value="">탈퇴 사유를 선택하세요</option>
                                <option value="1">자주 사용하지 않습니다.</option>
                                <option value="2">사이트가 불편합니다.</option>
                                <option value="3">탈퇴 후 재가입할 계획입니다.</option>
                                <option value="4">개인정보를 삭제하고 싶습니다.</option>
                                <option value="5">기타(선택시 사유를 적어주세요)</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="leaveMsg" class="form-label">기타 사유 (선택)</label>
                            <textarea class="form-control" id="leaveMsg" name="leaveMsg" rows="7" placeholder="기타 사유를 입력하세요"></textarea>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

	<div class="container py-3 my-4">
	    <ul class="nav justify-content-center pb-3 mb-3" style="position:sticky; ">
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

		document.querySelector('#goSiteOutBtn').addEventListener('click', () => {
			const leaveReason = document.querySelector('#leaveReason').value;
			const leaveMsg = document.querySelector('#leaveMsg').value;
			location.href = '${contextPath}/siteOutFinal.us?leaveReason=' + leaveReason + '&leaveMsg=' + leaveMsg;
		});
		
		document.querySelector('#siteOutCancle').addEventListener('click', () => {
			$('#staticBackdrop').modal('hide');
		})
	}
   </script>



</body>
</html>
