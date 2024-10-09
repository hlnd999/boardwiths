<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${ contextPath }/resources/css/main.css">
</head>

<body>
<c:set value="${ pageContext.servletContext.contextPath }" var="contextPath" scope="application"/>
<jsp:include page="/WEB-INF/views/common/navbar.jsp"/>


<div class="container lg" style="width: 86%;">
	<div class="grid text-center" style="padding-top: 20px; text-padding: 20px;">
		<div style="display: inline-block; ">
			<img src="resources/social.jpg" style="width:400px;">
			<button type="button" class="btn btn-info" onclick="location.href='${contextPath}/list.bo?category=2,3'" style="border: 1px solid skyblue; width: 70%; height: 90px; margin-top: 15px; margin: 15px; padding: 10px; font-size: 24px; color: white;">거래게시판</button>
		</div>
		<div style="display: inline-block">
			<img src="resources/game.jpg" style="width:400px;">
			<button type="button" class="btn btn-info" onclick="location.href='${contextPath}/list.bo?category=4,5'" style="border: 1px solid skyblue; width: 70%; height: 90px; margin-top: 15px; margin: 15px; padding: 10px; font-size: 24px; color: white;">소셜게시판</button>
		</div>
	</div>
	
	<div class="grid">

	  <div class="g-col-5" style="padding: 20px; font-size: 23px;">인기 TOP5 보드게임 바로가기</div>
	</div>
	<div class="d-flex grid" style="width: 1200px; height: 250px; margin: auto; ">
		<table class="table" style="width: 1100px; margin: auto;">
			<tr style="text-align :center">
				<c:forEach items="${ list }" var="l" >
					<td class="card d-inline-block" onclick="location.href='${contextPath}/searchBoardList.bo?category=2,3&condition=noSelect&value=${l.GAME_NAME}'"style="width: 17%; height: 250px; margin: 7px; cursor:pointer;">
						<c:if test="${ fn:containsIgnoreCase(l.IMG_RENAME, 'jpg') || fn:containsIgnoreCase(l.IMG_RENAME, 'png') }">
							<img src="${ contextPath }/resources/uploadFiles/${l.IMG_RENAME}" class="card-img-top" style="object-fit: fill; height: 180px;">
							<div class="card-body" >
						    	<p class="front-text" >${l.GAME_NAME}</p>
							</div>
						</c:if>
					</td>
				</c:forEach>
			</tr>
		</table>
	</div>
	<br><hr>
</div>

<div class="container py-3 my-4">
    <ul class="nav justify-content-center pb-3 mb-3" style="position:sticky; ">
      <li class="nav-item"><a href="${ contextPath }/communityrule.co" class="nav-link px-2 text-body-secondary">커뮤니티 규칙</a></li>
      <li class="nav-item"><a href="${ contextPath }/regulation.co" class="nav-link px-2 text-body-secondary">서비스 약관/정책</a></li>
      <li class="nav-item"><a href="${ contextPath }/personal_info.co" class="nav-link px-2 text-body-secondary">개인정보취급방침</a></li>
    </ul>
    <p class="text-center text-body-secondary">회사명: 보드라이프 | 서울시 중구 을지로 | 등록번호: 594-39-29383 | <br>
    Copyright © boardwiths / All rights reserved</p>
</div>
    
  </body>
</html>