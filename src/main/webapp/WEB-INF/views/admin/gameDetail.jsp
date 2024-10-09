<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게임 조회 페이지</title>
	<link href="${contextPath }/resources/css/gameDetail.css" rel="stylesheet" type="text/css"/>
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet">
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
                	<i class="fa fa-quote-left text-warning" aria-hidden="true"></i>
                    <h3 class="bg-warning" style="display:inline;">게임정보 상세조회</h3>
                    <i class="fa fa-quote-right text-warning" aria-hidden="true"></i>
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
               		<form id="gameForm" action="" method="post" enctype="multipart/form-data">
		                <table class="table align-middle" style="height:100%;">
		                    <tbody>
		                        <tr>
		                            <td class="align-middle">게임 이름</td>
		                            <td class="align-middle">
		                                <input type="text" class="form-control" name="name" class="gameInfo" value="${game.gameName }" disabled style="width:400px; height:38px; display:inline;"/>
		                                &nbsp;&nbsp;&nbsp;
		                                <span></span>
		                            </td>
		                        </tr>
		                        <tr>
		                            <td class="align-middle">제조사</td>
		                            <td class="align-middle">
		                            	<input type="text" class="form-control" name="company" id="gameCompany" class="gameInfo" value="${game.gameCompany }" disabled style="width:400px; height:38px; display:inline;"/>
	                            	</td>
		                        </tr>
		                        <tr>
		                            <td class="align-middle">게임 장르</td>
		                            <td class="align-middle">
		                                <select name="genre" class="gameInfo genre form-select" disabled style="width:200px; height:38px;">
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
		                                <select name="genre" class="gameInfo genre form-select" disabled style="width:200px; height:38px;">
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
		                                <select name="genre" class="gameInfo genre form-select" disabled style="width:200px; height:38px;">
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
		                                <span></span>
		                            </td>
		                        </tr>
		                        <tr>
		                            <td class="align-middle">게임시간</td>
		                            <td class="align-middle">
		                                <input type="number" class="form-control" name="playTime" id="playTime" step="1" min="0" value="${game.gamePlayTime }" disabled style="display:inline; width:200px; height:38px;"/>
		                            </td>
		                        </tr>
		                        <tr>
		                            <td class="align-middle">게임 난이도</td>
		                            <td class="align-middle">
		                                <input type="number" class="form-control" name="level" id="gameLevel" step="0.01" min="0.00" max="5.00" value="${game.gameLevel }" disabled style="display:inline; width:200px; height:38px;"/>
		                            </td>
		                        </tr>
		                        
		                        <tr>
		                            <td class="align-middle">게임인원</td>
		                            <td class="align-middle">
		                                <label>2 <input type="radio" name="people" class="gameRadio" value="2" disabled <c:if test="${game.gamePeople == 2 }">checked</c:if>/></label>&nbsp;
		                                <label>3 <input type="radio" name="people" class="gameRadio" value="3" disabled <c:if test="${game.gamePeople == 3 }">checked</c:if>/></label>&nbsp;
		                                <label>4 <input type="radio" name="people" class="gameRadio" value="4" disabled <c:if test="${game.gamePeople == 4 }">checked</c:if>/></label>&nbsp;
		                                <label>5 <input type="radio" name="people" class="gameRadio" value="5" disabled <c:if test="${game.gamePeople == 5 }">checked</c:if>/></label>&nbsp;
		                                <label>6 <input type="radio" name="people" class="gameRadio" value="6" disabled <c:if test="${game.gamePeople == 6 }">checked</c:if>/></label>
		                            </td>
		                        </tr>
		                        <tr>
		                            <td class="align-middle">게임이미지</td>
		                            <td class="align-middle">
		                            	<img src="${contextPath }/resources/uploadFiles/${game.gameImgRename}" width="120px" height="120px"/>
		                           	</td>
		                        </tr>
		                    </tbody>
		                </table>
                	</form>
                <div></div>
            </div>
            <div id="pageButton"> <!-- 버튼 공간 -->
                <button id="updateBtn" class="btn btn-primary">수정하기</button>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <button id="deleteBtn" class="btn btn-danger">삭제하기</button> <!-- JS의 전역변수에 저장된 데이터를 전송한다 -->
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
			// 수정하기
			document.querySelector('#updateBtn').addEventListener('click', () => {
				location.href='${contextPath}/gameEditForm.ad?gameNo=' + ${game.gameNo};
			})
			
			// 삭제하기
			document.querySelector('#deleteBtn').addEventListener('click', () => {
				const gameNoArr = ['${game.gameNo}'];
				const gameImgArr = ['${game.gameImg}'];
				if(confirm('정말 삭제하시겠습니까?')) {
					$.ajax({ //동기처리 => async: false
						url: '${contextPath}/deleteGame.ad',
						type: 'POST',
						data: {gameNoArr: gameNoArr, gameImgArr: gameImgArr},
						success: data => {
							if(data == 'success') {
								location.href='${contextPath}/gameList.ad';
							}
						}
					})
				}
			})
			
			document.querySelector('#gameListBtn').addEventListener('click', () => {
				location.href='${contextPath}/gameList.ad';
			})
		}
	</script>
</body>
</html>