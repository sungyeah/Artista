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
                        <th scope="col" class="memberNo">회원번호</th>
                        <th scope="col" class="id">아이디</th>
                        <th scope="col" class="name">이름</th>
                        <th scope="col" class="email">이메일</th>
                        <th scope="col" class="address">주소</th>
                        <th scope="col" class="contact">연락처</th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="" class="memberNo">회원번호</th>
                            <th scope="" class="id">아이디</th>
                            <th scope="" class="name">이름</th>
                            <th scope="" class="email">이메일</th>
                            <th scope="" class="address">주소</th>
                            <th scope="" class="contact">연락처</th>
                            <th><input type="checkbox" name="xxx"></th>
                        </tr>
                        <tr>
                            <th scope="" class="memberNo">회원번호</th>
                            <th scope="" class="id">아이디</th>
                            <th scope="" class="name">이름</th>
                            <th scope="" class="email">이메일</th>
                            <th scope="" class="address">주소</th>
                            <th scope="" class="contact">연락처</th>
                            <th><input type="checkbox" name="xxx"></th>
                        </tr>
                    </tbody>
                </table>
                <a class="member-delete-btn" href="/account/delete/">
                    회원 탈퇴
                </a>
            </section>
        </article>
        
    </div>
</body>
</html>