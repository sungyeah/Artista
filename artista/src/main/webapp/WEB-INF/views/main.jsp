<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" async="" src=""></script>
    <link rel="stylesheet" type="text/css" href="css/content.css">
    <link rel="stylesheet" type="text/css" href="css/global.css">
    <link rel="stylesheet" href="https://og-data.s3.amazonaws.com/CACHE/css/output.4e774f3b4c87.css" type="text/css">
    <link rel="stylesheet" href="https://og-data.s3.amazonaws.com/CACHE/css/output.75d1aa7676f8.css" type="text/css">
    <script src="https://og-data.s3.amazonaws.com/static/common/js/jquery-1.12.4.min.js"></script>
    <script src="https://og-data.s3.amazonaws.com/CACHE/js/output.bd018f02f86b.js"></script>
    <script src="https://og-data.s3.amazonaws.com/CACHE/js/output.85320f581d39.js"></script>
    <style>
    .load-more-Btn{
        width: 206px;
        height: 52px;
        margin: auto;
        display: block;
        background-color: black;
        color: white;
        border: 0;
        font-size: 1.7em;
        margin-top: 180px;
    }
    
    </style>
</head>
<body>

<%@include file ="header.jsp" %>
    <div id="container">
		
			
        <!-- Content -->
        <article id="content" class="test">
<section class="main-slide" >
    <ul style="height: 1000px; transition-duration: 300ms;">             
            
                <li class="current" style="position: absolute; top: 0px; left: 0px; opacity: 1; width: 100%; transition-duration: 2000ms; z-index: 10;">
                        <figure><img src="images/메인3.png" alt="" style="padding-top: 40px;"></figure>
                </li>
            </ul>
</section>

<div class="container_full">
	<h1 id="test"></h1>
            <section id="season_section">
                <div class="season_top"><div class="season_keyword"><span id="season_tag">봄</span><span class="season_key">#생동감</span><span class="season_key">#꽃빛발</span><span class="season_key">#움트는</span></div><h4>어느새 또다시 눈부신 봄</h4></div>
                <div id="owl_season" class="owl-carousel owl-theme" onclick="gaClickHome('season_artwork_list_190227');">
                    
                        <!-- 반복문 -->
					<c:forEach items="${exhibitList }" var="exhibit">
						<div class="season_artwork">
							<a href="https://${exhibit.reserveLink }"> <img class="owl-lazy"
								data-src="/artistpage/posterImg/${exhibit.exhibitPoster }" />
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


    <section class="sticky-post " style="margin-top: -100px;">
        <a>
            <figure><img src="/mypage/artistprofile/${artist.artistImg }" alt=""></figure>
            <div class="text">
                <span class="category">작가 소개</span>
                <span class="title"><b>${artist.artistName }</b> <br>Joins Artista</span>
                <span class="excerpt">${artist.artistIntroduce } </span>
            </div>
        </a>
    </section>

<!-- 여기부터 펀딩 -->
<section class="recent-posts vuelayer">
    <div class="post-list column-4" >
        <ul id="list12">
        <c:forEach items="${list }" var="funding">
        	<li class="">
            	<div id="box" class="image-box">
                	<figure><a href="${pageContext.request.contextPath}/funding/fundingovdetail?fundingNo=${funding.fundingNo}">
               		<img src="/funding/thumbview/${funding.thumbImg}" class="image-thumb">
                	</a></figure>
            	</div>
            	<span class="category">${funding.artistName}</span><br>
            	<a href="${pageContext.request.contextPath}/funding/fundingovdetail?fundingNo=${funding.fundingNo}">
            	<span class="title">${funding.projTitle }</span>
            	<span class="excerpt"><b>펀딩기간</b> : ${funding.fundingDate }</span>
            	</a>
        	</li>
     	</c:forEach>
         </ul>
    </div>
    <div class="pagination"><button id="loadBtn" type="button" class="load-more-Btn">load more</button></div>
</section>
</article>

</div>
<%@include file ="footer.jsp" %>
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>  -->
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <script>
    /* console.log(${check}); */
    var uid = '<%=(String)session.getAttribute("id")%>';
	let startrow = 8; 
		$('#loadBtn').on('click', function () {
			$.ajax({
				data:{"startrow" : startrow, "endrow" : 8},
				url: "/loadFundingMain",
				type: "post",
				success: function (datalist) {
					for (let i of datalist ) {
						let data = "<li class=''><div id='box' class='image-box'>"
							data += "<figure><a href='${pageContext.request.contextPath}/funding/fundingovdetail?fundingNo="
							data += i.fundingNo
							data += "'>"
							data += "<img src='/funding/thumbview/"
							data += i.thumbImg
							data += "' class='image-thumb'>"
							data += "</a></figure>"
							data += "</div>";
							
							data += "<span class='category'>";
							data += i.artistName;
							data +="</span><br>";
							data += "<a href='${pageContext.request.contextPath}/funding/fundingovdetail?fundingNo="
							data += i.fundingNo
							data += "'>"
							data += "<span class='title'>";
							data += i.projTitle;
							data +="</span></a>";
							data +="</div>";
							data += "<span class='excerpt'>";
							data += "<b>"
							data += "펀딩 기간: "
							data += "</b>"
							data += i.fundingDate;
							data +="</span></a></li>";
							$('#list12').append(data);
					}
					startrow += 8;
				}
			});
		});


 </script>
   
</body>
</html>