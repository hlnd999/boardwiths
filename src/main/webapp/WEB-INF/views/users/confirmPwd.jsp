<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>
<style type="text/css">
body{
	height: 100%;
	font-family: -apple-system, BlinkMacSystemFont, helvetica, "Apple SD Gothic Neo", sans-serif;
	font-size: 1rem;
	display: flex; align-items: center; padding-top: 220px; padding-bottom: auto; 
}

.form-find {max-width: 420px; padding: 15px; align-items: center;}
.form-find .form-floating:focus-within {z-index: 2;}
.form-find a>label{color: black;}
.form-find a>label:hover{text-decoration: underline;}
.form-floating{width: 350px; display:float; text-align: center;}

/* .header_logo{ */
/* 	text-decoration: none; */
/* 	cursor: pointer; */
/* 	text-align: center; */
/* } */

</style>
</head>
<body class="whole_white">
	<main class="form-find w-100 m-auto" style="text-align: center;">
		<header id="header" role="banner" class="header">
			<div>
				<img class="header_logo" src="${ contextPath }/resources/logo.png" width="320px" height="100%">
			</div>
		</header>
		<div id="text" >
			<p>비밀번호가 변경되었습니다. 다시 로그인해주세요</p>
		</div>
			<button class="w-100 btn btn-lg btn-primary" type="submit" onclick="location.href='${contextPath}/home.do'">확인</button>
	</main>	
</body>
</html>