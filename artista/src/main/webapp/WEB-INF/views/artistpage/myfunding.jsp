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
</head>
<body>
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
					작가 정보
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
			<a class="member-delete-btn"
				href="${pageContext.request.contextPath}/artistpage/applyfunding">
				펀딩 신청 </a>
		</nav>

		<div class="mypage-project bg">
			<div class="project-list">
				<div id="projectCardList" class="card-list">
					<ul>
						<c:forEach items="${list }" var="funding">
							<li class="reward">
								<div class="visibility-control">
									<button type="button" class="btn-more">
										<i class="wadizicon wa-more-vert"></i>
									</button>
									<button type="button" class="btn-control"
										onclick="deletePrjt(143877)">삭제</button>
								</div>
								<div class="project-card-wrap">
									<div class="project-card">
										<div class="card-img-section">
											<div class="image-box">
												<em class="project-img"> <img
													src="/funding/thumbview/${funding.thumbImg}"
													class="image-thumb">
												</em>
											</div>

											<c:choose>
												<c:when test="${funding.fundingState == 1}">
													<em class="project-type reward">예정</em>
												</c:when>
												<c:when test="${funding.fundingState==2}">
													<em class="project-type reward">진행</em>
												</c:when>
												<c:otherwise>
													<em class="project-type reward">종료</em>
												</c:otherwise>
											</c:choose>
										</div>
										<div class="card-info-section making-project">
											<h4>${funding.projTitle }</h4>
											<h5>${funding.fundingDate }</h5>
											<p class="status confirm">
												<i></i>으아아앙악
											</p>
											<p></p>
										</div>
										<div class="btn-wrap">
											<button
												onClick="location.href=${pageContext.request.contextPath}/artistpage/modifyfunding"
												class="btn-line div1">펀딩 내용 수정 요청</button>
										</div>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>



</body>
</html>