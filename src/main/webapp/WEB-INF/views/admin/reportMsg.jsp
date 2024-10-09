<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>신고 메시지 확인 페이지</title>
	<link href="${contextPath }/resources/css/reportMsg.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<div id="header">나 헤더</div>
    <div id="mid">
        <div class="blank">왼쪽</div>
        <nav>
            <jsp:include page="adminMenu.jsp"/>     
        </nav>
        <div id="adminContainer">
            <div id="admin_title">
                <div>신고메시지 확인</div>
            </div>
            <div id="admin_search"> <!-- 검색바 넣을 자리-->
                <div>공백</div>
                <div></div>
                <div></div>
                <div>공백</div>
            </div>
            <div id="admin_submit">
                <div></div>
                <div></div>
                <div></div>
            </div>
            <div id="admin_list"> <!-- ul태그의 li태그 안에 span 때려박기-->
                <div></div>
                <ul class="summary_info">
                <!-- 컨트롤러의 reportMsg에 의해 report에 대한 데이터를 전달받는다.(속성명을 report로 가정) -->
                    <li>
                        <div>신고자</div>
                        <div><input type="text" name="reportSender" id="reportSender" readonly value="${report.reportSender }"/></div>
                    </li>
                    
                    <li>
                        <div>신고일자</div>
                        <div><input type="text" name="reportDate" id="reportDate" readonly value="${report.reportDate }"/></div>
                    </li>

                    <li>
                        <div>신고대상</div>
                        <div>
                            <input type="text" name="reportReceiver" id="reportReceiver" readonly value="${report.reportReceiver }"/>
                            <button id="info">정보보기</button>
                        </div>
                    </li>

                    <li>
                        <div>사유</div>
                        <div>
                            <textarea name="reportMsg" id="reportMsg" readonly>${report.reportMSG }</textarea>
                        </div>
                    </li>
                </ul>
                <div></div>
            </div>
            <div id="pageButton"> <!-- 페이지 버튼 공간 -->
                <button onclick="location.href='${contextPath}/home.do'">메인으로</button>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <button onclick="location.href='${contextPath}/userList.ad'">회원목록으로</button>
            </div>

        </div>
        <div class="blank">오른쪽</div>
    </div>
    <footer>나 푸터</footer>
</body>
</html>