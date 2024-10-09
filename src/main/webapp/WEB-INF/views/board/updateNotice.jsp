<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>td:hover{cursor: pointer;}</style>
    <link rel="stylesheet" href="${ contextPath }/resources/css/boardList.css">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
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
            
            <div id="content" class="d-block p-3 text-bg-light" style="width: 1100px">
            <form action="updateNoticeBoard.bo" method="POST" enctype="multipart/form-data" id="boardForm">
            <input type="hidden" value="${ b.boardNo }" name="boardNo"/>
            <input type="hidden" value="${ b.category }" name="category"/>
            <input type="hidden" value="${ page }" name="page"/>
                <div id="content1">
                	<b>공지사항 작성</b><br>
					<div class="row g-3 align-items-center">

						<div class="input-group mb-3">
						  <span class="input-group-text" id="inputGroup-sizing-default">공지사항 제목</span>
						  <input type="text" name="title" id="title" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${ b.title }">
						</div>
					</div>
                </div>
                <hr>
                <div id="content2">
	
                	<div class="mb-3">
					  <label for="formFile" class="form-label">파일 첨부</label>
					  <input class="form-control" type="file" id="formFile" name="file">
					</div>
            	
                </div>
                <div id="content3">
                <hr>
                
                
   
                	
				   <div class="mb-3">
						<label for="exampleFormControlTextarea1" class="form-label">공지글 작성</label>
						<textarea class="form-control" id="addText" rows="3" name="content">${b.content}</textarea>
					</div>
				    
				    <button type="submit" class="btn btn-primary">공지글 수정</button>
				    
                </div>
                </form>
                <hr>
            </div>
        </div>
        
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
            
            if (!isValid) {
                event.preventDefault(); // 제출 중단
                alert('모든필수입력 요소에 입력을 해주세요.');
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

      
    });
    </script>
    
</body>
</html>