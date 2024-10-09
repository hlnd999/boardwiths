<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>td:hover{cursor: pointer;}</style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<jsp:include page="../common/navbar.jsp"/>
</head>
<body>
<div class="container d-flex m-auto" style="width: 1440px;">
		<div class="p-3 text-bg-dark text-center" style="width: 240px;">
			<span class="d-block fs-4">
			Boardwiths
			</span>
			<hr>
			<ul class="nav nav-pills flex-column mb-auto">
				<li class="nav-item">
					<a href="list.bo?category=1" class="nav-link text-white w-100 mb-1">공지사항</a>
				</li>
				<hr>
				
				<li>
					<a href="list.bo?category=2,3" class="nav-link text-white w-100 mb-1">구매/판매 전체보기</a>
					<ul class="nav flex-column ms-3">
						<li>
							<a href="list.bo?category=2" class="nav-link text-white w-100 mb-1">- 구매게시판</a>
						</li>
						<li>
							<a href="list.bo?category=3" class="nav-link text-white w-100 mb-1">- 판매게시판</a>
						</li>
					</ul>
				</li>
			
				<li>
					<a href="list.bo?category=4,5" class="nav-link text-white w-100 mb-1">매칭/후기 전체보기</a>
					<ul class="nav flex-column ms-3">
						<li>
							<a href="list.bo?category=4" class="nav-link text-white w-100 mb-1">- 매칭게시판</a>
						</li>
						<li>
							<a href="list.bo?category=5" class="nav-link text-white w-100 mb-1">- 후기게시판</a>
						</li>
					</ul>
				</li>
				
				<hr>
				<li>
					<a href="list.bo?category=6" class="nav-link text-white w-100 mb-1">문의게시판</a>
				</li>
			</ul>
	        <hr>
	    </div>     
       
	    	
		<div class="container d-block p-3 text-bg-light" style="width: 1100px">
			<div>
				<b>구매/판매 글작성</b><br>
			<div class="row g-3 align-items-center">
				<!-- 보드게임 검색창 -->
				<div class="input-group mb-3">
					<span class="input-group-text" id="inputGroup-sizing-default">보드게임 검색</span>
					<input type="text" name="gameName" id="gameName" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
		  			<button class="btn btn-primary" id="searchBtn">검색하기</button>
			  	</div>
			</div>
			
			<hr>			
        </div>
        <!-- 게임 정보창 -->
			<div>
		<div class="d-inline-block col-4">
		<!-- 게임이미지 -->
		<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>
			<img id="gameImage"></img>
			<br/>
		</div>
			<div id="content2-2" class="d-inline-block col-7 p-3 mb-2 bg-secondary text-white">
				<div id="gameInfo">
				         게임정보<br><hr>
				         게임이름 : <span id="gameNameSpan"></span><br/>
				         제조사 : <span id="gameCompanySpan"></span><br/>
				         게임장르 : <span id="gameGenreSpan"></span><br/>
				         게임시간 : <span id="gamePlayTimeSpan"></span>분<br/>
				         게임난이도 : <span id="gameLevelSpan"></span><br/>
				         게임인원 : <span id="gamePeopleSpan"></span>명<br/>
				</div>
			</div>
			</div>
		
		<!-- 가격 상태 입력창 -->
        <hr>
        <form action="insertBSBoard.bo" method="POST" enctype="multipart/form-data" id="boardForm">
        	<input type="hidden" name="gameNo" id="gameNo"/>
        	<div class="input-group input-group-sm mb-3">
	        	<span class="input-group-text" id="inputGroup-sizing-sm">가격</span>
	        	<input class="form-control form-control-sm" style="width: 200px" name="price" type="text" placeholder="가격을 입력해주세요." id="price">
			</div>
			<label>상태 : </label>
			<div class="d-inline-block dropdown">
				<select name="status" class="form-select" id="BoardStatus"> 
					<option value="A">상</option>
					<option value="B">중</option>
					<option value="C">하</option>
				</select>
			</div>
			<hr>
		
			<!-- 제목 입력 -->
			<div class="input-group input-group-sm mb-3">
				<span class="input-group-text" id="inputGroup-sizing-sm">글제목</span>
				<input name="title" type="text" class="form-control" id="title">
			</div>
			<!-- 카테고리 선택 -->      	
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="radio" name="category" id="buyRadio" value="2">
				<label class="form-check-label" for="inlineRadio1">구매글 작성</label>
			</div>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="radio" name="category" id="sellRadio" value="3">
				<label class="form-check-label" for="inlineRadio2">판매글 작성</label>
			</div>
			<!-- 내용 작성 -->
			<div class="mb-3">
				<textarea name="content" class="form-control" id="addText" rows="3"></textarea>
			</div>
			<!-- 사진 첨부 -->
			<div class="mb-3">
				<label for="formFile" class="form-label">사진첨부</label>
				<input class="form-control" type="file" id="file" name="file">
			</div>
			<button class="btn btn-primary">글등록</button>
			<hr/>
		</form>
       </div>
    </div>   
        <!-- 풋터 -->
	    <div class="container-fluid">
	        <footer class="py-3 my-4">
	            <ul class="nav justify-content-center border-bottom pb-3 mb-3">
	                <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Home</a></li>
	                <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Features</a></li>
	                <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Pricing</a></li>
	                <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">FAQs</a></li>
	                <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">About</a></li>
	            </ul>
	            <p class="text-center text-body-secondary">© 2024 Company, Inc</p>
	        </footer>
	    </div>
    <script>
    
    $(document).ready(function() {
        $('#searchBtn').click(function() {
            var gameName = $('#gameName').val();

            $.ajax({
                type: 'POST', // POST 요청으로 변경
                url: '${pageContext.request.contextPath}/selectGameList.bo',
                data: { gameName: gameName },
                dataType: 'json', // 응답을 JSON 형식으로 기대
                success: function(response) {
                    console.log(response); // 응답 확인
                    if (response.length > 0) {
                        var game = response[0]; // 첫 번째 게임 정보 사용
           				// 이미지 불러오기?
                        var imagePath = '${pageContext.request.contextPath}/resources/uploadFiles/' + game.gameImgRename;
                         $('#gameImage').attr('src', imagePath);
                         $('#gameImage').attr('alt', '게임 이미지');
                         $('#gameImage').attr('width', '300px');

                        $('#gameImage').text(game.gameImg);
                        $('#gameNameSpan').text(game.gameName);
                        $('#gameCompanySpan').text(game.gameCompany);
                        $('#gameGenreSpan').text(game.gameGenre);
                        $('#gamePlayTimeSpan').text(game.gamePlayTime);
                        $('#gameLevelSpan').text(game.gameLevel);
                        $('#gamePeopleSpan').text(game.gamePeople);
                       
                       	document.getElementById('gameNo').value= game.gameNo;
                       console.log(gameNo);
                    } else {
                        alert('등록 되어있지 않은 게임입니다. 문의 게시판에 문의 해주세요');
                    }
                },
                error: function(xhr, status, error) {
                    console.error('AJAX 오류 발생:', error);
                    alert('게임 정보를 가져오는 중 오류가 발생했거나 등록되어있지 않은 게임입니다.');
                }
            });
        });
    });
    
    $(document).ready(function() {
        $('#boardForm').submit(function(event) {
            // 유효성 검사를 위한 변수
            var isValid = true;

            // 제목 입력 검사
            var title = $('#title').val().trim();
            if (title === '') {
                $('#title').removeClass('is-valid').addClass('is-invalid');
                isValid = false;
            } else {
                $('#title').removeClass('is-invalid').addClass('is-valid');
            }

            // 카테고리 선택 검사
            var categorySelected = false;
            if ($('#buyRadio').is(':checked') || $('#sellRadio').is(':checked')) {
                categorySelected = true;
            }
            if (!categorySelected) {
                $('#buyRadio, #sellRadio').removeClass('is-valid').addClass('is-invalid');
                isValid = false;
            } else {
                $('#buyRadio, #sellRadio').removeClass('is-invalid').addClass('is-valid');
            }

            // 내용 입력 검사
            var content = $('#addText').val().trim();
            if (content === '') {
                $('#addText').removeClass('is-valid').addClass('is-invalid');
                isValid = false;
            } else {
                $('#addText').removeClass('is-invalid').addClass('is-valid');
            }

            // 상태 선택 검사
            var status = $('#BoardStatus').val();
            if (status === '') {
                $('#BoardStatus').removeClass('is-valid').addClass('is-invalid');
                isValid = false;
            } else {
                $('#BoardStatus').removeClass('is-invalid').addClass('is-valid');
            }

            // 가격 입력 검사
            var price = $('#price').val().trim();
            var numericRegex = /^[0-9]+(\.[0-9]+)?$/;
            if (price === '' || !numericRegex.test(price)) {
                $('#price').removeClass('is-valid').addClass('is-invalid');
                isValid = false;
                alert('가격에는 숫자만 입력 가능합니다');
            } else {
                $('#price').removeClass('is-invalid').addClass('is-valid');
            }
            

            if (!isValid) {
                event.preventDefault(); // 제출 중단
                alert('모든필수입력 요소에 입력을 해주세요.');
            }
        });

        // 입력 필드에 포커스가 돌아왔을 때, 유효성 검사 후 초록색으로 테두리 변경
        $('#title, #addText, #price').focusout(function() {
            var value = $(this).val().trim();
            if (value !== '') {
                $(this).removeClass('is-invalid').addClass('is-valid');
            } else {
                $(this).removeClass('is-valid').addClass('is-invalid');
            }
        });

        // 라디오 버튼 선택 시, 유효성 검사 후 초록색으로 테두리 변경
        $('#buyRadio, #sellRadio').change(function() {
            var isChecked = $('#buyRadio').is(':checked') || $('#sellRadio').is(':checked');
            if (isChecked) {
                $('#buyRadio, #sellRadio').removeClass('is-invalid').addClass('is-valid');
            } else {
                $('#buyRadio, #sellRadio').removeClass('is-valid').addClass('is-invalid');
            }
        });

        // 셀렉트 박스 선택 시, 유효성 검사 후 초록색으로 테두리 변경
        $('#BoardStatus').change(function() {
            var status = $(this).val();
            if (status !== '') {
                $(this).removeClass('is-invalid').addClass('is-valid');
            } else {
                $(this).removeClass('is-valid').addClass('is-invalid');
            }
        });
    });
	</script>
</body>
</html>