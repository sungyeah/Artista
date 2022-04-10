<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://og-data.s3.amazonaws.com/CACHE/css/output.4e774f3b4c87.css" type="text/css">
    <link rel="stylesheet" href="https://og-data.s3.amazonaws.com/CACHE/css/output.75d1aa7676f8.css" type="text/css">
    <script src="https://og-data.s3.amazonaws.com/static/common/js/jquery-1.12.4.min.js"></script>
    <script src="https://og-data.s3.amazonaws.com/CACHE/js/output.bd018f02f86b.js"></script>
    <script src="https://og-data.s3.amazonaws.com/CACHE/js/output.85320f581d39.js"></script>
</head>
<body>
<%@include file ="../header.jsp" %>
		
        <!-- Content -->
        <article id="content" class="vuelayer">
            <nav class="page-nav taxonomy">
                <div class="inner">
                    <button type="button" class="button1">On View &amp; Upcoming</button>
                    <ul>
                        <li><a href="/exhibitionview">On View</a></li> 
                        <li><a href="/exhibitionup">Upcoming</a></li> 
                        <li><a href="/exhibitionterm"><b>Terminated</b></a></li> 
                    </ul></div></nav> 
                    <div class="container_full">
            <section id="season_section">
                <div class="season_top"><div class="season_keyword"><span id="season_tag">봄</span><span class="season_key">#생동감</span><span class="season_key">#꽃빛발</span><span class="season_key">#움트는</span></div><h4>어느새 또다시 눈부신 봄</h4></div>
                <div id="owl_season" class="owl-carousel owl-theme" onclick="gaClickHome('season_artwork_list_190227');">
                    
                        <div class="season_artwork">
                            <a href="/artwork/A0285-0038/">
                                <img class="owl-lazy" data-src="images/사월의 눈.jpg"/>
                            </a>
                            <div class="season_artwork_info">
                                <h5>사월의눈</h5>
                                <p>정은주</p>
                            </div>
                        </div>
                    
                        <div class="season_artwork">
                            <a href="/artwork/A0126-0080/">
                                <img class="owl-lazy" data-src="images/색으로 짓는 표정.jpg"/>
                            </a>
                            <div class="season_artwork_info">
                                <h5>색으로 짓는 표정 2019 no4</h5>
                                <p>남학현</p>
                            </div>
                        </div>
                    
                        <div class="season_artwork">
                            <a href="/artwork/A1416-0008/">
                                <img class="owl-lazy" data-src="images/장미보다 엉겅퀴.jpg"/>
                            </a>
                            <div class="season_artwork_info">
                                <h5>장미보다 엉겅퀴</h5>
                                <p>정솔미</p>
                            </div>
                        </div>
                    
                        <div class="season_artwork">
                            <a href="/artwork/A1544-0012/">
                                <img class="owl-lazy" data-src="images/풍경속으로-4.jpg"/>
                            </a>
                            <div class="season_artwork_info">
                                <h5>풍경속으로-4</h5>
                                <p>류효선</p>
                            </div>
                        </div>
                    
                        <div class="season_artwork">
                            <a href="/artwork/A0965-0001/">
                                <img class="owl-lazy" data-src="images/BMW.jpg"/>
                            </a>
                            <div class="season_artwork_info">
                                <h5>BMW am11:20</h5>
                                <p>김길숙</p>
                            </div>
                        </div>
                    
                        <div class="season_artwork">
                            <a href="/artwork/A1334-0001/">
                                <img class="owl-lazy" data-src="https://og-data.s3.amazonaws.com/media/artworks/w_fixed/A1334/A1334-0001.jpg"/>
                            </a>
                            <div class="season_artwork_info">
                                <h5>봄의 교향곡</h5>
                                <p>최정미</p>
                            </div>
                        </div>
                    
                        <div class="season_artwork">
                            <a href="/artwork/A1456-0007/">
                                <img class="owl-lazy" data-src="https://og-data.s3.amazonaws.com/media/artworks/w_fixed/A1456/A1456-0007.jpg"/>
                            </a>
                            <div class="season_artwork_info">
                                <h5>Serotonin</h5>
                                <p>Seul</p>
                            </div>
                        </div>
                    
                        <div class="season_artwork">
                            <a href="/artwork/A0690-0037/">
                                <img class="owl-lazy" data-src="https://og-data.s3.amazonaws.com/media/artworks/w_fixed/A0690/A0690-0037.jpg"/>
                            </a>
                            <div class="season_artwork_info">
                                <h5>Garden (series.2)</h5>
                                <p>한채린</p>
                            </div>
                        </div>
                    
                        <div class="season_artwork">
                            <a href="/artwork/A1464-0026/">
                                <img class="owl-lazy" data-src="https://og-data.s3.amazonaws.com/media/artworks/w_fixed/A1464/A1464-0026.jpg"/>
                            </a>
                            <div class="season_artwork_info">
                                <h5>봄 나들이</h5>
                                <p>김나령</p>
                            </div>
                        </div>
                    
                        <div class="season_artwork">
                            <a href="/artwork/A1369-0012/">
                                <img class="owl-lazy" data-src="https://og-data.s3.amazonaws.com/media/artworks/w_fixed/A1369/A1369-0012.jpg"/>
                            </a>
                            <div class="season_artwork_info">
                                <h5>너와 봄(프리지아)</h5>
                                <p>이재영</p>
                            </div>
                        </div>
                    
                </div>
            </section>
            
            
        </div>
                    
				<!-- <button class="btn btn-primary" id='test'>테스트 버튼</button> -->
                    
                    
                    
                </article>


<%@include file ="../footer.jsp" %>
</body>
	<!-- 전시회 api -->
<!-- <script>
	$(document).ready(function() {
		$('#test').click(function() {
			$.ajax({
				type:"get",
				data: {},
				url: 'http://localhost:8090/exhibitionapi',
				success: function(data) {
					console.log(typeof(data))
				}
			})
		})
	})
</script> -->
</html>