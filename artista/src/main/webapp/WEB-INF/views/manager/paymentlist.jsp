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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/manager/paymentlist">
                결제 전체내역
            </a>
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/manager/paycompletelist">
                판매완료 작품
            </a>
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/manager/productapplylist">
                판매작품 등록신청
            </a>
        </nav>
        <article class="member-body">
            <section class="member-list">
                <table class="member-table">
                    <thead>
                    <tr>
                        <th scope="col">작품 번호</th>
                        <th scope="col">작품 제목</th>
                        <th scope="col">작품 가격</th>
                        <th scope="col">결제 일자</th>
                        <th scope="col">구매자</th>
                        <th scope="col">현재상태</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                    	<th scope="col" id="workNo">작품 번호</th>
                        <th scope="col" id="workName">작품 제목</th>
                        <th scope="col" id="workPrice">작품 가격</th>
                        <th scope="col" id="orderDate">결제 일자</th>
                        <th scope="col" id="orderName">구매자</th>
                        <th scope="col" id="orderState">현재상태</th>
                     </tr>
                     <tr>
                    	<th scope="col" id="workNo">작품 번호</th>
                        <th scope="col" id="workName">작품 제목</th>
                        <th scope="col" id="workPrice">작품 가격</th>
                        <th scope="col" id="orderDate">결제 일자</th>
                        <th scope="col" id="orderName">구매자</th>
                        <th scope="col" id="orderState">현재상태</th>
                     </tr>
                    </tbody>
                </table>
            </section>
        </article>
        
    </div>
</body>
</html>