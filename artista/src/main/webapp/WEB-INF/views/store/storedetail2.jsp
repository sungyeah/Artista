<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.person.pc {
    display: flex;
}
.person {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
}
.person .left {
    display: flex;
    flex-wrap: wrap;
}
.person .left .img {
    display: flex;
    margin: 30px;
    justify-content: center;
    align-items: center;
    width: 60px;
    height: 60px;
    border-radius: 50%;
    overflow: hidden;
}
.user-thumbnail-div.brz {
    background-image: linear-gradient(#444444, #444444), linear-gradient(to right, #a8903b 0%, #8b6304 100%);
}
.user-thumbnail-div {
    display: inline-block;
    width: fit-content;
    border-radius: 50%;
    background-origin: border-box;
    background-clip: content-box, border-box;
    border: 4px solid transparent;
}
.person .left .img img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}
img.user-thumbnail {
    display: inline-block;
    width: 35px !important;
    height: 35px !important;
    overflow: hidden;
    object-fit: cover;
    border-radius: 50%;
}
.user-thumbnail {
    /* display: inline-block; */
    width: 50px;
    height: 50px;
    overflow: hidden;
    background-size: cover;
    background-position: center center;
    background-image: url(/images/user_img.png);
    border-radius: 50%;
}

img {
    border: 0;
    vertical-align: middle;
}
.person .left .personInfo {
    display: flex;
    flex-direction: column;
}
.person .left .personInfo h4 {
    font-size: 24px;
    margin-bottom: 20px;
    display: flex;
}
.person .left .personInfo ul {
    display: flex;
}
ul, ol {
    list-style-type: none;
}
.person .left .personInfo ul li {
    text-align: center;
    margin: 0px 20px 0px 0px;
    position: relative;
    padding-right: 20px;
}
.person .left .personInfo ul li a {
    display: block;
    font-size: 12px;
    text-align: center;
}
.person .left .personInfo ul li a span {
    display: block;
    text-align: center;
    font-weight: bold;
    position: relative;
    padding-bottom: 5px;
}
.person .left .personInfo ul li a span::after {
    content: '';
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
    bottom: 0;
    height: 1px;
    width: 10px;
    background: #222222;
}
.person .left .personInfo > a {
    display: inline-block;
    padding: 5px 20px;
    margin-top: 30px;
    border: solid 1px #333;
    color: #333;
    font-size: 12px;
    text-align: center;
    max-width: 150px;
}
.material-icons {
    font-family: 'Material Icons';
    font-weight: normal;
    font-style: normal;
    font-size: 24px;
    line-height: 1;
    letter-spacing: normal;
    text-transform: none;
    display: inline-block;
    white-space: nowrap;
    word-wrap: normal;
    direction: ltr;
    -webkit-font-feature-settings: 'liga';
    -webkit-font-smoothing: antialiased;
}
/* position: absolute;
    max-width: 100%;
    max-height: 100%;
    top: 50%;
    left: 50%;
    -webkit-transform: translate(-50%,-50%);
    -ms-transform: translate(-50%,-50%);
    transform: translate(-50%,-50%);
    cursor: pointer;
} */
</style>
<body>
	<%@include file="../header.jsp"%>
	<div id="container">

		<!-- Content -->
		<article id="content">
			<!-- Content -->

			<div class="hgroup" style="padding-top: 100px;">

				<div class="person pc" style="padding:50px 100px;">
                <div class="left">
                    <a href="/user?memberId=704" class="img">
                    	<div class="user-thumbnail-div brz">
                    		<img class="user-thumbnail" style="width:50px !important;height:50px !important;" src="/contents/user/704/thumbnail.jpg" alt="">
                        </div>
                    </a>
                    <div class="personInfo">
                        <h4>DIMZ</h4>
                        <ul>
                            <li><a href="#"><span id="spanFollowers">0</span>followers</a></li>
                            <li><a href="#"><span>0</span>following</a></li>
                            
                        </ul>
                        <a href="javascript:;" name="btnFollow" class="">Follow 
                        <!-- <span class="material-icons" style="font-size:1.1rem;vertical-align:middle;">favorite_border</span> -->
                        <img class="1" style="width:17.6px !important;height:17.6px !important;" src="../images/하트.png" alt="">
                        </a>
                    </div>
                </div>
                <div class="right">
                    <ul>
                    
                        
                    </ul>
                </div>
            </div>

			</div>



			<div class="entry-content">

				 <figure class="full" style="text-align: center;width: 735px;">
					<img src="/artistpage/workImg/${work.workImg }" alt=""
						style="height: 700px;">
				</figure> 
				

				<div class="hgroup">
					<div class="topInfoBtns">
						<button id="purchaseBtn" class="btnPurchase "
							style="color: black; width: 25%; font-size: 1.2rem; padding: 0 0 7px 0; vertical-align: middle; border-radius: 100px; height: 50px; border: solid 1px #000; margin-bottom: 30px;"><a href="cart">
							<span class="fd-icon"
								style="background-image: url('/images/symbol-eth.svg'); background-color: black; border-radius: 50%; margin-right: 10px;"></span>
							<span style="vertical-align: middle;">카트 추가</span>
						</a></button>
						<button id="purchaseBtn" class="btnPurchase "
							style="background: #222; color: #fff; width: 25%; font-size: 1.2rem; padding: 0 0 7px 0; vertical-align: middle; border-radius: 100px; height: 50px; border: solid 1px #000; margin-bottom: 30px;"><a href="payment">
							<span class="fd-icon"
								style="background-image: url('/images/symbol-eth.svg'); background-color: white; border-radius: 50%; margin-right: 10px;"></span>
							<span style="vertical-align: middle;">작품 구매</span>
						</a></button>

					</div>

					<h1>김원근 : BOSS</h1>
					<p class="date">Feb 19, 2022</p>
					<p class="author"></p>
				</div>

				<blockquote>
					<p>“[Moritz의] 이미지는 형태를 바꾸는 것입니다. 가이드북, 시간 여행자, 위안의 대상, 기쁨의 대상,
						어려움의 대상 - 우리 모두가 공유하는 세상을 보고 이해하려는 시도의 의미를 연습합니다. 그들은 본질적으로 불확실성을
						수반하는 진리의 환기보다 구체적인 사실에 덜 관심을 가집니다. 역으로 이것이 그들의 강점이다.” – 김상원</p>
				</blockquote>

				<p>이 카탈로그에는 유화 37점, 구상 회화 3점, 오일 및/또는 오일 크레용으로 손으로 채색한 독특한 에칭
					13점이 있습니다. 또한 쾰른에 있는 작가의 작업실을 살짝 엿볼 수 있고 전시 컨셉에 따라 4개의 그룹으로 작품이 나란히
					병치되어 있는 갤러리의 설치 전경도 포함되어 있습니다.</p>

				<p>김상원의 전시 카탈로그가 출판되었습니다. 김상원의 첫 개인전 태양 아래 꽃밭 은 일련의 에칭과 함께 추상적이고
					구상적인 회화를 통해 작가의 작업을 파노라마로 보여준다.</p>

				<p>
					<strong>출판내용</strong><br> 출판사: 멀티캠퍼스<br> 출판일: 2022년 3월<br>
					작가: 김원근<br> 제본: 양장본<br> 크기: 220 x 275 mm<br> 언어: 영어,
					국문<br> ISBN: 978-89-6736-108-2<br> 소매가: 4만원 <br> 문의
					: +82 2 2287 3500
				</p>


			</div>
			</article>
	</div>
	<%@include file="../footer.jsp"%>
</body>
</html>