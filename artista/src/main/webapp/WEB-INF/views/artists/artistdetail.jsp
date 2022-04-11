<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	section.palmares {
    background: #000;
    padding-bottom: 50px;
    padding-top: 30px;
    font-family: Manrope,sans-serif;
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
    color: #fff;
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
<%@include file ="../header.jsp" %>
<div id="container">

    <!-- Content -->
    <article id="content" class="vuelayer">
        <div class="page-cover">
            <div class="image"
                style="background-image: url(/mypage/artistprofile/${artistworld.artistImg }); opacity: 1;">
            </div>
        </div>
        <section id="about" class="section" >
            <h1>Hong-Sung Ho</h1>
            <nav class="page-nav sticky" >
                <div class="inner">
                    <ul>
                        <li class="current"><a href="#about">작가 정보</a></li>
                        <li class=""><a href="#selected-works">작가의 작품 및 펀딩</a></li>
                    </ul>
                </div>
            </nav>
            <div class="detail" >
                <div class="info">
                    <figure><img src="${artistworld.artistImg }"
                            alt="Ayoung Kim "></figure>
                    <h3>Download</h3>
                    <ul>
                        <li><a href="/download/file/41f48fbefd6e4843a2bfe3b9bc33ba5f">CV</a></li>
                    </ul>
                    <h3>Connect</h3>
                    <ul>
                        <li><a href="http://ayoungkim.com/" target="blank">Website</a></li>
                        <li><a href="https://www.instagram.com/ayoung___kim/" target="blank">Instagram</a></li>
                        <li><a href="#receive-infomation" class="toggle-layer">Further Information</a></li>
                    </ul>
                </div>
                <div class="entry-content ellipsis">
                    <div class="inner">
                        <p><em>“What we call a ‘story’ is something that by its nature always changes and transforms
                                through its utterance, so that every kind of ‘story’ has a fundamentally synthetic
                                quality. [. . .] Petra Genetrix is a genderless being, and its basic profundity
                                originates in that fundamental ambiguity.” - Ayoung Kim</em></p>
                        <p>In her work, the artist Ayoung Kim reconstructs complex narratives grounded in her voluminous
                            research on history and contemporary issues that, include matters such as Korea’s modern and
                            contemporary history, geopolitics, transportation, and supranational movements. Her practice
                            spans genre boundaries and, incorporates video, sound, performance, fiction, and texts. She
                            creates multidimensional, fluid narratives through approaches such as speculative
                            storytelling and narrativity, worldbuilding, and mythmaking. One method applied in this
                            process involves the exhaustive collection of information about specific events and places—a
                            process that serves not as a reaffirmation of historical facts, but instead as a potential
                            means of deconstructing and subverting history. Through a journey of endless movement and
                            subversion, Kim suggests stories about the truths behind those things we believe to be
                            “facts.” In an era of global crisis and uncertainty about the future, where all the truths
                            we have believed in are being undermined, Ayoung Kim’s works stimulate our speculative
                            imagination, allowing us an opportunity to encounter the forgotten and omitted “truths” of
                            this world—while also sharing the possibilities for people who transcend anthropocentrism
                            and for a new life of coexistence with nature, objects, and non-beings.</p>
                        <p>Ayoung Kim has presented exhibitions and projects at major institutions in Korea and around
                            the world, including <em><a href="https://videobrasil.online/">Oxbow Lake Time</a></em>
                            (Video Brasil, São Paulo, 2021, Online Solo Screening), <em><a
                                    href="https://ilmin.org/notice/%eb%ae%a4%ec%a7%80%ec%97%84-producer-%ea%b8%b0%ed%9a%8d-%ec%9b%8c%ed%81%ac%ec%88%8d-1-%ec%82%ac%eb%b3%80%ec%a0%81-%ec%8a%a4%ed%86%a0%eb%a6%ac%eb%b3%b4%eb%93%9c-%ec%a0%9c%ec%9e%91-%ec%9b%8c/">Porosity
                                    Valley</a></em> (Ilmin Museum of Art, Seoul, 2018), <em><a
                                    href="https://2017.festival.melbourne/events/porosity-valley-portable-holes/#.YgZEv5bP1PY">Porosity
                                    Valley, Portable Holes</a></em> (Melbourne Festival, Melbourne, 2017), <em><a
                                    href="https://palaisdetokyo.com/en/exposition/ayoung-kim/">In This Vessel We Shall
                                    Be Kept</a></em> (Palais de Tokyo, Paris, 2016),<em><a
                                    href="https://youtu.be/rKW6f_FrrSs">The Railway Traveler’s Handbook</a></em>
                            (Culture Station Seoul 284, Seoul, 2014), <em><a
                                    href="http://ayoungkim.com/wp/works/ph-express-project-20112012">PH Express</a></em>
                            (Künstlerhaus Bethanien, Berlin, 2012), <em><a
                                    href="http://ayoungkim.com/wp/works/not-in-the-wrong-place-at-the-wrong-time">Minima
                                    Memoria</a></em> (Street Level,&nbsp;Glasgow, 2010), and <a
                                href="https://www.mutualart.com/Exhibition/Ephemera/5963AADD2B1C10AF">Ephemera</a>
                            (I-Myu Projects, London, 2009).&nbsp;</p>
                    </div>
                    <br>
                    팔로워 기능

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
                            <div>개인전</div>
                            <span> </span>
                        </div>
                        <ul class="prize-list">
                        <li><span>2017</span><br>solo show  / Koelsch gallery - Houston - Texas, 미국</li>
                        <li><span>2015</span><br>Expo solo &quot;Minimal&quot; / Espace 40 mile end - Montréal, 캐나다</li>
                        <li><span>2007</span><br>Expo solo &quot; Contrastes&quot; / Galerie Desja - Montréal, 캐나다</li>
                        <li><span>2006</span><br>Expo solo &quot; Se sentir pousser des ailes&quot; / Galerie desja - Montréal, 캐나다</li>
                        <li><span>2005</span><br>Expo solo &quot;Nuit de Chine&quot; / Cirque du soleil - Montréal, 캐나다</li>
                        <li><span>2003</span><br>Expo Solo &quot;A chacun son Zen&quot; / Galerie  [sas] - Montréal, 캐나다</li>
                        <li><span>2002</span><br>expo solo / Galerie  [sas] - Montréal, 캐나다</li>
                        <li><span>2001</span><br>solo show  / China Tee Club - Hong Kong, 중국</li>
                        </ul>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="prize-type">
                            <div>그룹전</div>
                            <span> </span>
                        </div>
                        <ul class="prize-list"><li><span>2021</span><br>Exposition collective / Sybil Frank Gallery - Wellington - Ontario, 캐나다</li>
                        <li><span>2021</span><br>Exposition   collective / Galeries Beauchamp - Montréal + Québec, 캐나다</li>
                        <li><span>2021</span><br>Exposition   collective / Galerie Saint Laurent+Hill - Ottawa, 캐나다</li>
                        <li><span>2021</span><br>Exposition collective / Artêria Gallery - Bromont - Québec, 캐나다</li>
                        <li><span>2020</span><br>Exposition collective / Sybil Frank Gallery - Wellington - Ontario, 캐나다</li>
                        <li><span>2020</span><br>Exposition collective / Galerie St Laurent+Hill - Ottawa, 캐나다</li>
                        <li><span>2020</span><br>Exposition collective / Artêria Gallery - Bromont - Québec, 캐나다</li>
                        <li><span>2020</span><br>Exposition collective / Galerie Beauchamp - Montréal &amp; Québec, 캐나다</li>
                        <li><span>2019</span><br>Exposition collective / Galerie St Laurent+Hill - Ottawa, 캐나다</li>
                        <li><span>2019</span><br>Exposition collective / Galerie Beauchamp - Montréal &amp; Québec, 캐나다</li>
                        </ul>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="prize-type">
                            <div>작품 소장</div>
                            <span> </span>
                        </div>
                        <ul class="prize-list"><li><span>2005</span><br>Cirque du Soleil , 캐나다</li>
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
                    <li><a href="/gallery/artist/20000000116/work/20000000540">
                            <figure><img
                                    src="images/작가의세계작품1.jpg"
                                    alt=""></figure> <span class="title">Petrogenesis, Petra
                                Genetrix<br>2019-2021</span>
                        </a></li>
                    <li><a href="/gallery/artist/20000000116/work/20000000541">
                            <figure><img
                                src="images/작가의세계작품2.jpg"
                                    alt=""></figure> <span class="title">Petrogenesis, Petra
                                Genetrix<br>2019-2021</span>
                        </a></li>
                    <li><a href="/gallery/artist/20000000116/work/20000000542">
                            <figure><img
                                src="images/작가의세계작품3.jpg"
                                    alt=""></figure> <span class="title">At the Surisol Underwater Lab<br>2020</span>
                        </a></li>
                    <li><a href="/gallery/artist/20000000116/work/20000000543">
                            <figure><img
                                src="images/작가의세계작품4.jpg"
                                    alt=""></figure> <span class="title">At the Surisol Underwater Lab<br>2020</span>
                        </a></li>
                    <li><a href="/gallery/artist/20000000116/work/20000000544">
                            <figure><img
                                src="images/작가의세계작품5.jpg"
                                    alt=""></figure> <span class="title">In Search of Petra Genetrix<br>2020</span>
                        </a></li>
                    <li><a href="/gallery/artist/20000000116/work/20000000545">
                            <figure><img
                                src="images/작가의세계작품6.jpg"
                                    alt=""></figure> <span class="title">In Search of Petra Genetrix<br>2020</span>
                        </a></li>
                    <li><a href="/gallery/artist/20000000116/work/20000000546">
                            <figure><img
                                src="images/작가의세계작품7.jpg"
                                    alt=""></figure> <span class="title">Porosity Valley 2: Tricksters’
                                Plot<br>2019</span>
                        </a></li>
                    <li><a href="/gallery/artist/20000000116/work/20000000547">
                            <figure><img
                                src="images/작가의세계작품8.jpg"
                                    alt=""></figure> <span class="title">Porosity Valley 2: Tricksters’
                                Plot<br>2019</span>
                        </a></li>
                </ul>
            </div>
            <div class="pagination"><a href="javascript:;" class="load-more">Load More</a></div>
        </section>
<!-- 여기부터 펀딩 -->
<section class="recent-posts vuelayer">
    <div class="post-list column-4">
        <ul>
            <li class="video">
                <a href="#">
                    <figure><img src="images/전시회1.jpg" alt=""></figure>
                    <span class="category">목표금액 : 10,000,000원</span>
                    <span class="title">Hong Sung-Ho 홍성호 : 전시회이름(예정)</span>
                    <span class="excerpt">펀딩기간 : 2022.03.22 ~ 2022.05.21</span>
                </a>
            </li>
            <li class=""><a href="/story/view/20000000200">
                    <figure><img src="images/전시회2.jpg" alt=""></figure>
                    <span class="category">목표금액 : 10,000,000원</span>
                    <span class="title">Hong Sung-Ho 홍성호 : 전시회이름(예정)</span>
                    <span class="excerpt">펀딩기간 : 2022.03.22 ~ 2022.05.21</span>
                </a></li>
            <li class=""><a href="/story/view/20000000198">
                    <figure><img src="images/전시회3.jpg" alt=""></figure>
                    <span class="category">목표금액 : 10,000,000원</span>
                    <span class="title">Hong Sung-Ho 홍성호 : 전시회이름(예정)</span>
                    <span class="excerpt">펀딩기간 : 2022.03.22 ~ 2022.05.21</span>
                </a></li>
            <li class=""><a href="/story/view/20000000197">
                    <figure><img src="images/전시회4.jpg" alt=""></figure>
                    <span class="category">목표금액 : 10,000,000원</span>
                    <span class="title">Hong Sung-Ho 홍성호 : 전시회이름(예정)</span>
                    <span class="excerpt">펀딩기간 : 2022.03.22 ~ 2022.05.21</span>
                </a></li>
            <li class=""><a href="/story/view/20000000193">
                    <figure><img src="images/전시회5.jpg" alt=""></figure>
                    <span class="category">목표금액 : 10,000,000원</span>
                    <span class="title">Hong Sung-Ho 홍성호 : 전시회이름(예정)</span>
                    <span class="excerpt">펀딩기간 : 2022.03.22 ~ 2022.05.21</span>
                </a></li>
            <li class=""><a href="/story/view/20000000191">
                    <figure><img src="images/전시회6.jpg" alt=""></figure>
                    <span class="category">목표금액 : 10,000,000원</span>
                    <span class="title">Hong Sung-Ho 홍성호 : 전시회이름(예정)</span>
                    <span class="excerpt">펀딩기간 : 2022.03.22 ~ 2022.05.21</span>
                </a></li>
            <li class=""><a href="/story/view/20000000189">
                    <figure><img src="images/전시회7.jpg" alt=""></figure>
                    <span class="category">목표금액 : 10,000,000원</span>
                    <span class="title">Hong Sung-Ho 홍성호 : 전시회이름(예정)</span>
                    <span class="excerpt">펀딩기간 : 2022.03.22 ~ 2022.05.21</span>
                </a></li>
            <li class="video"><a href="/story/view/20000000187">
                    <figure><img src="images/전시회8.jpg" alt=""></figure>
                    <span class="category">목표금액 : 10,000,000원</span>
                    <span class="title">Hong Sung-Ho 홍성호 : 전시회이름(예정)</span>
                    <span class="excerpt">펀딩기간 : 2022.03.22 ~ 2022.05.21</span>
                </a></li>
    </div>

</section>

<!-- Receive infomation layer popup -->
<div id="receive-infomation" class="layer-popup receive-infomation">
<p>For further information on Ayoung Kim </p>
<form name="emailForm" id="emailForm" method="post" autocomplete="off" onsubmit="">
    <input type="email" name="email" id="email" required="" maxlength="50" placeholder="Email address">
    <button type="submit">전송</button>
</form>
<button type="button" class="close closeEmailForm">닫기</button>
</div>

    </article>
</div>
<%@include file ="../footer.jsp" %>
</body>
</html>