<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" scope="application"/>
<jsp:include page="../common/navbar.jsp"/>
<div class="container lg" style="height: 1200px; width: 86%;">
	<h2>커뮤니티 규칙</h2><br>
	<p>
			보드라이프는 보드게임을 좋아하는 모든 구성원이 함께 만들고, 정보를 공유하고, 다양한 컨텐츠를 채워가는 보드게임 전문 커뮤니티 네트워크입니다.<br>
	
	커뮤니티 활동을 통해 관심사를 공유하는 사람들과 게임을 평가하고, 게임 정보와 게시물을 공유하고, 코멘트를 작성하고, 추천하고, 문의하며 배우고, 이야기하며 더욱 즐거운 취미 생활을 가능하게 합니다.<br>
	
	커뮤니티는 소셜 미디어나 블로그와 같은 개인 채널과 다르게 구성원들의 소속감을 기반으로 존재하기 때문에 구성원을 조롱하거나 위협하는 도구로 사용해선 안되며, 소속감을 약화 시키려는 행위를 해서는 안 됩니다.<br>
	
	보드라이프의 모든 구성원은 안정된 소속감을 형성할 수 있도록 서로 간에 배려는 물론 개인 정보를 존중해 주셔야 합니다.<br>
	
	또한 모든 구성원이 안정된 소속감을 토대로 건전한 커뮤니티를 형성하고 유지하기 위해서는 그에 따른 책임과 의무가 함께 수반되어야 할 것이며, 소속감을 약화 시키려는 행위를 자제하세요.<br>
	
	아래에 보드라이프의 모든 구성원이 반드시 지켜야 할 규칙이 명시되어 있습니다. 이 규칙들은 관리자인 보드라이프 운영팀에 의해 시행됩니다.<br>
	
	보드라이프 커뮤니티는 모든 구성원과 운영팀이 함께 만들어가며 공유된 규칙에 따라 운영될 경우에만 존재할 수 있습니다. 모든 구성원은 괴롭힘, 조롱, 위협 없이 보드라이프를 사용할 권리가 있음을 생각하세요.<br>
	</p>
	
	<h3>규칙1</h3>
	게시글, 코멘트, 쪽지 등 구성원 간에는 상대를 존중하고 예의를 갖춘다는 의미에서 존댓말을 사용하십시오.<br>
	<h3>규칙2</h3>
	성인물, 성적농, 성적 닉네임, 성적 프로필 사진, 성인 광고 등 미성년에게 유해한 활동은 금지됩니다.<br>
	<h3>규칙3</h3>
	특정 구성원, 집단 및 제3자에 대한 저격성 글, 개인 간에 주고받은 내용, 개인 정보가 포함된 글은 금지됩니다.<br>
	<h3>규칙4</h3>
	구성원에게 게시글, 코멘트, 쪽지 등을 작성 및 도배하여 특정 내용의 강요, 상대의 비방 및 비난하는 행위는 금지됩니다.<br>
	<h3>규칙5</h3>
	욕설, 폭언, 협박, 원색적 비난, 비아냥(비꼼), 비속어와 그의 파생어, 인신공격성 단어의 사용이나 발언은 금지됩니다.<br>
	<h3>규칙6</h3>
	일정 금액 및 상품 보상의 대가로 사이트, 동영상, 소셜 사이트 등의 광고 링크를 작성하거나, 홍보 목적으로 타 사이트, 개인 사이트, 블로그, 카페 링크를 작성하는 활동은 금지됩니다.<br>
	<h3>규칙7</h3>
	타 사이트 콘텐츠의 무단 발췌(출처가 기입되지 않은 발췌) 한 게시글의 작성은 금지됩니다.<br>
	<h3>규칙8</h3>
	보드라이프 사이트 기능을 훼손 시키는 어떠한 행위도 하지 마십시오.<br>
	<h3>시행</h3>
	위의 규칙 위반으로 신고된 구성원은 운영팀에 의해 다음과 같이 처리함<br>
	
	신고된 구성원은 이하 "게시자", 신고한 구성원은 "신고자", 신고가 접수된 관련 글,코멘트,쪽지는 이하 "작성글"로 표기함<br>
	
	신고자가 많아도 특정 규칙 위반이 적용된 작성글에 대해서만 신고수 1회 누적<br>
	
	최초 신고가 접수된 게시자 - 경고 발생, 작성글 삭제<br>
	누적 신고수 2회인 게시자 - 7일간 커뮤니티 활동 제재, 작성글 삭제.<br>
	누적 신고수 3회인 게시자 - 15일간 커뮤니티 활동 제재, 작성글 삭제.<br>
	누적 신고수 4회인 게시자 - 30일간 커뮤니티 활동 제재, 작성글 삭제.<br>
	누적 신고수 5회 이상인 게시자 - 1년간 커뮤니티 활동 제재, 작성글 삭제.<br>
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