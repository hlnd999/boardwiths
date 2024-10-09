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
<style type="text/css">
html{height: 100%}
body{
	height: 100%;
	font-size: 1rem;
	display: flex; align-items: center; padding-top: 150px; padding-bottom: auto; 
}

.form-find {max-width: 420px; padding: 15px; align-items: center;}
.form-find .form-floating:focus-within {z-index: 2;}
.form-find a>label{color: black;}
.form-find a>label:hover{text-decoration: underline;}
.form-floating{width: 350px; text-align: center;}

/* .header_logo{ */
/* 	text-decoration: none; */
/* 	cursor: pointer; */
/* 	text-align: center; */
/* } */

</style>
</head>
<body class="whole_white">
	<main class="form-find w-100 m-auto" ">
		<header id="header" role="banner" class="header">
			<div>
				<img class="header_logo" src="${ contextPath }/resources/logo.png" width="320px" height="100%">
			</div>
		</header>
		<div id="text" >
			<h5>수정할 비밀번호를 입력하세요.</h5>
		</div>
		<form class="form-find small" action="${contextPath}/updatePwd.us" method="post" style="text-align: center;" id="form">
			<div class="form-floating">
				<input type="password" class="form-control" id="pwd" name="pwd" required>
				<label for="pwd">pwd</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="pwdConfirm" name="pwdConfirm" required>
				<label for="pwdConfirm">confirm pwd</label>
			</div>
			<br>
			<button class="btn btn-lg btn-primary" type="button" onclick="confirmPwd();">수정</button>
		</form>
	</main>
	<script>
		const confirmPwd = () => {
			const p1 = document.getElementById('pwd').value;
			const p2 = document.getElementById('pwdConfirm').value;
			if(p1 == p2){
				document.getElementById('form').submit();
			} else {
				alert("비밀번호가 일치 하지 않습니다, 다시 입력해주세요");
			}
		}
		
	</script>	
</body>
</html>