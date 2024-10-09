<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        td:hover {
            cursor: pointer;
        }
    </style>
    <link rel="stylesheet" href="${contextPath}/resources/css/boardList.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <jsp:include page="../common/navbar.jsp"/>
    
</head>
<body>
    
    <!-- 헤더 -->
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
            
        <div id="content" class="d-block p-3 text-bg-light" style="width: 1100px">
            <div id="content1">
                <b>매칭글 작성</b><br>   
                
                <div class="row g-3 align-items-center">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="inputGroup-sizing-default">보드게임 검색</span>
                        <input type="text" name="gameName" id="gameName" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                    </div>
                    <button class="btn btn-primary" id="searchBtn">검색하기</button>
                </div>
                <hr>   
            </div>
            <div id="content2">
                <form action="updateMatchingBoard.bo" method="POST" enctype="multipart/form-data" id="boardForm">
                	
		        	<input type="hidden" value="${ b.boardNo }" name="boardNo"/>
		        	<input type="hidden" value="${ b.category }" name="category"/>
					<input type="hidden" value="${ page }" name="page"/>
					<input type="hidden" name="gameNo" id="gameNo"/>
					<input type="hidden" value="${ boardMat.matchingNo }" name="matchingNo"/>
     				<input type="hidden" value="${ boardMat.refBoardNo }" name="refBoardNo"/>
     				
                    <div class="d-inline-block col-4">
                        <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
                        <img id="gameImage"></img>
                        <br/>
                    </div>
                    
                    <div id="content2-2" class="d-inline-block col-7 p-3 mb-2 bg-secondary text-white">
                        <div class="item">
                            
                            게임이름 : <span id="gameNameSpan">${g.gameName}</span><br/>
                        </div>
                       <!--  <div> -->
                            <label>모집인원 :&nbsp; </label>
                            <div class="d-inline-block dropdown">
                            <select name="maxMember" id="maxMember" class="form-select">
                                <option value="2">2명</option>
                                <option value="3">3명</option>
                                <option value="4">4명</option>
                                <option value="5">5명</option>
                                <option value="6">6명</option>
                                <option value="7">7명</option>
                                <option value="8">8명</option>
                            </select>
                            </div>
                       <!--  </div> -->
                        <div class="item">
                            <label>시/도 선택 :&nbsp; </label>
                            <div class="d-inline-block dropdown">
                            <select name="place" id="place" class="form-select">
                                <option value="서울">서울특별시</option>
                                <option value="부산">부산광역시</option>
                                <option value="대구">대구광역시</option>
                                <option value="인천">인천광역시</option>
                                <option value="광주">광주광역시</option>
                                <option value="대전">대전광역시</option>
                                <option value="울산">울산광역시</option>
                                <option value="세종">세종특별자치시</option>
                                <option value="경기도">경기도</option>
                                <option value="강원도">강원도</option>
                                <option value="충청북도">충청북도</option>
                                <option value="충청남도">충청남도</option>
                                <option value="전라북도">전라북도</option>
                                <option value="전라남도">전라남도</option>
                                <option value="경상북도">경상북도</option>
                                <option value="경상남도">경상남도</option>
                                <option value="제주">제주특별자치도</option>
                            </select>
                            </div>
                            <br>
                            
                            
                            <div class="input-group input-group-sm mb-3">
								<span class="input-group-text" id="inputGroup-sizing-sm">상세주소</span>
								<input name="pAddress" type="text" class="form-control" value="${address2}">
							</div>
			
			
                        </div>
                        <div class="item">
                            일정 :&nbsp; <input type="date" id="makeDate" name="makeDate"  value="${boardMat.makeDate}"/>
                        </div>
                    </div>
                    
                    <hr/>
                    <div class="input-group input-group-sm mb-3">
                        <span class="input-group-text" id="inputGroup-sizing-sm"> 글제목 </span>
                        <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" id="title" name="title" value="${ b.title }">
                    </div>              
                    <br>
                    <div class="mb-3">
                        <label for="exampleFormControlTextarea1" class="form-label">매칭글 작성</label>
                        <textarea class="form-control" rows="3" id="addText" name="content">${b.content}</textarea>
                    </div>
                    <div class="mb-3">
                        <label for="formFile" class="form-label">사진첨부</label>
                        <input class="form-control" type="file" id="file" name="file">
                    </div>
                    
                    <input class="btn btn-primary" type="submit" id="matchingSubmit" value="매칭글 수정">
                </form> 
            </div>  
            <hr>
            <div id="content3">
                <br>
            </div> 

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

            // 내용 입력 검사
            var content = $('#addText').val().trim();
            if (content === '') {
                $('#addText').removeClass('is-valid').addClass('is-invalid');
                isValid = false;
            } else {
                $('#addText').removeClass('is-invalid').addClass('is-valid');
            }

            // 모집인원 검사
            var maxMember = $('#maxMember').val();
            if (maxMember === '') {
                $('#maxMember').removeClass('is-valid').addClass('is-invalid');
                isValid = false;
            } else {
                $('#maxMember').removeClass('is-invalid').addClass('is-valid');
            }
            
            // 시/도 검사
            var maxMember = $('#place').val();
            if (place === '') {
                $('#place').removeClass('is-valid').addClass('is-invalid');
                isValid = false;
            } else {
                $('#place').removeClass('is-invalid').addClass('is-valid');
            }


            if (!isValid) {
                event.preventDefault(); // 폼 제출 중단
                alert('모든 필수 입력 항목을 입력해주세요.');
            }
        });

        // 입력 필드에 포커스가 돌아왔을 때, 유효성 검사 후 초록색으로 테두리 변경
        $('#title, #addText').focusout(function() {
            var value = $(this).val().trim();
            if (value !== '') {
                $(this).removeClass('is-invalid').addClass('is-valid');
            } else {
                $(this).removeClass('is-valid').addClass('is-invalid');
            }
        });

        // 셀렉트 박스 선택 시, 유효성 검사 후 초록색으로 테두리 변경
        $('#maxMember').change(function() {
            var maxMember = $(this).val();
            if (maxMember !== '') {
                $(this).removeClass('is-invalid').addClass('is-valid');
            } else {
                $(this).removeClass('is-valid').addClass('is-invalid');
            }
        });
        
        $('#place').change(function() {
            var place = $(this).val();
            if (place !== '') {
                $(this).removeClass('is-invalid').addClass('is-valid');
            } else {
                $(this).removeClass('is-valid').addClass('is-invalid');
            }
        });
        
    });
    //작성한 주소 드랍다운에서 선택되게 하는 스크립트
    var address1 = '${address1}';
	    
    var dropdown = document.getElementById("place");
    for (var i = 0; i < selectElement.options.length; i++) {
        if (dropdown.options[i].value === address1) {
        	dropdown.options[i].selected = true;
            break;
        }
    }
    </script>
    
</body>
</html>