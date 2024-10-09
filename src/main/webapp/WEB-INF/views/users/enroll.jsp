<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<style>
	html, body {height: 100%;}
	body {display: flex; align-items: center; background-color: white;}
	.form-signin {max-width: 450px; min-width: 300px; }
	.form-control[id="pwd"]{ margin-top: 10px;}
	.form-control[id="usersName"], .form-control[id="phone"] {margin-bottom: 26px; }
	.form-control[id="usersName"] {margin-top: 10px;}
	.form-control[id="nickname"] {margin-top: 10px;}
 	.input-group{margin-bottom: 10px; } 
 	.form-control[id="id"], .form-control[id="nickname"], .form-control[id="pwd"]{margin-bottom: 0px;} 
 	#idCheckResult, #nicknameCheckResult, #passwordCheckResult{
 		display: flex; color: gray; font-size: 12px; text-align: left;  
 	}
	.hide{display: none;}
</style>

</head>
<body class="text-center">
	<main class="form-signin w-100 m-auto">
		<form action="${contextPath}/insertUsers.us" method="post">
			<header id="header" role="banner" class="header">
				<div onclick="location.href='${contextPath}/home.do'" style="cursor:pointer;">
					<img class="header_logo" src="${ contextPath }/resources/logo.png" width="320px" height="100%">
				</div>
				<p class="h5 mb-1 fw-normal">- 회원 가입 -</p><br>
			</header>
			<div class="mb-0" >
<!-- 				<label for="id" class="form-label">*아이디</label> -->
				<input type="text" class="form-control" id="id" name="id" maxlength="13" placeholder="(필수)아이디" required>
			</div>	
			<label id="idCheckResult">Please check your ID.</label>
<!-- 			<div class="success-message hide font">사용할 수 있는 아이디입니다</div> -->
<!-- 			<div class="failure-message hide font">아이디는 네 글자 이상이어야 합니다</div> -->
			
			<div class="mb-0">
<!-- 				<label for="pwd" class="form-label">*비밀번호</label> -->
				<input type="password" class="form-control" id="pwd" name="pwd" maxlength="13" placeholder="(필수)비밀번호" required>
			</div>
			<label id="passwordCheckResult">Please check your password.</label>
			
			<div class="mb-0">
<!-- 				<label for="nickname" class="form-label">*닉네임</label> -->
				<input type="text" class="form-control" id="nickname" name="nickname" maxlength="20" placeholder="(필수)닉네임" required>
			</div>
			<label id="nicknameCheckResult">Please check your nickname.</label>
			
			<div class="mb-1">
<!-- 				<label for="name" class="form-label">이름</label> -->
				<input type="text" class="form-control" id="usersName" name="usersName" placeholder="(선택)이름" maxlength="7">
			</div>
			
			<div class="mb-1">
<!-- 				<label for="pwd" class="form-label">휴대전화</label> -->
				<input type="tel" class="form-control" id="phone" name="phone" placeholder="(선택)휴대전화" maxlength="11" autocomplete="010">
			</div>
			
			<div class="mb-0">
<!-- 				<label for="email" class="form-label">*비밀번호 분실시 확인용 이메일</label> -->
					<input type="text" class="form-control" id="email" name="email" placeholder="(필수)비밀번호 분실시 확인용 이메일"required>
				<div class="input-group">
					<input type="button" value="인증하기" class="btn btn-primary" id="emailAuth"  disabled="disabled" height="40px">
					<input class="form-control" placeholder="인증 코드를 입력해주세요" maxlength="6"  disabled="disabled" name="authCode" id="authCode" type="text" autofocus>
				</div>	
					<span id="emailAuthWarn"></span>
			</div>
			
			<br>
			<button class="w-100 btn btn-primary" id="registerBtn" type="submit" disabled="disabled">회원 가입</button><br><br>
		</form>
	</main>
	
	<script>
	let idValid = false;
    let pwdValid = false;
    let nicknameValid = false;
    let emailVerified = false;
    let emailValid = false;
    let code;

    function checkFormValidity() {
        document.getElementById('emailAuth').disabled = !(idValid && pwdValid && nicknameValid && emailValid);
    }	
	
	window.onload =()=> {
			document.getElementById('id').addEventListener('input', function(){
				const idResult = document.getElementById('idCheckResult');
				const idVal = this.value.trim();
				const idRegExp = /^[a-z0-9](?=.*[a-z])(?=.*\d)[a-z0-9]{5,13}$/;
				if(this.value.trim() == ''){
					idResult.innerText = "Please check your ID.";
					idResult.style.color = 'gray';
					idValid = false;
				} else if(!idRegExp.test(idVal)){
					idResult.innerText = "아이디는 영문과 숫자의 조합 13자리 이내로 가능합니다.";
                    idResult.style.color = 'red';
                    idValid = false;
				} else {
					$.ajax({
						url: '${contextPath}/checkId.us',
						data: {id:this.value.trim()},
						success: (data)=>{
							console.log(data);
							if(data.trim() == 'yes'){
								idResult.innerText = "사용가능한 아이디입니다";
								idResult.style.color = 'green';
								idValid = true;
							} else {
								idResult.innerText = "이미 존재하는 아이디가 있습니다";
								idResult.style.color = 'red';
								idValid = false;
							}
						},
						error: (data) => console.log(data)
					})
				}
				checkFormValidity();
			})
			
			document.getElementById('pwd').addEventListener('input', function(){
				const pwdResult = document.getElementById('passwordCheckResult');
				const pwdVal = this.value.trim();
				const pwdRegExp = /^[a-z0-9](?=.*[a-z])(?=.*\d)[a-z0-9]{5,13}$/;
				if(this.value.trim() == ''){
					pwdResult.innerText = "Please check your password.";
					pwdResult.style.color = 'gray';
					pwdValid = false;
				} else if(!pwdRegExp.test(pwdVal)){
					pwdResult.innerText = "비밀번호는 영문과 숫자의 조합 13자리 이내로 가능합니다.";
                    pwdResult.style.color = 'red';
                    pwdValid = false;
				} else {
					pwdResult.innerText = "사용가능한 비밀번호 입니다";
					pwdResult.style.color = 'green';
					pwdValid = true;
				}
				checkFormValidity();
			})
			
			document.getElementById('nickname').addEventListener('input', function(){
                const nicknameResult = document.getElementById('nicknameCheckResult');
                const nicknameVal = this.value.trim();
                if(nicknameVal == ''){
                    nicknameResult.innerText = "Please check your nickname.";
                    nicknameResult.style.color = 'gray';
                    nicknameValid = false;
                } else {
                    $.ajax({
                        url: '${contextPath}/checkNickname.us',
                        data: {nickname:nicknameVal},
                        success: (data)=>{
                            console.log(data);

                            if(data.trim() == 'yes'){
                                nicknameResult.innerText = "사용가능한 닉네임입니다";
                                nicknameResult.style.color = 'green';
                                nicknameValid = true;
                            } else {
                                nicknameResult.innerText = "이미 존재하는 닉네임이 있습니다";
                                nicknameResult.style.color = 'red';
                                nicknameValid = false;
                            }
                            //checkFormValidity();
                        },
                        error: data => console.log(data)
                    });
                }
                checkFormValidity();
                
            })
			
            document.getElementById('email').addEventListener('input', function() {
                const emailVal = this.value.trim();
                const emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
                if (emailVal === '') {
                    emailValid = false;
                } else if (!emailRegExp.test(emailVal)) {
                    emailValid = false;
                } else {
                    emailValid = true;
                }
                checkFormValidity();
            })
			//var status = { id: false, pw: false, check: true};
			
            $("#emailAuth").click(function(){
            	const email = $('#email').val().trim(); // 입력한 이메일 값 받아오기
            	const id = $('#id').val().trim();
    			const pwd = $('#pwd').val().trim();
    			const nickname = $('#nickname').val().trim();
    			
    			if( id == '' || pwd == '' || nickname == '' || email == '' ){
    				alert("필수 사항을 입력하세요");
    				return false;
    			} else {
    			 
	    			// Ajax 로 전송
	    			$.ajax({
	    				url: './emailAuth.us',
	    				data: {
	    					email : email
	    				},
	    				type: 'post',
	    				dataType: 'json',
	    				success: function(result){
	    					console.log("result : " + result);
	    					
	    					// 이메일이 존재하지 않는 경우
	    					
	    					if(result.exist === false){ 
	    						alert("없는 이메일 주소입니다");
	    						return false; 
	    					}
	    					
	    					$('#authCode').attr("disabled", false);
	    					code = result;
	    					alert("인증코드가 입력하신 이메일로 전송되었습니다");
	    				}
    				})
    			}
    		});
    		
    		$('#authCode').on('input', function(){
    			const inputCode = $('#authCode').val();
    			console.log("입력코드 : " + inputCode);
    			console.log("인증코드 : " + code);
    			
    			if(Number(inputCode) === code){
    				$('#emailAuthWarn').html('인증번호가 확인되었습니다');
    				$('#emailAuthWarn').css('color', 'green');
    				$('#emailAuthWarn').css('color', 'green');
    				$('#emailAuth').attr('disabled', true);
    				$('#email').attr('readonly', true);
    				$('#registerBtn').attr("disabled", false);
    				emailVerified = true;
    			} else {
    				$('#emailAuthWarn').html('인증번호가 불일치합니다. 다시 확인해주세요');
    				$('#emailAuthWarn').css('color', 'red');
     				$('#registerBtn').attr("disabled", true);
     				emailVerified = false;
    			}
    		})
    		
    		$('#registerBtn').click(function(){
    			const id = $('#id').val();
    			const pwd = $('#pwd').val();
    			const nickname = $('#nickname').val();
    			const email = $('#email').val(); // 입력한 이메일 값 받아오기
    			
    			if( id == '' || pwd == '' || nickname == '' || email == '' ){
    				alert("필수 사항을 입력하세요");
    				return false;
    			} else if(emailVerified == false && ((idValid || pwdValid || emailValid || nicknameValid) == false)) {
    				alert("가입 가능한 정보를 입력해주세요");
    			} else if(emailVerified == false && ((idValid && pwdValid && emailValid && nicknameValid) == true)){
    				alert("이메일 인증을 완료해주세요");
    			} else {
    				alert("회원가입이 완료되었습니다");
    				return true;
    			}
    		})
		}
				
	</script>
</body>
</html>