<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://og-data.s3.amazonaws.com/CACHE/css/output.4e774f3b4c87.css"
	type="text/css">
<link rel="stylesheet"
	href="https://og-data.s3.amazonaws.com/CACHE/css/output.75d1aa7676f8.css"
	type="text/css">
<script
	src="https://og-data.s3.amazonaws.com/static/common/js/jquery-1.12.4.min.js"></script>
<script
	src="https://og-data.s3.amazonaws.com/CACHE/js/output.bd018f02f86b.js"></script>
<script
	src="https://og-data.s3.amazonaws.com/CACHE/js/output.85320f581d39.js"></script>
</head>
<body>
	<%@include file="../header.jsp"%>

	<!-- Content -->
	<article id="content" class="vuelayer">
		<nav class="page-nav taxonomy">
			<div class="inner">
				<ul>
					<li><a href="/exhibition/view">${status == 'view' ? '<b>On view</b>' : 'On view' }</a></li>
					<li><a href="/exhibition/up">${status == 'up' ? '<b>Upcoming</b>' : 'Upcoming' }</a></li>
					<li><a href="/exhibition/term">${status == 'term' ? '<b>Terminated</b>' : 'Terminated' }</a></li>
				</ul>
			</div>
		</nav>

		<div class="container_full">
			<section id="season_section">
				<div class="season_top">
					<div class="season_keyword">
						<span id="season_tag">봄</span><span class="season_key">#생동감</span><span
							class="season_key">#꽃빛발</span><span class="season_key">#움트는</span>
					</div>
					<h4>어느새 또다시 눈부신 봄</h4>
				</div>
				<div id="owl_season" class="owl-carousel owl-theme"
					onclick="gaClickHome('season_artwork_list_190227');">


					<!-- 반복문 -->
					
					
					<c:forEach items="${exhibitList }" var="exhibit">
						
						<div class="season_artwork">
						<c:if test="${exhibit.fundingNo == -1 }">
						<div>
								<img src="../images/리본.jpg" style="width:60px; height:auto; z-index: 1; position: absolute; top:-15px;">
								</div>
								</c:if>
							<a href="https://${exhibit.reserveLink }"> <img class="owl-lazy"
								data-src="../../imgupload/exhibition/${exhibit.exhibitPoster }" />
							</a>
							<div class="season_artwork_info">
								<h5>${exhibit.exhibitTitle }</h5>
								<p>${exhibit.startDate } ~ ${exhibit.endDate }</p>
								<p>${exhibit.exhibitArtist }</p>
								
							</div>
						</div>

					</c:forEach>
					
					

				</div>
			</section>
			
		</div>


	</article>


	<%@include file="../footer.jsp"%>
</body>

</html>