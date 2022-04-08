<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Artista</title>
<link rel="stylesheet" href="../css/manager.css">
<link rel="stylesheet" href="../css/mypage.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
                     ${artistName }님 반갑습니다.
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
            <a class="manager-nav-btn" href="${pageContext.request.contextPath}/artistpage/myexhibition">
                나의 전시
            </a>
        </nav>
        
        <nav class="member-nav">
        	<a class="member-nav-btn" href="${pageContext.request.contextPath}/artistpage/myproduct">
                판매 중인 작품
            </a>
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/artistpage/myproductsold">
                판매완료 작품
            </a>
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/artistpage/myproductapply">
                판매신청내역
            </a>
        
            <a class="member-delete-btn" href="${pageContext.request.contextPath}/artistpage/applyproduct" style="width:120px;">
                작품판매 신청
            </a>
        </nav>
        
		<br><br><br><br>
		<section id="discover_contents">
        	<div id="discoverList" class="discoverList">
            <c:choose>
           	<c:when test="${worklist!=null }">
            	<c:forEach items="${worklist }" var="work">
            		<div class="discoverCard" >
            		 <a class="discoverCard-a" href="">
            		 	<div class="discoverCard-imageWrap" style="padding-bottom: 50.0%; ">
            		 		<img class="discoverCard-image" src="/artistpage/workImg/${work.workImg }">
                   			<div class="card-imageMask"></div>
            		 	</div>
            		 	<div class="discoverCard-textBox">
            		 		<h3 class="discoverCard-title">${work.workName }</h3>
                       		<div class="discoverCard-artist">${work.artistName }</div>
                       		<div class="discoverCard-info">${work.workSize }</div>
       					 </div>
          			 </a>
           			</div>
       			</c:forEach>
            </c:when>
            </c:choose>
        	</div>
        </section>
    </div>
</body>
</html>