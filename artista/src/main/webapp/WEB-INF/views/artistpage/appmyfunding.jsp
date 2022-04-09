<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Artista</title>
<link rel="stylesheet" href="../css/manager.css">
<link rel="stylesheet" href="../css/mypage.css">
<link rel="stylesheet" href="../css/applymodal.css">
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
				<h3 class="account-guide-name">${mem.name }님반갑습니다.</h3>
				<a class="account-modify-btn" href="mypage/mypagemodify"
					onclick="gaClickAccount('account_modify');">
					<p>작가 정보</p>
				</a>
			</div>
		</section>
		<nav class="manager-nav">
			<a class="manager-nav-btn current"
				href="${pageContext.request.contextPath}/artistpage/mywork"> 전체
				작품 </a> <a class="manager-nav-btn"
				href="${pageContext.request.contextPath}/artistpage/myproduct">
				판매 작품 </a> <a class="manager-nav-btn"
				href="${pageContext.request.contextPath}/artistpage/myfunding">
				나의 펀딩 </a> <a class="manager-nav-btn"
				href="${pageContext.request.contextPath}/artistpage/myexhibition">
				나의 전시 </a>
		</nav>


		<nav class="member-nav">
			<a class="member-nav-btn" href="${pageContext.request.contextPath}/artistpage/myfunding">
                나의 리스트
            </a>
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/artistpage/appmyfunding">
                펀딩 내역
            </a>
			<a class="member-delete-btn"
				href="${pageContext.request.contextPath}/artistpage/applyfunding">
				펀딩 신청 </a>
		</nav>

		<div class="mypage-project bg">
			
		<article class="member-body">
            <section class="member-list">
                <table class="member-table">
                    <thead>
                    <tr>
                        <th scope="col" class="fundingNo">fundingNO</th>
                        <th scope="col" class="projTitle">projTitle</th>
                        <th scope="col" class="applyStatus">applyStatus</th>
                        <th scope="col" class="refusedContents">refusedContents</th>
                    </tr>
                    </thead>
                    <c:choose>
                    	<c:when test="${list!=null }">
                    	<tbody>
                    		<c:forEach items="${list }" var="funding">
								<tr>
                            	<th scope="col">${funding.fundingNo }</th>
                            	<th scope="col">${funding.projTitle }</th>
                            	<c:choose>
                            		<c:when test="${funding.applyStatus ==0}">
                            			<th scope="col">신청 요청</th>
                            		</c:when>
                            		<c:when test="${funding.applyStatus ==1}">
                            			<th scope="col">신청 거절</th>
                            		</c:when>
                            		<c:when test="${funding.applyStatus ==2}">
                            			<th scope="col">신청 완료</th>
                            		</c:when>
                            		<c:when test="${funding.applyStatus ==3}">
                            			<th scope="col">수정 요청</th>
                            		</c:when>
                            		<c:when test="${funding.applyStatus ==4}">
                            			<th scope="col">수정 거절</th>
                            		</c:when>
                            		<c:otherwise>
                            			<th scope="col">수정 완료</th>
									</c:otherwise>
                            	</c:choose>
                            	<th scope="col">${funding.refusedContents }</th>
                        		</c:forEach>
                        </tbody>
                    	</c:when>
                    </c:choose>
                </table>
            </section>
        </article>
		</div>
	</div>



</body>
</html>