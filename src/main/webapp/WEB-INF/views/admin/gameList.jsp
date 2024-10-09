<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게임 목록 페이지 입니다.</title>
	<link href="${contextPath }/resources/css/gameList.css" rel="stylesheet" type="text/css"/>
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet"> -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
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
                    <h3 class="bg-warning" style="display:inline;">게임 목록</h3>
                    <i class="fa fa-quote-right text-warning" aria-hidden="true"></i>
                </div>
            </div>
            <div id="admin_search"> <!-- 검색바 넣을 자리-->
                <div><!-- 공백 --></div>
                <form autocomplete="off" action="${contextPath }/searchGame.ad">
                    <select name="searchOption" style="width:100px; height:38px;">
                        <option value="gameName" <c:if test="${map.searchOption == 'gameName' }">selected</c:if>>게임명</option>
                        <option value="gameCompany" <c:if test="${map.searchOption == 'gameCompany' }">selected</c:if>>제조사</option>
                        <option value="gameGenre" <c:if test="${map.searchOption == 'gameGenre' }">selected</c:if>>게임장르</option>
                    </select>
                    <input type="text" name="searchContent" class="form-control" style="display:inline; width:300px; height:38px;" value='<c:if test="${map.searchContent != null }">${map.searchContent }</c:if>'/>
                    &nbsp;&nbsp;
                    <button id="search_btn" class="btn btn-primary" style="width:100px; height:38px;">조회하기</button>
                    &nbsp;&nbsp;
                    <button id="totalBtn" class="btn btn-primary" onclick="location.href='${contextPath}/gameList.ad'">전체보기</button>
                </form>
                <div><!-- 공백 --></div>
            </div>
            <div id="admin_submit">
                <div></div>
                <div>
                	<button id="insert_btn" class="btn btn-primary" onclick="location.href='${contextPath}/insertGameForm.ad'" style="width:100px; height:38px;">추가하기</button>
                    &nbsp;&nbsp;
                    <button id="del_btn" class="btn btn-danger" style="width: 100px;">삭제하기</button>
                </div>
                <div></div>
            </div>
            <div id="admin_list"> 
                <div></div>
                <table class="table table-hover align-middle">
                	<thead>
	                    <tr>
	                        <th class="align-middle">선택</th>
	                        <th class="align-middle">게임명</th>
	                        <th class="align-middle">장르</th>
	                        <th class="align-middle">거래횟수</th>
	                        <th class="align-middle">모임횟수</th>
	                    </tr>
                    <thead>
                    <tbody class="gameList_tbody">
                    	<c:forEach items="${list }" var="l">
                    		<input type="hidden" name="gameImg" value="${l.gameImg }"/>
                    		<input type="hidden" name="gameNo" value="${l.gameNo }"/>
		                    <tr>
		                        <td class="align-middle"><input type="checkbox" class="checkbox"/></td>
		                        <td class="align-middle">${l.gameName }</td>
		                        <td class="align-middle">${l.gameGenre }</td>
		                        <td class="align-middle">${l.marketCount }</td>
		                        <td class="align-middle">${l.matchingCount }</td>
		                    </tr>
	                    </c:forEach>
	                    
	                    <c:if test="${list.size() < pi.boardLimit }">
	                    	<c:forEach begin="${list.size() + 1 }" end="${pi.boardLimit }">
						        <tr>
						        	<td class="align-middle"><input type="checkbox" class="checkbox" disabled/></td>
			                        <td class="align-middle">-</td>
			                        <td class="align-middle">-</td>
			                        <td class="align-middle">-</td>
			                        <td class="align-middle">-</td>
						        </tr>            	
	                    	</c:forEach>
	                    </c:if>
                    </tbody>
                </table>
                <div></div>
            </div>
            <div id="pageButton"> <!-- 페이지 버튼 공간 -->
                <div></div>
                <div class="pt-3">
                    <ul class="pagination justify-content-end mb-0">
                    	<c:if test="${pi.currentPage <= 1 }">
	                        <li class="page-item disabled">
	                            <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
	                        </li>
                    	</c:if>
                    
                    	<c:if test="${pi.currentPage > 1 }">
                    		<c:url var="goBack" value="${loc }">
                    			<c:param name="page" value="${pi.currentPage - 1 }"/>
                    			<c:if test="${!empty map }">
                    				<c:param name="searchOption" value="${map.searchOption }"/>
                    				<c:param name="searchContent" value="${map.searchContent }"/>
                    			</c:if>
                    		</c:url>
	                        <li class="page-item">
	                            <a class="page-link" href="${goBack }" tabindex="-1" aria-disabled="true">Previous</a>
	                        </li>
                    	</c:if>
                    	
                    	<c:forEach begin="${pi.startPage }" end="${pi.endPage }" var="p">
	                        <c:url var="goNum" value="${loc }">
	                        	<c:param name="page" value="${p }"/>
	                        	<c:if test="${!empty map }">
                    				<c:param name="searchOption" value="${map.searchOption }"/>
                    				<c:param name="searchContent" value="${map.searchContent }"/>
                    			</c:if>
	                        </c:url>
	                        <c:if test="${pi.currentPage == p }">
		                        <li class="page-item active"><a class="page-link" href="${goNum }">${p }</a></li>
	                        </c:if>
                    		<c:if test="${pi.currentPage != p }">
                    			<li class="page-item"><a class="page-link" href="${goNum }">${p }</a></li>
                    		</c:if>
                    	</c:forEach>
                    	
                        <c:if test="${pi.currentPage >= pi.maxPage }">
	                        <li class="page-item disabled">
	                            <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Next</a>
	                        </li>
                    	</c:if>
                        <c:if test="${pi.currentPage < pi.maxPage }">
	                   		<c:url var="goNext" value="${loc }">
	                   			<c:param name="page" value="${pi.currentPage + 1 }"/>
	                   			<c:if test="${!empty map }">
                    				<c:param name="searchOption" value="${map.searchOption }"/>
                    				<c:param name="searchContent" value="${map.searchContent }"/>
                    			</c:if>
	                   		</c:url>
	                        <li class="page-item">
	                            <a class="page-link" href="${goNext }" tabindex="-1" aria-disabled="true">Next</a>
	                        </li>
                    	</c:if>
                    </ul>
                </div>
                <div></div>
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

    <!-- <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script> -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		window.onload = () => {
			const delBtn = document.querySelector('#del_btn');
			const checkBoxList = document.querySelectorAll('.checkbox'); 
			const gameNoArr = [];
			const gameImgArr = [];
			
			
			delBtn.addEventListener('click', () => {
				for(const checkBox of checkBoxList) {
					if(checkBox.checked) {
						const gameNo = checkBox.parentElement.parentElement.previousElementSibling.value;
						gameNoArr.push(gameNo);
						const gameImg = checkBox.parentElement.parentElement.previousElementSibling.previousElementSibling.value;
						gameImgArr.push(gameImg);
					} 
				}
				
				// 삭제가 성공했다면 게임목록을 재출력하도록 요청함으로서 삭제 결과가 곧바로 반영될 수 있게 함
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
				} else {
					for(const checkBox of checkBoxList) {
						checkBox.checked = false;
					}
				}
			})
			
			const tbody = document.getElementsByClassName('gameList_tbody')[0];
			const trs = tbody.querySelectorAll('tr');
			
			for(let i = 0; i < trs.length; i++) {
				if(trs[i].children[0].children[0].disabled == false) {
					for(let j = 1; j < 5; j++) {
						trs[i].children[j].addEventListener('click', function() {
							const gameNo = this.parentElement.previousElementSibling.value;
							location.href='${contextPath}/gameDetail.ad?gameNo='+gameNo;
						})
					}
				}
			}
		}
	</script>
</body>
</html>