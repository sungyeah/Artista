<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Artista</title>
<link rel="stylesheet" href="../css/manager.css">
<link rel="stylesheet" href="../css/mypage.css">
</head>
<body>
<%@include file="../header.jsp"%>
    <div id="contents">
        <header class="account-header">
            <h2 class="account-header-title">작가 페이지</h2>
            <div class="account-header-description">고객님과 관련된 정보입니다.</div>
        </header>
        <section class="account-guide">
            <div class="account-guide-inner">
                <h3 class="account-guide-name">
                    홍성호님 반갑습니다.
                </h3>
                <a class="account-modify-btn" href="mypage/mypagemodify" onclick="gaClickAccount('account_modify');">
                    <p>작가 정보</p>
                </a>
            </div>
        </section>
        <nav class="manager-nav">
            <a class="manager-nav-btn current" href="${pageContext.request.contextPath}/artistpage/mywork">
                전체 작품
            </a>
            <a class="manager-nav-btn" href="${pageContext.request.contextPath}/artistpage/myproduct">
                판매 작품
            </a>
            <a class="manager-nav-btn" href="${pageContext.request.contextPath}/artistpage/myfunding">
                나의 펀딩
            </a>
            <a class="manager-nav-btn" style="background-color: black;color: white;" href="${pageContext.request.contextPath}/artistpage/myexhibition">
                나의 전시
            </a>
        </nav>
        
        <nav class="member-nav">
            <a class="member-delete-btn" href="${pageContext.request.contextPath}/artistpage/applyexhibition" style="width:120px;">
       		 	전시등록 신청
        	</a>
        </nav>
        
        <article class="member-body">
            <section class="member-list">
                <table class="member-table">
                    <thead>
                    <tr>
                        <th scope="col" class="artistNo">전시 번호</th>
                        <th scope="col" class="id">전시 제목</th>
                        <th scope="col" class="artistName">전시 시작일</th>
                        <th scope="col" class="artistType">전시 종료일</th>
                        <th scope="col" class="artistType">펀딩번호</th>
                        <th scope="col" class="artistType">결과</th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="col" class="artistNo">전시 번호</th>
                            <th scope="col" class="id">전시 제목</th>
                            <th scope="col" class="artistName">전시 시작일</th>
                            <th scope="col" class="artistType">전시 종료일</th>
                            <th scope="col" class="artistType">펀딩번호</th>
                            <th scope="col" class="artistType">결과</th>
                            <th><input type="checkbox" name="xxx"></th>
                        </tr>
                        <tr>
                            <th scope="col" class="artistNo">전시 번호</th>
                            <th scope="col" class="id">전시 제목</th>
                            <th scope="col" class="artistName">전시 시작일</th>
                            <th scope="col" class="artistType">전시 종료일</th>
                            <th scope="col" class="artistType">펀딩번호</th>
                            <th scope="col" class="artistType">결과</th>
                            <th><input type="checkbox" name="xxx"></th>
                        </tr>
                    </tbody>
                </table>
                <a class="member-delete-btn" href="/account/delete/">
                    내용 삭제
                </a>
            </section>
        </article>
        

    </div>
</body>
</html>