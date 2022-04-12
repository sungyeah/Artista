<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="../css/custom.css">
    <link rel="stylesheet" href="../css/style2.css">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/layout.css">
</head>
	
<style>
section.palmares {
	background: #222;
	padding-bottom: 50px;
	padding-top: 30px;
	font-family: Manrope, sans-serif;
	box-sizing: border-box;
}

a {
	color: inherit;
	text-decoration: none;
}

.container2 {
	width: 1170px;
	margin-left: auto;
	margin-right: auto;
	padding-left: 15px;
	padding-right: 15px;
	box-sizing: border-box;
}

.row {
	margin-left: -15px;
	margin-right: -15px;
}

section.palmares .row {
	text-align: center;
}

section.palmares .title2 {
	color: #a48e69;
	font-size: 48px;
	font-weight: 700;
	margin-bottom: 25px;
	margin-top: 30px;
}

section.palmares .col-md-3 {
	display: inline-block;
	float: none;
	margin: 30px;
	vertical-align: top;
	width: 25%;
}

section.palmares .prize-type {
	min-height: 40px;
	color: #fff;
	font-size: 20px;
	margin-top: 30px;
	text-align: left;
}

section.palmares .prize-type div {
	font-size: 20px;
}

section.palmares .prize-type span {
	color: #d5a770;
}

section.palmares .prize-list {
	margin-top: 20px;
	text-align: left;
}

section.palmares .prize-list li {
	color: #9d9d9d;
	font-size: 14px;
	font-weight: 400;
	margin-bottom: 20px;
	padding: 0;
	list-style: none;
}

section.palmares .prize-list li span {
	color: #d5a770;
}
</style>
<body>
	<%@include file="../header.jsp"%>
	<div id="container">

		<!-- Content -->
		<article id="content" class="vuelayer">
			<div class="page-cover">
				<div class="image"
					style="background-image: url(../../imgupload/artistWorlds/${Img }); opacity: 1;">
				</div>
			</div>
			<section id="about" class="section">
				<h1>${artist.artistName }</h1>
				<nav class="page-nav sticky">
					<div class="inner">
						<ul>
							<li class="current"><a href="#about">작가 정보</a></li>
							<li class=""><a href="#selected-works">작가의 작품 및 펀딩</a></li>
						</ul>
					</div>
				</nav>
				<div style="margin-left: 250px;">
				<div style="float: left;">
					<div class="detail">
						<div class="info" style="">
							<figure>
								<img src="/mypage/artistprofile/${artist.artistImg }" alt="Ayoung Kim ">
							</figure>
							<h3>Connect</h3>
							<ul>
								<li><a href="http://ayoungkim.com/" target="blank">asdf@naver.com</a></li>
								<li><a href="https://www.instagram.com/" target="blank">Instagram</a></li>
								<li><a href="#receive-infomation" class="toggle-layer">Further</a></li>
							</ul>
						</div>
						<div class="person pc" style="padding: 50px 0px; float: left">
							<div class="left">
								<div class="personInfo" style="margin-top: 20px;">
									<h4>${artist.artistName }</h4>
									<ul>
										<li><a href="#"><span id="spanFollowers">${follower }</span>followers</a></li>
										<li><a href="#"><span>${following }</span>following</a></li>
									</ul>
									<c:choose>
										<c:when test="${check eq false }">
											<a name="btnFollow" class="follow" id="a"
												onclick="follow('${artist.id}');"
												style="background: white; color: #222;" href="javascript:void(0);">Follow <!-- <span class="material-icons"style="font-size:1.1rem;vertical-align:middle;">favorite_border</span> -->
												<img class="1" id="heart"
												style="width: 17.6px !important; height: 17.6px !important; margin-left: 5px;"
												src="../images/하트2.png" alt="" onclick="follow('${artist.id}');">
											</a>
										</c:when>
										<c:otherwise>
											<a name="btnFollow" class="follow" id="a"
												onclick="follow('${artist.id}');"
												style="background: #222; color: white;" href="javascript:void(0);">UnFollow <!-- <span class="material-icons"style="font-size:1.1rem;vertical-align:middle;">favorite_border</span> -->
												<img class="1" id="heart"
												style="width: 17.6px !important; height: 17.6px !important; margin-left: 5px;"
												src="../images/white.png" alt="" onclick="follow('${artist.id}');">
											</a>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
						
					</div>

				</div>
									<!-- <div class="entry-content ellipsis"> -->
						<div class="inner">
							<p>
								<em>“What we call a ‘story’ is something that by its nature
									always changes and transforms through its utterance, so that
									every kind of ‘story’ has a fundamentally synthetic quality. [.
									. .] Petra Genetrix is a genderless being, and its basic
									profundity originates in that fundamental ambiguity.” - Ayoung
									Kim</em>
							In her work, the artist Ayoung Kim reconstructs complex
								narratives grounded in her voluminous research on history and
								contemporary issues that, include matters such as Korea’s modern
								and contemporary history, geopolitics, transportation, and
								supranational movements. Her practice spans genre boundaries
								and, incorporates video, sound, performance, fiction, and texts.
								She creates multidimensional, fluid narratives through
								approaches such as speculative storytelling and narrativity,
								worldbuilding, and mythmaking. One method applied in this
								process involves the exhaustive collection of information about
								specific events and places—a process that serves not as a
								reaffirmation of historical facts, but instead as a potential
								means of deconstructing and subverting history. Through a
								journey of endless movement and subversion, Kim suggests stories
								about the truths behind those things we believe to be “facts.”
								In an era of global crisis and uncertainty about the future,
								where all the truths we have believed in are being undermined,
								Ayoung Kim’s works stimulate our speculative imagination,
								allowing us an opportunity to encounter the forgotten and
								omitted “truths” of this world—while also sharing the
								possibilities for people who transcend anthropocentrism and for
								a new life of coexistence with nature, objects, and non-beings.
														</p>
							
						</div>

					</div>
					<!-- </div> -->
			</section>

			<section class="palmares">
				<a name="palmares"></a>
				<div class="container2">
					<div class="row">
						<div class="title2">작가 이력</div>
						<div class="col-md-3 col-sm-6">
							<div class="prize-type">
								<div>개인전</div>
								<span> </span>
							</div>
							<ul class="prize-list">
								<c:forEach items="${atistList }" var="artist">
									<li><span>2017</span><br>solo show / Koelsch gallery
										- Houston - Texas, 미국</li>
								</c:forEach>
							</ul>
						</div>
						<div class="col-md-3 col-sm-6">
							<div class="prize-type">
								<div>그룹전</div>
								<span> </span>
							</div>
							<ul class="prize-list">
								<li><span>2021</span><br>Exposition collective / Sybil
									Frank Gallery - Wellington - Ontario, 캐나다</li>
								<li><span>2021</span><br>Exposition collective /
									Galeries Beauchamp - Montréal + Québec, 캐나다</li>
								<li><span>2021</span><br>Exposition collective /
									Galerie Saint Laurent+Hill - Ottawa, 캐나다</li>
								<li><span>2021</span><br>Exposition collective /
									Artêria Gallery - Bromont - Québec, 캐나다</li>
								<li><span>2020</span><br>Exposition collective / Sybil
									Frank Gallery - Wellington - Ontario, 캐나다</li>
								<li><span>2020</span><br>Exposition collective /
									Galerie St Laurent+Hill - Ottawa, 캐나다</li>
								<li><span>2020</span><br>Exposition collective /
									Artêria Gallery - Bromont - Québec, 캐나다</li>
								<li><span>2020</span><br>Exposition collective /
									Galerie Beauchamp - Montréal &amp; Québec, 캐나다</li>
								<li><span>2019</span><br>Exposition collective /
									Galerie St Laurent+Hill - Ottawa, 캐나다</li>
								<li><span>2019</span><br>Exposition collective /
									Galerie Beauchamp - Montréal &amp; Québec, 캐나다</li>
							</ul>
						</div>
						<div class="col-md-3 col-sm-6">
							<div class="prize-type">
								<div>작품 소장</div>
								<span> </span>
							</div>
							<ul class="prize-list">
								<li><span>2005</span><br>Cirque du Soleil , 캐나다</li>
								<li><span></span><br>Mercuri International, 중국</li>
								<li><span></span><br>Restaurant Coco-Canelle, 프랑스</li>
								<li><span></span><br>Bank Nova Scotia, 캐나다</li>
								<li><span></span><br>PSP Investissement, 캐나다</li>
								<li><span></span><br>Reebook, 캐나다</li>
								<li><span></span><br>UBS gestion globale, 캐나다</li>
								<li><span></span><br>Mercuri International, 캐나다</li>
								<li><span></span><br>Merill Lunch, 캐나다</li>
								<li><span></span><br>Groupe Messier, 캐나다</li>
								<li><span></span><br>Fiducie Desjardins, 캐나다</li>
							</ul>
						</div>
					</div>
				</div>
			</section>

			<section id="selected-works" class="section"">
				<h2>작가의 작품(마우스오버시 작품정보)</h2>
				<div class="post-list flex-box">
					<ul>
					<c:forEach items="${worklist }" var="work">
                    	<li><a href="#">
								<figure>
									<img src="../imgupload/artistWorks/${work.workImg }" alt="">
								</figure> <span class="title">${work.artistName }<br> ${work.workName }<br>${work.workSize }
							</span>
						</a></li>
                    </c:forEach>
					</ul>
				</div>
				<div class="pagination">
					<a href="javascript:;" class="load-more">Load More</a>
				</div>
			</section>
			<!-- 여기부터 펀딩 -->


			<!-- Receive infomation layer popup -->
			<div id="receive-infomation" class="layer-popup receive-infomation">
				<p>For further information on Ayoung Kim</p>
				<form name="emailForm" id="emailForm" method="post"
					autocomplete="off" onsubmit="">
					<input type="email" name="email" id="email" required=""
						maxlength="50" placeholder="Email address">
					<button type="submit">전송</button>
				</form>
				<button type="button" class="close closeEmailForm">닫기</button>
			</div>

		</article>
	</div>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
	function follow(follower){
		console.log("a")
		var color=document.getElementById("a");
		var id = '${id}';
		if(id=='null'){
			alert("로그인이 필요한 서비스입니다.")
			return false;
		}
		$.ajax({     
			type:"post",
			dataType:"text",
			async:false,
			url:"http://localhost:8090/follow",
			data:{"follower":follower},
			success: function(data, textStatus){
				if(data=='true'){
					 color.style.color="white";
					 color.style.background="#222";
					 location.reload();
				}else{
					color.style.color="#222";
					color.style.background="white";
					location.reload();
				}
			},
			error:function(data, textStatus){
				alert("실패");
			}
		}); 
	}
	</script>
	<%@include file="../footer.jsp"%>
</body>
</html>