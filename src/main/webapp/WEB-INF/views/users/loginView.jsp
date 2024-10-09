<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>
<style>
	html, body {height: 100%;}
	body {
	display: flex; align-items: center; padding-top: 40px; padding-bottom: 40px; 
/* 	background-color: #f5f5f5 */
}
	.form-signin {max-width: 360px; padding: 15px;}
	.form-signin .form-floating:focus-within {z-index: 2;}
	.form-signin input[type="password"] {margin-bottom: 10px; border-top-left-radius: 0; border-top-right-radius: 0;}
	.form-signin a>label{color: black;}
	.form-signin a>label:hover{text-decoration: underline;}
</style>

<body class="text-center">
	<main class="form-signin w-100 m-auto">
		<form action="${contextPath}/login.us" method="post" >
			<h2 class="h3 mb-3 fw-normal">- 로그인 -</h2>
			<header id="header" role="banner" class="header">
				<div onclick="location.href='${contextPath}/home.do'" style="cursor:pointer;">
					<img class="header_logo" src="${ contextPath }/resources/logo.png" width="320px" height="100%">
				</div>
			</header>
			
			<div class="form-floating">
				<input type="text" class="form-control" id="id" name="id" placeholder="input your id" required>
				<label for="id">ID</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="pwd" name="pwd" placeholder="Password" required>
				<label for="pwd">비밀번호</label>
			</div>
			<br>
			<button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button><br><br>
			<input type="hidden" name="beforeURL">
		</form>
		<div class="mb-3" >
			<a href='${contextPath}/enroll.us'>회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href='${contextPath}/findPwView.us'>비밀번호 찾기</a>
		</div>
	</main>
	<script>
		window.onload =()=> {
			const beforeURL = document.referrer; // document.referrer 에 이전 URL이 담겨있음
			// console.log(beforeURL);
			const msg = '${msg}'; // 메세지 O or ''
			if(msg != ''){
				alert(msg);
				document.getElementsByName('beforeURL')[0].value = beforeURL;
			}
		}
	</script>
</body>
</html>