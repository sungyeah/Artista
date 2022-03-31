<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/fundingtmdetail.css">
<style>

</style>
<body style="overflow-x: hidden">
    <div id="contents">
        <header class="account-header">
            <h2 class="account-header-title">프로젝트 제목</h2>
        </header>
        <div class="image-box">
            <img class="image-thumb">
        </div>
        <div class="fundingdetail">
            <div id="name">펀딩 종료</div><br>
            <div id="amount">10,000,000 목표 금액</div><br>
            <div id="amount">7,350,000 남은 금액</div><br>
            <div id="amount">20명 서포터</div><br>
            <div id="promain">
                30%
                <progress id="pro" value="30" max="100"></progress>
            </div><br>
            <div class="amountdetail">
                <button class="Btn1">전시 정보 보기</button>
            </div>
        </div>
    </div>
    <div class="projcontent">
        프로젝트 내용 쓸 곳
    </div>
    <div class="artistIntro">
        <h2 class="artist">작가 소개</h2>
        <div class="artistContent">
            나는 졸리다 배고프다 놀고 싶다
        </div>
        <div class="artistContent">
            <button class="Btn2">작가 페이지 이동</button>
        </div>
    </div>
    <div>
        <button class="Btn3">목록</button>
    </div>
</body>
</html>