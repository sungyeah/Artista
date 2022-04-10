<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/custom.css">
    <link rel="stylesheet" href="../css/style2.css">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/layout.css">
    <style>
        .hgroup {
    max-width: 1640px;
    margin: 0 auto 50px;
    padding: 4px 15px 0;
    text-align: center;
    margin-top: 100px;
}
.hgroup .author {
    margin-top: 6px;
}
.hgroup .date, .hgroup .author {
    font-size: 1.125em;
    color: #666;
}
.hgroup:after {
    content: "";
    display: block;
    width: 2px;
    height: 73px;
    margin: 34px auto 0;
    background-color: #333;
}
.hgroup h1 {
    margin-bottom: 22px;
    font-weight: 300;
    font-size: 3.125em;
    line-height: 1.32;
    color: #222;
}
    </style>
</head>

<body>
<%@include file ="../header.jsp" %>
    <div id="wrap">
        <div id="container">
            <style>
                [name=fingerFrint] {
                    position: absolute;
                    bottom: 0;
                    left: 0;
                }

                /* .my-gallery figure{
                height:100%;
                min-height:600px;
            } */
                .card_layout.type02 .card_box .conts .my-gallery figure img,
                .card_layout.type02 .card_box .conts .my-gallery figure video,
                .card_layout.type02 .card_box .conts .my-gallery figure audio,
                .card_layout.type02 .card_box .conts .my-gallery figure iframe {
                    position: absolute !important;
                    right: 0 !important;
                    width: 100% !important;
                    height: 100% !important;
                    min-height: 100% !important;
                    min-width: 100% !important;
                    max-width: inherit !important;
                    max-height: inherit !important;
                    left: 50% !important;
                    transform: translateX(-50%) !important;
                }

                .card_layout.type02 .card_box .conts .my-gallery figure img,
                .card_layout.type02 .card_box .conts .my-gallery figure video,
                .card_layout.type02 .card_box .conts .my-gallery figure audio {
                    object-fit: cover;
                }

                .card_layout.type02 .card_box .conts .my-gallery figure a>div {
                    width: 100% !important;
                    height: fit-content !important;
                    position: static !important;
                }

                .card_layout.type02 .card_box .bar::after {
                    background-image: url("/images/black_token_logo.png") !important;
                }

                @media all and (max-width:640px) {
                    [name=fingerFrint] {
                        top: 0;
                        left: 0;
                    }

                    /* .my-gallery figure{
                    min-height:100vw;
                } */
                }
            </style>

            <section class="detail">
            	<form id="form2" action="payment" method="post">
                <!--상세페이지에만 들어가는 클래스입니다.-->
                	<input type="hidden" id="workNo" name="workNo" value="${work.workNo }">
                <div class="container">
                	
                    <input type="hidden" id="walletAddress">
                    <div class="person pc" style="padding:50px 0px;">
                        <div class="left">
                            <a href="/user?memberId=389" class="img">
                                <div class="user-thumbnail-div slv">
                                    <img class="user-thumbnail" style="width:50px !important;height:50px !important;"src="/mypage/artistprofile/${artist.artistImg }" alt="">
                                </div>
                            </a>
                            <div class="personInfo" style="margin-top: 20px;">
                                <h4>${artist.artistName }</h4>
                                <ul>
                                    <li><a href="#"><span id="spanFollowers">5</span>followers</a></li>
                                    <li><a href="#"><span>0</span>following</a></li>
                                </ul>
                                <a href="javascript:;" name="btnFollow" class="">Follow 
                                <!-- <span class="material-icons"style="font-size:1.1rem;vertical-align:middle;">favorite_border</span> -->
                                <img class="1" style="width:17.6px !important;height:17.6px !important;" src="../images/하트.png" alt="">
                                </a>
                            </div>
                        </div>
                        <div class="right">
                            <ul>
                                <li><a href="/user?memberId=389&amp;tab=cr">CREATIONS</a></li>
                                <li><a href="/user?memberId=389&amp;tab=co">COLLECTION</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="person mb" style="padding-top:50px;">
                        <div style="float:left;margin-right:10px;">
                            <a href="/user?memberId=389" class="img">
                                <div class="user-thumbnail-div slv">
                                    <span class="user-thumbnail"
                                        style="background-image:url(/contents/user/389/thumbnail.jpg)"></span>
                                </div>
                            </a>
                        </div>
                        <div style="float:right;">
                            <h4 style="font-size:1.1rem;">DragonChang</h4>
                            <div style="font-size:0.9rem;">
                                <a href="/user?memberId=389&amp;tab=cr">Creations</a> |
                                <a href="/user?memberId=389&amp;tab=co">Collection</a> |
                                <a href="javascript:;" name="btnFollow" class=" words">Follow</a>
                            </div>
                        </div>
                    </div>
                    <div class="artworkInfoWrap">
                        <div class="card_layout type02 artworks" style="width:100%;">
                            <div class="w50per card_lt">
                                <div class="card_box">
                                    <div class="bar">
                                        <div class="bar_inner">
                                        </div>
                                    </div>
                                    <div class="conts">
                                        <div class="frame">
                                            <div class="my-gallery w50per" itemscope=""
                                                itemtype="http://schema.org/ImageGallery" data-pswp-uid="1">
                                                <figure class="w50per">
                                                    <a href="">

                                                        <div style="position: relative; width: 100%; height: 100%;">
                                                            <div style="height: 100%;">
                                                            	<img src="/artistpage/workImg/${work.workImg }"style="width: 100%; height: 100%; max-width: 100%; max-height: 100%;">
                                                            	<!-- <video loop="" autoplay="" playsinline=""crossorigin="anonymous" style="display: none; width: 100%; height: 100%; max-width: 100%; max-height: 100%; user-select: none; pointer-events: none; cursor: default;">
                                                                    <source>
                                                                </video><audio loop="" crossorigin="anonymous"
                                                                    controls=""
                                                                    style="display: none; width: 100%; max-width: 100%; max-height: 100%;">
                                                                    <source>
                                                                </audio>
                                                                <iframe allowfullscreen="true"style="display: none; width: 100%; height: 600px; max-width: 100%; max-height: 100%; border: 0px;"></iframe> -->
                                                            </div>
                                                        </div>
                                                    </a>
                                                    <figcaption itemprop="caption description">
                                                        <span>${work.workName }</span>
                                                        <div class="fig">
                                                            <ul>
                                                                <li>DragonChang</li>
                                                                <li>Edition of One</li>

                                                            </ul>
                                                        </div>
                                                    </figcaption>
                                                </figure>

                                            </div>
                                            <!-- <div class="like_line"><span>253</span></div> -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="w50per card_rt">
                                <div class="topInfo">
                                    <h3 style="margin-bottom: 25px;">${work.workName }</h3>
                                    <div style="padding-left: 60px;margin-top: 25px;margin-bottom: 25px;">
                                      <div style="display: flex;margin-bottom: 20px;text-align: start;margin-left: 20px;">
                                        <div style="color: rgba(34,34,34,0.4); flex-shrink: 0;width: 76px;font-size: 15px;">작품번호</div>
                                        <div style="flex-grow: 1;font-size: 15px;">${work.workNo }</div>
                                    </div>
                                        <div style="display: flex;margin-bottom: 20px;text-align: start;margin-left: 20px;">
                                            <div style="color: rgba(34,34,34,0.4); flex-shrink: 0;width: 76px;font-size: 15px;">작가</div>
                                            <div style="flex-grow: 1;font-size: 15px;">${work.artistName }</div>
                                        </div>
                                    <div style="display: flex;margin-bottom: 20px;text-align: start;margin-left: 20px;">
                                        <div style="color: rgba(34,34,34,0.4); flex-shrink: 0;width: 76px;font-size: 15px;">작품정보</div>
                                        <div style="flex-grow: 1;font-size: 15px;">${work.workTech }<br>${work.workSize }</div>
                                    </div>
                                    <div style="display: flex;margin-bottom: 20px;text-align: start;margin-left: 20px;">
                                        <div style="color: rgba(34,34,34,0.4); flex-shrink: 0;width: 76px;font-size: 15px;">작품타입</div>
                                        <div style="flex-grow: 1;font-size: 15px;">${work.workType }</div>
                                    </div>
                                  
                                    <div style="display: flex;margin-bottom: 20px;text-align: start;margin-left: 20px;">
                                        <div style="color: rgba(34,34,34,0.4); flex-shrink: 0;width: 76px;font-size: 15px;margin-top: 3px;">작품가격</div>
                                        <div style="flex-grow: 1;font-size: 18px;"><b>￦<fmt:formatNumber value="${work.workPrice }"/></b></div>
                                    </div>
                                    
                                    </div>
                                     <!-- <div class="price">
                                        <span class="howmuch"><span name="price">￦4,500,000</span></span>
                                    </div> -->
                                    <!-- <div class="price">
                                        <span class="howmuch"><span name="price">￦4,500,000</span></span>
                                    </div> -->
                                    <div class="topInfoBtns">
                                        <button id="purchaseBtn" class="btnPurchase" style="width: 35%;font-size:1.2rem;padding:0 0 7px 0;vertical-align:middle;cursor:pointer;">
                                            <span class="fd-icon" style="background-image:url('/images/symbol-eth.svg');background-color:white;border-radius:50%;cursor:pointer;"></span>
                                                <span style="vertical-align:middle;cursor:pointer;">카트 추가</span>
                                        </button>
                                        <button id="purchaseBtn2" type="submit" class="btnPurchase" style="width: 35%;font-size:1.2rem;padding:0 0 7px 0;vertical-align:middle;margin-left: 5px;background: #222;color: white;">
                                            <span class="fd-icon"style="background-image:url('/images/symbol-eth.svg');background-color:white;border-radius:50%;"></span>
                                            <span style="vertical-align:middle;">작품 구매</span>
                                        </button>
                                    </div>
                                </div>
                                <!-- <div class="description">
                                    <span>Description</span>
                                    <pre>80년대 레트로 감성의 결정체 영화 “백투더 퓨쳐”를 그린 그림으로 2편의 포스터에서 자동차 내부에서 나오는 빛의 밝기를 줄이고 배경을 갈색톤으로 처리하는 방식으로 재해석해 작업을 진행 하였다. 나는 이 그림을 통하여 레트로에대한 향수를 만끽하고자 하였고 개인적으로 운동화를 수집하는 사람으로서 영화에 등장하는 운동화에 대한 애정을 담으려 노력하였다.</pre>
                                </div> -->

                            </div>
                        </div>
                    </div>
                    <div class="hgroup">
                        <p class="author"></p>
                        <h1>Description</h1>
                    </div>
                    <p style="max-width: 710px;margin: 0 auto 1.75em;font-weight: 300;line-height: 1.75;letter-spacing: 0.05em;color: #666;margin-bottom: 200px;">
                        ${work.workIntro }
                    </p>
                   </form>
            </section>
    	
    <input type="hidden" id="id" name="id" value="">
    <input type="hidden" id="workName" name="workName" value="${work.workName }">
    <input type="hidden" id="workPrice" name="workPrice" value="${work.workPrice }">
    <input type="hidden" id="artistName" name="artistName" value="${work.artistName }">
    <input type="hidden" id="workSize" name="workSize" value="${work.workSize }">
    <input type="hidden" id="workNo" name="workNo" value="${work.workNo }">
    <input type="hidden" id="workImg" name="workImg" value="${work.workImg }">
        </div>

    </div>
    
    	
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
var id = '<%=(String)session.getAttribute("id")%>';
$('#id').attr('value',id);
var workName = $('#workName').val()
var workPrice = $('#workPrice').val()
var artistName = $('#artistName').val()
var workSize = $('#workSize').val()
var workNo = $('#workNo').val()
var workImg = $('#workImg').val()
var Cart={"id":id,"workName":workName,"workPrice":workPrice,"workArtist":artistName,"workSize":workSize,"workNo":workNo,"workImg":workImg} 

	$('#purchaseBtn').click(function(){
		  $.ajax({     
				type:"post",
				url:"http://localhost:8090/addCart",
				contentType : "application/json",
				data:JSON.stringify(Cart),
				success: function(data, textStatus){
					if(data=="true"){
						alert("이미 카트에 담긴 작품입니다.")
					}else{
						alert("카트에 작품이 담겼습니다.")
					}
				},
				error:function(data, textStatus){
					alert("실패");
				}
			}); 
	});
	
</script>
<%@include file ="../footer.jsp" %>
</body>

</html>