<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
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
.form-floating{width: 350px; display:float; text-align: center; margin-bottom: 3px;}

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
			<div onclick="location.href='${contextPath}/home.do'" style="cursor:pointer;">
				<img class="header_logo" src="${ contextPath }/resources/logo.png" width="320px" height="100%">
			</div>
		</header>
		<div id="text" >
			<h5>아래 정보를 입력해주세요</h5>
		</div>
		<form class="form-find small" action="${contextPath}/findPw.us" method="post" style="text-align: center;">
			<label id="idCheckResult">Please check your ID.</label>
			<div class="form-floating">
				<input type="text" class="form-control" id="id" name="id" placeholder="input your id" required>
				<label for="id">ID</label>
			</div>
			<br>
			<div class="form-floating">
				<input type="text" class="form-control" id="email" name="email" disabled="disabled" placeholder="input your email" required>
				<label for="email">email</label>
			</div>
			<br>
			<button type="submit" id="next" class="w-100 btn btn-lg btn-primary" disabled="disabled">다음</button>
		</form>
	</main>
	<script>
	window.onload =()=> {
		document.getElementById('id').addEventListener('input', function(){
			const idResult = document.getElementById('idCheckResult');
			const email = document.getElementById('email');
			const nextBtn = document.getElementById('next');
			
			if(this.value.trim() == ''){
				idResult.innerText = "Please check your ID.";
				idResult.style.color = 'gray';
				
				nextBtn.disabled = true;
			} else {
				$.ajax({
					url: '${contextPath}/checkId.us',
					data: {id:this.value.trim()},
					success: (data)=>{
						console.log(data);
						if(data.trim() == 'yes'){
							idResult.innerText = "없는 아이디입니다";
							idResult.style.color = 'red';
							email.disabled = true;							
						} else {
							idResult.innerText = "아이디가 확인되었습니다. 인증번호를 위한 이메일을 입력하세요";
							idResult.style.color = 'green';
							if(email != null){
								email.disabled = false;
								nextBtn.disabled = false;
							} else {
								email.disabled = true;
							}
						}
					},
					error: (data) => console.log(data)
				})
			}
		})
		document.getElementById('next').addEventListener('click', function(){
			const id = document.getElementById('id').value.trim();
		    const email = document.getElementById('email').value.trim();
		    
		    if (id === '' || email === '') {
		        alert('아이디와 이메일을 입력해주세요.');
		        return false;
		    } else {
		    	return true;
		    }
		});
	}
	</script>		
</body>
</html>