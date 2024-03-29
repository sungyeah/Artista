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






.js-load {
    display: none;
}
.js-load.active {
    display: block;
}
.is_comp.js-load:after {
    display: none;
}
.btn-wrap, .lists, .main {
    display: block;
}
.main {
    max-width: 640px;
    margin: 0 auto;
}
.lists {
    margin-bottom: 4rem;
}
.lists__item {
    padding: 20px;
    background: #EEE;
}
.lists__item:nth-child(2n) {
    background: #59b1eb;
    color: #fff;
}
.btn-wrap {
    text-align: center;
}
</style>
<body>
	<%@include file="../header.jsp"%>
	<div id="container">

		<!-- Content -->
		<article id="content" class="vuelayer">
			<div class="page-cover">
				<div class="image"
				style="background-image: url(/mypage/artistWorld/${Img }); opacity: 1;width:700px; height: 500px; margin-top:100px;">
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
				<div style="margin-left: 250px;float:left;">
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
						<div class="person pc" style="padding: 50px 0px;;">
							<div class="left">
								<div class="personInfo" style="margin-top: 20px; float:left;">
									<h4>${artist.artistName }</h4>
									<ul>
										<li><a><span id="spanFollowers">${follower }</span>followers</a></li>
										<li><a><span>${following }</span>following</a></li>
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
									<div class="entry-content ellipsis" style="float:left;">
						<div class="inner">
							<p>
								<em>
								${artist.artistIntroduce }
								</em>
									</p>
									<p>
							
														</p>
														<p>
														
							</p>
							
						</div>


					</div>
					</div>
			</section>

			<section class="palmares">
				<a name="palmares"></a>
				<div class="container2">
					<div class="row">
						<div class="title2">작가 이력</div>
						<div class="col-md-3 col-sm-6">
							<div class="prize-type">
								<div>수상</div>
								<span> </span>
							</div>
							<ul class="prize-list" id="prize">
							</ul>
						</div>
						<div class="col-md-3 col-sm-6">
							<div class="prize-type">
								<div>전시</div>
								<span> </span>
							</div>
							<ul class="prize-list" id="exhit">
							</ul>
						</div>
						<div class="col-md-3 col-sm-6">
							<div class="prize-type">
								<div>논문 및 저서</div>
								<span> </span>
							</div>
							<ul class="prize-list" id='book'>
							</ul>
						</div>
					</div>
				</div>
			</section>

			<section id="selected-works" class="section">
				<h2>작가의 작품</h2>
				
				<div class="post-list flex-box">
					<ul>
					<c:forEach items="${worklist }" var="work">
					<c:choose>
					<c:when test="${work.workForSale eq 0}">
                    	<li><a href="../workdetail/${work.workNo }" style="width:100%;" class="only-pc">
								<figure>
									<img src="/artistpage/workImg/${work.workImg }" alt="">
								</figure> 
								<span class="title">${work.artistName }<br> ${work.workName }<br>${work.workSize }<br>
								<div class="artwork-detail-info-status" style="color:#a48e69; position: absolute; margin-top: -150px; font-size: 20px;">●
								<b>전시용</b></div>
							</span>
							
						</a></li>
						</c:when>
						<c:otherwise>
						<li><a href="../storedetail/${work.workNo }" style="width:100%;" class="only-pc">
								<figure>
									<img src="/artistpage/workImg/${work.workImg }" alt="">
								</figure> 
								<span class="title">${work.artistName }<br> ${work.workName }<br>${work.workSize }<br>
								<div class="artwork-detail-info-status" style="color:#d11919; position: absolute; margin-top: -150px; font-size: 20px;">●
								판매용</div>
							</span>
							
						</a></li>
						</c:otherwise>
						</c:choose>
                    </c:forEach>
					</ul>

				</div>
			</section>

		</article>


	</div>
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
	var id = '<%=(String)session.getAttribute("id")%>';
	function follow(follower){
		var color=document.getElementById("a");
		if(id=='null'){
			alert("로그인이 필요한 서비스입니다.")
			return false;
		}
		$.ajax({     
			type:"post",
			dataType:"text",
			async:false,
			url:"${pageContext.request.contextPath}/follow",
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
	
	
	let recordArr = ${artist.artistRecord};
	if (recordArr != null) {
		for(let record of recordArr) {
			console.log(record)
			if(record.type == "수상") {
				$("#prize").append("<li><span>"+record.year+"</span><br>"+record.recordText+"</li>");
			}
			else if(record.type == "전시") {
				$("#exhit").append("<li><span>"+record.year+"</span><br>"+record.recordText+"</li>");
			}
			else {
				$("#book").append("<li><span>"+record.year+"</span><br>"+record.recordText+"</li>");
			}
		}
	}
	
	</script>
	<%@include file="../footer.jsp"%>
</body>
</html>