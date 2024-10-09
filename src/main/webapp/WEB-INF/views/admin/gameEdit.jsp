<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게임 조회 페이지</title>
	<link href="${contextPath }/resources/css/gameEdit.css" rel="stylesheet" type="text/css"/>
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet"> 
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/5.2.0/css/font-awesome.min.css" rel="stylesheet"> 
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
                	<i class="fa fa-quote-left text-primary" aria-hidden="true"></i>
                    <h3 class="bg-warning" style="display:inline;">게임정보 수정</h3>
                    <i class="fa fa-quote-right text-primary" aria-hidden="true"></i>
                </div>
            </div>
            <div id="admin_search"> 
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
               		<form id="gameForm" action="${contextPath }/updateGame.ad" method="post" enctype="multipart/form-data">
		                <table class="table align-middle" style="height:100%;">
		                    <tbody>
		                        <tr>
		                            <td class="align-middle">게임 이름</td>
		                            <td class="align-middle">
		                                <input type="text" name="gameName" id="gameName" class="gameInfo form-control" value="${game.gameName }" required style="display:inline; width:400px; height:38px;"/>
		                                &nbsp;&nbsp;
		                                <span class="badge"></span>
		                                <span></span>
		                            </td>
		                        </tr>
		                        <tr>
		                            <td class="align-middle">제조사</td>
		                            <td class="align-middle">
		                            	<input type="text" class="form-control" name="gameCompany" id="gameCompany" class="gameInfo" value="${game.gameCompany }" required style="display:inline; width:200px; "/>
	                            		&nbsp;&nbsp;
	                            		<span class="badge text-bg-info">필수입력 항목</span>
	                            	</td>
		                        </tr>
		                        <tr>
		                            <td class="align-middle">게임 장르</td>
		                            <td class="align-middle">
		                                <select name="gameGenre" class="gameInfo genre form-select" style="display:inline; width:200px; height:38px;">
		                                    <option class="none">-----</option>
		                                    <option <c:if test="${!empty genre0 && fn:contains(genre0, '카드')}">selected</c:if>>카드게임</option>
		                                    <option <c:if test="${!empty genre0 && fn:contains(genre0, '파티')}">selected</c:if>>파티게임</option>
		                                    <option <c:if test="${!empty genre0 && fn:contains(genre0, '블러핑')}">selected</c:if>>블러핑</option>
		                                    <option <c:if test="${!empty genre0 && fn:contains(genre0, '가족')}">selected</c:if>>가족게임</option>
		                                    <option <c:if test="${!empty genre0 && fn:contains(genre0, '어린이')}">selected</c:if>>어린이게임</option>
		                                    <option <c:if test="${!empty genre0 && fn:contains(genre0, '추상')}">selected</c:if>>추상게임</option>
		                                    <option <c:if test="${!empty genre0 && fn:contains(genre0, '전략')}">selected</c:if>>전략게임</option>
		                                </select>
		                                &nbsp;&nbsp;
		                                <select name="gameGenre" class="gameInfo genre form-select" style="display:inline; width:200px; height:38px;">
		                                    <option class="none">-----</option>
		                                    <option <c:if test="${!empty genre1 && fn:contains(genre1, '카드')}">selected</c:if>>카드게임</option>
		                                    <option <c:if test="${!empty genre1 && fn:contains(genre1, '파티')}">selected</c:if>>파티게임</option>
		                                    <option <c:if test="${!empty genre1 && fn:contains(genre1, '블러핑')}">selected</c:if>>블러핑</option>
		                                    <option <c:if test="${!empty genre1 && fn:contains(genre1, '가족')}">selected</c:if>>가족게임</option>
		                                    <option <c:if test="${!empty genre1 && fn:contains(genre1, '어린이')}">selected</c:if>>어린이게임</option>
		                                    <option <c:if test="${!empty genre1 && fn:contains(genre1, '추상')}">selected</c:if>>추상게임</option>
		                                    <option <c:if test="${!empty genre1 && fn:contains(genre1, '전략')}">selected</c:if>>전략게임</option>
		                                </select>
										&nbsp;&nbsp;
		                                <select name="gameGenre" class="gameInfo genre form-select" style="display:inline; width:200px; height:38px;">
		                                    <option class="none">-----</option>
		                                    <option <c:if test="${!empty genre2 && fn:contains(genre2, '카드')}">selected</c:if>>카드게임</option>
		                                    <option <c:if test="${!empty genre2 && fn:contains(genre2, '파티')}">selected</c:if>>파티게임</option>
		                                    <option <c:if test="${!empty genre2 && fn:contains(genre2, '블러핑')}">selected</c:if>>블러핑</option>
		                                    <option <c:if test="${!empty genre2 && fn:contains(genre2, '가족')}">selected</c:if>>가족게임</option>
		                                    <option <c:if test="${!empty genre2 && fn:contains(genre2, '어린이')}">selected</c:if>>어린이게임</option>
		                                    <option <c:if test="${!empty genre2 && fn:contains(genre2, '추상')}">selected</c:if>>추상게임</option>
		                                    <option <c:if test="${!empty genre2 && fn:contains(genre2, '전략')}">selected</c:if>>전략게임</option>
		                                </select>
		                                &nbsp;&nbsp;
		                                <span class="badge text-bg-info">최소 1개를 선택</span>
		                                <span></span>
		                            </td>
		                        </tr>
		                        <tr>
		                            <td class="align-middle">게임시간</td>
		                            <td class="align-middle">
		                                <input type="number" class="form-control" name="gamePlayTime" id="playTime" step="1" min="0" value="${game.gamePlayTime }" required style="display:inline; width:200px;"/>
		                            	&nbsp;&nbsp;
		                            	<span class="badge text-bg-info">숫자만 입력가능 | 필수 입력 항목</span>
		                            </td>
		                        </tr>
		                        <tr>
		                            <td class="align-middle">게임 난이도</td>
		                            <td class="align-middle">
		                                <input type="number" class="form-control" name="gameLevel" id="gameLevel" step="0.01" min="0.00" max="5.00" value="${game.gameLevel }" required style="display:inline; width:200px;"/>
		                            	&nbsp;&nbsp;
		                            	<span class="badge text-bg-info">숫자만 입력가능 | 필수 입력 항목</span>
		                            </td>
		                        </tr>
		                        
		                        <tr>
		                            <td class="align-middle">게임인원</td>
		                            <td class="align-middle">
		                                <label>2 <input type="radio" name="gamePeople" class="gameRadio" value="2" <c:if test="${game.gamePeople == 2 }">checked</c:if>/></label>&nbsp;
		                                <label>3 <input type="radio" name="gamePeople" class="gameRadio" value="3" <c:if test="${game.gamePeople == 3 }">checked</c:if>/></label>&nbsp;
		                                <label>4 <input type="radio" name="gamePeople" class="gameRadio" value="4" <c:if test="${game.gamePeople == 4 }">checked</c:if>/></label>&nbsp;
		                                <label>5 <input type="radio" name="gamePeople" class="gameRadio" value="5" <c:if test="${game.gamePeople == 5 }">checked</c:if>/></label>&nbsp;
		                                <label>6 <input type="radio" name="gamePeople" class="gameRadio" value="6" <c:if test="${game.gamePeople == 6 }">checked</c:if>/></label>
		                            	&nbsp;&nbsp;
		                            	<span class="badge text-bg-info">1개만 선택가능</span>
		                            </td>
		                        </tr>
		                        <tr>
		                            <td class="align-middle">게임이미지</td>
		                            <td class="align-middle">
		                            	<img src="${contextPath }/resources/uploadFiles/${game.gameImgRename}" width="120px" height="120px"/>
		                            	<!-- visibility :hidden -->
		                        		<input type="file" accept=".PNG, .JPG" name="upload" class="gameImage" id="gameImage" style="display:none;"/>
		                        		<button type="button" class="btn btn-outline-dark btn-sm deleteImg">삭제 OFF</button>
		                        		<input type="hidden" name="delAnswer"/>
		                        		<input type="hidden" name="delInfo" value="${game.gameImg }/${game.gameImgRename}"/>
		                        		<input type="hidden" name="gameNo" value="${game.gameNo }"/>
		                           	</td>
		                        </tr>
		                    </tbody>
		                </table>
                	</form>
                <div></div>
            </div>
            <div id="pageButton"> <!-- 버튼 공간 -->
            	<br/>
                <button id="submitBtn" class="btn btn-primary">수정하기</button>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <button id="cancleBtn" class="btn btn-primary">뒤로가기</button> 
                &nbsp;&nbsp;&nbsp;&nbsp;
                <button id="gameListBtn" class="btn btn-primary">게임목록</button>
            </div>

        </div>
        <div class="blank"><!-- 오른쪽 --></div>
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
			// 게임 이름 실시간 중복확인
			document.querySelector('#gameName').addEventListener('change', function() {
				const span = this.nextElementSibling;
				$.ajax({
					url:'${contextPath}/checkGameName.ad',
					data: {gameName : this.value},
					success: data => {
						if(data == 'success') {
							span.classList.remove('text-bg-danger');
							span.classList.add('text-bg-info');
							span.innerText = '사용 가능한 게임이름입니다.';
						} else if(data == 'fail') {
							span.classList.remove('text-bg-info');
							span.classList.add('text-bg-danger');
							span.innerText = '사용 불가능한 게임이름입니다.';
						}
					},
					error: data => alert('서비스 요청에 실패하였습니다.')
				})
			})
			
			
			
			document.querySelector('.deleteImg').addEventListener('click', function() {
				const img = this.previousElementSibling.previousElementSibling;
				const upload = this.previousElementSibling;
				const delAnswer = this.nextElementSibling;
				const delInfo = this.nextElementSibling.nextElementSibling;
				
				if(this.innerText.includes('OFF'))	{
					this.innerText = '삭제 ON';
					this.style.background = 'black';
					this.style.color = 'white';
					img.style.display = 'none';
					upload.style.display = 'inline';
					delAnswer.value = '삭제 ON';
				} else {
					this.innerText = '삭제 OFF';
					this.style.background = 'white';
					this.style.color = 'black';
					img.style.display = 'inline';
					upload.style.display = 'none';
					delAnswer.value = '삭제 OFF';
				}		
			})
			
			document.querySelector('#submitBtn').addEventListener('click', () => {
				// 장르, 인원 반드시 선택되어 있어야 함
				let genreFlag = false;
				const genreList = document.getElementsByClassName('genre');
				let radioFlag = false;
				const gameRadioList = document.querySelectorAll('.gameRadio');
				for(let gen of genreList) {
					if(!gen.value.includes('-')) genreFlag = true;
				}
				for(let rad of gameRadioList) {
					if(rad.checked == true) radioFlag = true;
				}
				
				const upload = document.querySelector('#gameImage');
				const delAnswer = document.querySelector('.deleteImg').innerText;
				
				
				if(genreFlag && radioFlag) {
					if(confirm('정말 수정하시겠습니까?')) {
						if(delAnswer.includes('ON') && upload.value != '') { // 삭제 ON 인 상태에서 새로운 첨부파일을 등록한 경우
							document.querySelector('#gameForm').submit();
						} else if(delAnswer.includes('OFF')) { // 삭제 OFF인 상태
							document.querySelector('#gameForm').submit();
						}
					}
				} else {
					alert('선택 항목을 확인해주세요!');
				}
			})
			
			document.querySelector('#cancleBtn').addEventListener('click', () => {
				history.back();
			})
			
			document.querySelector('#gameListBtn').addEventListener('click', () => {
				location.href='${contextPath}/gameList.ad';
			})
		}
	</script>
</body>
</html>