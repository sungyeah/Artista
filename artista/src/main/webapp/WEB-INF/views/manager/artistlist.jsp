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
</head>
<body>
    <div class="contents">
        <header class="manager-header">
            <h2 class="manager-header-title">관리자 페이지</h2>
        </header>
        <section class="manager-guide">
            <div class="manager-guide-inner">
                <h3 class="manager-guide-name">
                    관리자님 반갑습니다.
                </h3>
            </div>
        </section>
        <nav class="manager-nav">
            <a class="manager-nav-btn current"  href="${pageContext.request.contextPath}/manager/paymentlist">
                작품 관리
            </a>
            <a class="manager-nav-btn" href="${pageContext.request.contextPath}/manager/fundinglist">
                펀딩 관리
            </a>
            <a class="manager-nav-btn" href="${pageContext.request.contextPath}/manager/exhibitionlist">
                전시 관리
            </a>
            <a class="manager-nav-btn" href="${pageContext.request.contextPath}/manager/memberlist">
                회원 관리
            </a>
        </nav>

        <nav class="member-nav">
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/manager/memberlist">
                일반회원
            </a>
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/manager/artistlist">
                아티스트
            </a>
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/manager/artistapplylist">
                아티스트 신청
            </a>
        </nav>
        <article class="member-body">
            <section class="member-list">
                <table class="member-table">
                    <thead>
                    <tr>
                        <th scope="col" class="artistNo">아티스트 번호</th>
                        <th scope="col" class="id">아이디</th>
                        <th scope="col" class="artistName">아티스트 필명</th>
                        <th scope="col" class="artistType">아티스트 유형</th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="col" class="artistNo">아티스트 번호</th>
                            <th scope="col" class="id">아이디</th>
                            <th scope="col" class="artistName">아티스트 필명</th>
                            <th scope="col" class="artistType">아티스트 유형</th>
                            <th scope="col">
                                <a class="artist-detail-btn" href="/account/modify/" onclick="gaClickAccount('account_modify');">
                                    아티스트 정보확인
                                </a>
                            </th>
                            <th><input type="checkbox" name="xxx"></th>
                        </tr>
                        <tr>
                            <th scope="col" class="artistNo">아티스트 번호</th>
                            <th scope="col" class="id">아이디</th>
                            <th scope="col" class="artistName">아티스트 필명</th>
                            <th scope="col" class="artistType">아티스트 유형</th>
                            <th scope="col">
                                <a class="artist-detail-btn" href="/account/modify/" onclick="gaClickAccount('account_modify');">
                                    아티스트 정보확인
                                </a>
                            </th>
                            <th><input type="checkbox" name="xxx"></th>
                        </tr>
                    </tbody>
                </table>
                <a class="member-delete-btn" href="/account/delete/">
                    등록 취소
                </a>
            </section>
        </article>
        
    </div>
</body>
</html>