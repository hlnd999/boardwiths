<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
           
            <div id="content" class="d-block p-3 text-bg-light" style="width: 1100px">
               <form action="insertQuery.bo" method="POST" id="formQuery">
               <div id="content1">
               <b>문의사항 작성</b><br>
					<div class="row g-3 align-items-center">

						<div class="input-group mb-3">
						  <span class="input-group-text" id="inputGroup-sizing-default">문의사항 제목</span>
						  <input type="text" name="title" id="title" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
						</div>
					</div>
               </div>
               <hr>
               <div id="content2">
               	<div id="content2-1"  class="d-inline-block col-4" >
               		문의사유 선택
               		 <select id="inquiryC" name="queryReason" class="form-select">
               		 	<option value="구매관련문의">구매관련문의</option>
               		 	<option value="판매관련문의">판매관련문의</option>
               		 	<option value="매칭관련문의">매칭관련문의</option>
               		 	<option value="후기관련문의">후기관련문의</option>
               		 	<option value="공지관련문의">공지관련문의</option>
               		 	<option value="기타문의사항">기타문의사항</option>
               		</select>
               	</div>
               	
               <div id="content2-2" class="row mt-2" style="display: none;">
				    <label for="otherReason" class="col-md-3 col-form-label">기타문의 사유작성</label>
				    <div class="col-md-10">
				        <input  type="text" id="otherReason" name="otherReason" class="form-control" placeholder="기타문의 사유를 작성해주세요">
				    </div>
				</div>
               </div>
               <div id="content3">
               <hr>
               
			    <div class="mb-3">
						<label for="exampleFormControlTextarea1" class="form-label">문의글 작성</label>
						<textarea class="form-control" id="addText" rows="3" name="content"></textarea>
					</div>
			    <input id="querySubmit" class="btn btn-primary" type="submit" value="문의등록">
               </div>
               
               </form>
               <hr/>
           </div>
       </div>
       
        <!-- <div class="container-fluid"> -->
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

  
		<script>
    
		$(document).ready(function() {
		    // inquiryC 셀렉트 박스의 변경 사건을 감지합니다.
		    $('#inquiryC').change(function() {
		        // 선택된 옵션의 값을 가져옵니다.
		        var selectedValue = $(this).val();

		        // 만약 선택된 값이 '기타문의사항'이면 추가 입력 필드를 보이도록 설정합니다.
		        if (selectedValue === '기타문의사항') {
		            $('#content2-2').show();  // 보이기
		        } else {
		            $('#content2-2').hide();  // 숨기기
		        }
		    });

		    // 페이지 로드 시 초기 상태 설정
		    if ($('#inquiryC').val() !== '기타문의사항') {
		        $('#content2-2').hide();  // 기본적으로 숨기기
		    }

		    $('#formQuery').submit(function(event) {
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

		        // 사유 검사
		        var inquiryC = $('#inquiryC').val();
		        if (inquiryC === '' || inquiryC === null) {
		            $('#inquiryC').removeClass('is-valid').addClass('is-invalid');
		            isValid = false;
		        } else {
		            $('#inquiryC').removeClass('is-invalid').addClass('is-valid');
		        }

		        // 내용 입력 검사
		        var addText = $('#addText').val().trim();
		        if (addText === '') {
		            $('#addText').removeClass('is-valid').addClass('is-invalid');
		            isValid = false;
		        } else {
		            $('#addText').removeClass('is-invalid').addClass('is-valid');
		        }

		        // 만약 '기타문의사항'을 선택했을 때 추가 입력 필드의 값을 가져와 포함시킵니다.
		        if ($('#inquiryC').val() === '기타문의사항') {
		            var otherReason = $('#otherReason').val().trim(); 
		        }

		        if (!isValid) {
		            event.preventDefault(); // 제출 중단
		            alert('모든 필수 입력 요소에 값을 입력해주세요.');
		        } else {
		            // 유효성 검사를 통과하면 폼 제출
		            // document.getElementById('formQuery').submit(); // 이 줄은 삭제해야 합니다.
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
		    $('#inquiryC').change(function() {
		        var inquiryC = $(this).val();
		        if (inquiryC !== '' && inquiryC !== null) {
		            $(this).removeClass('is-invalid').addClass('is-valid');
		        } else {
		            $(this).removeClass('is-valid').addClass('is-invalid');
		        }
		    });
		});
		
</script>
    
</body>
</html>