<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
            <script src="js/jquery-3.4.1.js"></script>
            <script src="js/slick.js"></script>
            <script src="js/script.js"></script>

            <link rel="stylesheet" type="text/css" href="css/store.css">
</head>
<body>
<%@include file ="../header.jsp" %>
<section>

                <div class="container2">
                    <div class="topBtns">
                        <ul class="topBtnsUl" id="categoryList">
                            <span>카테고리</span>


                            <li><a href="javascript:;" code="01">Art</a></li>

                        </ul>
                        

                        <select id="orderList" class="selectForm" style="position:relative;">
                            <option value="REG_DT DESC">최신순으로 정렬</option>
                            <option value="REG_DT ASC">오래된순으로 정렬</option>
                            <option value="FIXED_PRICE ASC">낮은 가격순으로 정렬</option>
                            <option value="FIXED_PRICE DESC">높은 가격순으로 정렬</option>
                            <option value="VIEW_COUNT DESC">인기순으로 정렬</option>

                        </select>
                    </div>
                    <div class="scrollList">
                        <div class="list">
                            <div class="images card_list" id="itemList" style="height: 1777.55px;">
                                <div class="image" style="width: 100%; transform: translate(0%, 0px);">
                                    <div data-brackets-id="2440" class="card_b only-mb">
                                        <a data-brackets-id="2441" href=#
                                            class="whole">Boss</a>
                                        <div data-brackets-id="2442" class="card_b_img">
                                            <div class="item-type-icon icon-fdview"></div>
                                            <div data-brackets-id="2443" class="i_empty"></div>
                                            <div data-brackets-id="2444" class="i_box">
                                                <img data-brackets-id="2445"
                                                    src="https://edenloop.net/contents/item/2022/01/06/75a47034-42f2-46bf-901b-967c92bc2d3d.jpg"
                                                    alt="">
                                            </div>
                                        </div>
                                        <div data-brackets-id="2446" class="card_b_info">
                                            <h3 data-brackets-id="2447">Boss</h3>
                                            <div data-brackets-id="2448" class="info">
                                                <div data-brackets-id="2449" class="left">
                                                    <a data-brackets-id="2450" href="#">
                                                        <span data-brackets-id="2451" class="img user-thumbnail-div gld"
                                                            style="max-width:100px;border:3px solid transparent;"><img
                                                                class="user-thumbnail" data-brackets-id="2452"
                                                                src="/contents/user/831/thumbnail.jpg" alt=""></span>
                                                        <b data-brackets-id="2453">Kim Won Geun</b>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div data-brackets-id="2454" class="card_b_btm">
                                            <div data-brackets-id="2455" class="left">
                                                <span class="price" name="price" pri="1900000" pricd="03"
                                                    style="display:inline-block;margin:0;">￦1,900,000</span> <span
                                                    name="exchange"
                                                    style="display:inline-block;margin:0;font-size:0.7rem;color:#ccc;">
                                                    ($1,568 Ξ0.5)</span>

                                            </div>
                                        </div>
                                    </div>
                                    <a href="storedetail/${work.workNo}" style="width:100%;"
                                        class="only-pc">
                                        <div class="box">
                                            <div class="b01">
                                                <div name="viewer" class="img">
                                                    <div class="item-type-icon icon-fdview"></div>
                                                    <div style="position: relative; width: 100%; height: 100%;">
                                                        <div style="height: 100%;"><img
                                                                src="https://edenloop.net/contents/item/2022/01/06/75a47034-42f2-46bf-901b-967c92bc2d3d.jpg"
                                                                style="width: 100%; height: 100%; max-width: 100%; max-height: 100%;"><video
                                                                loop="" autoplay="" playsinline=""
                                                                crossorigin="anonymous"
                                                                style="display: none; width: 100%; height: 100%; max-width: 100%; max-height: 100%; user-select: none; pointer-events: none; cursor: default;">
                                                                <source>
                                                            </video><audio loop="" crossorigin="anonymous" controls=""
                                                                style="display: none; width: 100%; max-width: 100%; max-height: 100%;">
                                                                <source>
                                                            </audio><iframe allowfullscreen="true"
                                                                style="display: none; width: 100%; height: 600px; max-width: 100%; max-height: 100%; border: 0px;"></iframe>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="b02" style="opacity: 1; display: none;">
                                                <div class="cont">
                                                    <div class="img user-thumbnail-div gld">
                                                        <img class="user-thumbnail"
                                                            style="width:50px !important;height:50px !important;"
                                                            src="/contents/user/831/thumbnail.jpg" alt="">
                                                    </div>
                                                    <div class="p_top">
                                                        <h5>Boss</h5>
                                                        <span class="artist artist3">Kim Won Geun</span>
                                                        <span class="artist">￦1,900,000 ($1,568 Ξ0.5)</span>
                                                    </div>
                                                    <div class="p_btm">

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="image" style="width: 100%; transform: translate(100%, 0px);">
                                    <div data-brackets-id="2440" class="card_b only-mb">
                                        <a data-brackets-id="2441" href="/item?iid=0E72A3A83E97BC13D8884434F89A7CED"
                                            class="whole">Pureman Namsik</a>
                                        <div data-brackets-id="2442" class="card_b_img">
                                            <div class="item-type-icon icon-fdview"></div>
                                            <div data-brackets-id="2443" class="i_empty"></div>
                                            <div data-brackets-id="2444" class="i_box">
                                                <img data-brackets-id="2445"
                                                    src="https://edenloop.net/contents/item/2022/01/06/4e4a70c1-8f45-4476-8789-33ca5b88765d.jpg"
                                                    alt="">
                                            </div>
                                        </div>
                                        <div data-brackets-id="2446" class="card_b_info">
                                            <h3 data-brackets-id="2447">Pureman Namsik</h3>
                                            <div data-brackets-id="2448" class="info">
                                                <div data-brackets-id="2449" class="left">
                                                    <a data-brackets-id="2450" href="#">
                                                        <span data-brackets-id="2451" class="img user-thumbnail-div gld"
                                                            style="max-width:100px;border:3px solid transparent;"><img
                                                                class="user-thumbnail" data-brackets-id="2452"
                                                                src="/contents/user/831/thumbnail.jpg" alt=""></span>
                                                        <b data-brackets-id="2453">Kim Won Geun</b>
                                                    </a>
                                                </div>

                                            </div>
                                        </div>
                                        <div data-brackets-id="2454" class="card_b_btm">
                                            <div data-brackets-id="2455" class="left">
                                                <span class="price" name="price" pri="2000000" pricd="03"
                                                    style="display:inline-block;margin:0;">￦2,000,000</span> <span
                                                    name="exchange"
                                                    style="display:inline-block;margin:0;font-size:0.7rem;color:#ccc;">
                                                    ($1,651 Ξ0.5)</span>
                                                <!-- <strong data-brackets-id="2456">Current bid</strong>
                                        <span data-brackets-id="2457" class="price">0.181 ETH</span> -->
                                            </div>
                                        </div>
                                    </div>
                                    <a href="/item?iid=0E72A3A83E97BC13D8884434F89A7CED" style="width:100%;"
                                        class="only-pc">
                                        <div class="box">
                                            <div class="b01">
                                                <div name="viewer" class="img">
                                                    <div class="item-type-icon icon-fdview"></div>
                                                    <div style="position: relative; width: 100%; height: 100%;">
                                                        <div style="height: 100%;"><img
                                                                src="https://edenloop.net/contents/item/2022/01/06/4e4a70c1-8f45-4476-8789-33ca5b88765d.jpg"
                                                                style="width: 100%; height: 100%; max-width: 100%; max-height: 100%;"><video
                                                                loop="" autoplay="" playsinline=""
                                                                crossorigin="anonymous"
                                                                style="display: none; width: 100%; height: 100%; max-width: 100%; max-height: 100%; user-select: none; pointer-events: none; cursor: default;">
                                                                <source>
                                                            </video><audio loop="" crossorigin="anonymous" controls=""
                                                                style="display: none; width: 100%; max-width: 100%; max-height: 100%;">
                                                                <source>
                                                            </audio><iframe allowfullscreen="true"
                                                                style="display: none; width: 100%; height: 600px; max-width: 100%; max-height: 100%; border: 0px;"></iframe>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="b02" style="opacity: 1; display: none;">
                                                <div class="cont">
                                                    <div class="img user-thumbnail-div gld">
                                                        <img class="user-thumbnail"
                                                            style="width:50px !important;height:50px !important;"
                                                            src="/contents/user/831/thumbnail.jpg" alt="">
                                                    </div>
                                                    <div class="p_top">
                                                        <h5>Pureman Namsik</h5>
                                                        <span class="artist artist3">Kim Won Geun</span>
                                                        <span class="artist">￦2,000,000 ($1,651 Ξ0.5)</span>
                                                    </div>
                                                    <div class="p_btm">

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="image" style="width: 100%; transform: translate(200%, 0px);">
                                    <div data-brackets-id="2440" class="card_b only-mb">
                                        <a data-brackets-id="2441" href="/item?iid=DB5F2E8CF8DBAC7ABA069DE82CBF3CBE"
                                            class="whole">Dreamy</a>
                                        <div data-brackets-id="2442" class="card_b_img">
                                            <div class="item-type-icon icon-fdview"></div>
                                            <div data-brackets-id="2443" class="i_empty"></div>
                                            <div data-brackets-id="2444" class="i_box">
                                                <img data-brackets-id="2445"
                                                    src="https://edenloop.net/contents/item/2022/01/06/fd52f30a-5ed1-4590-9d73-998593a67a0c.jpg"
                                                    alt="">
                                            </div>
                                        </div>
                                        <div data-brackets-id="2446" class="card_b_info">
                                            <h3 data-brackets-id="2447">Dreamy</h3>
                                            <div data-brackets-id="2448" class="info">
                                                <div data-brackets-id="2449" class="left">
                                                    <a data-brackets-id="2450" href="#">
                                                        <span data-brackets-id="2451" class="img user-thumbnail-div gld"
                                                            style="max-width:100px;border:3px solid transparent;"><img
                                                                class="user-thumbnail" data-brackets-id="2452"
                                                                src="/contents/user/831/thumbnail.jpg" alt=""></span>
                                                        <b data-brackets-id="2453">Kim Won Geun</b>
                                                    </a>
                                                </div>

                                            </div>
                                        </div>
                                        <div data-brackets-id="2454" class="card_b_btm">
                                            <div data-brackets-id="2455" class="left">
                                                <span class="price" name="price" pri="3000000" pricd="03"
                                                    style="display:inline-block;margin:0;">￦3,000,000</span> <span
                                                    name="exchange"
                                                    style="display:inline-block;margin:0;font-size:0.7rem;color:#ccc;">
                                                    ($2,476 Ξ0.7)</span>
                                                <!-- <strong data-brackets-id="2456">Current bid</strong>
                                        <span data-brackets-id="2457" class="price">0.181 ETH</span> -->
                                            </div>
                                        </div>
                                    </div>
                                    <a href="/item?iid=DB5F2E8CF8DBAC7ABA069DE82CBF3CBE" style="width:100%;"
                                        class="only-pc">
                                        <div class="box">
                                            <div class="b01">
                                                <div name="viewer" class="img">
                                                    <div class="item-type-icon icon-fdview"></div>
                                                    <div style="position: relative; width: 100%; height: 100%;">
                                                        <div style="height: 100%;"><img
                                                                src="https://edenloop.net/contents/item/2022/01/06/fd52f30a-5ed1-4590-9d73-998593a67a0c.jpg"
                                                                style="width: 100%; height: 100%; max-width: 100%; max-height: 100%;"><video
                                                                loop="" autoplay="" playsinline=""
                                                                crossorigin="anonymous"
                                                                style="display: none; width: 100%; height: 100%; max-width: 100%; max-height: 100%; user-select: none; pointer-events: none; cursor: default;">
                                                                <source>
                                                            </video><audio loop="" crossorigin="anonymous" controls=""
                                                                style="display: none; width: 100%; max-width: 100%; max-height: 100%;">
                                                                <source>
                                                            </audio><iframe allowfullscreen="true"
                                                                style="display: none; width: 100%; height: 600px; max-width: 100%; max-height: 100%; border: 0px;"></iframe>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="b02" style="opacity: 1; display: none;">
                                                <div class="cont">
                                                    <div class="img user-thumbnail-div gld">
                                                        <img class="user-thumbnail"
                                                            style="width:50px !important;height:50px !important;"
                                                            src="/contents/user/831/thumbnail.jpg" alt="">
                                                    </div>
                                                    <div class="p_top">
                                                        <h5>Dreamy</h5>
                                                        <span class="artist artist3">Kim Won Geun</span>
                                                        <span class="artist">￦3,000,000 ($2,476 Ξ0.7)</span>
                                                    </div>
                                                    <div class="p_btm">

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="image" style="width: 100%; transform: translate(0%, 296.844px);">
                                    <div data-brackets-id="2440" class="card_b only-mb">
                                        <a data-brackets-id="2441" href="/item?iid=8A15B45E7CF76F7052279C690EAE5E28"
                                            class="whole">Smart Man</a>
                                        <div data-brackets-id="2442" class="card_b_img">
                                            <div class="item-type-icon icon-fdview"></div>
                                            <div data-brackets-id="2443" class="i_empty"></div>
                                            <div data-brackets-id="2444" class="i_box">
                                                <img data-brackets-id="2445"
                                                    src="https://edenloop.net/contents/item/2022/01/06/90fda4cf-a5e6-4bff-89d1-a8d92c010e8d.jpg"
                                                    alt="">
                                            </div>
                                        </div>
                                        <div data-brackets-id="2446" class="card_b_info">
                                            <h3 data-brackets-id="2447">Smart Man</h3>
                                            <div data-brackets-id="2448" class="info">
                                                <div data-brackets-id="2449" class="left">
                                                    <a data-brackets-id="2450" href="#">
                                                        <span data-brackets-id="2451" class="img user-thumbnail-div gld"
                                                            style="max-width:100px;border:3px solid transparent;"><img
                                                                class="user-thumbnail" data-brackets-id="2452"
                                                                src="/contents/user/831/thumbnail.jpg" alt=""></span>
                                                        <b data-brackets-id="2453">Kim Won Geun</b>
                                                    </a>
                                                </div>

                                            </div>
                                        </div>
                                        <div data-brackets-id="2454" class="card_b_btm">
                                            <div data-brackets-id="2455" class="left">
                                                <span class="price" name="price" pri="2300000" pricd="03"
                                                    style="display:inline-block;margin:0;">￦2,300,000</span> <span
                                                    name="exchange"
                                                    style="display:inline-block;margin:0;font-size:0.7rem;color:#ccc;">
                                                    ($1,898 Ξ0.6)</span>
                                                <!-- <strong data-brackets-id="2456">Current bid</strong>
                                        <span data-brackets-id="2457" class="price">0.181 ETH</span> -->
                                            </div>
                                        </div>
                                    </div>
                                    <a href="/item?iid=8A15B45E7CF76F7052279C690EAE5E28" style="width:100%;"
                                        class="only-pc">
                                        <div class="box">
                                            <div class="b01">
                                                <div name="viewer" class="img">
                                                    <div class="item-type-icon icon-fdview"></div>
                                                    <div style="position: relative; width: 100%; height: 100%;">
                                                        <div style="height: 100%;"><img
                                                                src="https://edenloop.net/contents/item/2022/01/06/90fda4cf-a5e6-4bff-89d1-a8d92c010e8d.jpg"
                                                                style="width: 100%; height: 100%; max-width: 100%; max-height: 100%;"><video
                                                                loop="" autoplay="" playsinline=""
                                                                crossorigin="anonymous"
                                                                style="display: none; width: 100%; height: 100%; max-width: 100%; max-height: 100%; user-select: none; pointer-events: none; cursor: default;">
                                                                <source>
                                                            </video><audio loop="" crossorigin="anonymous" controls=""
                                                                style="display: none; width: 100%; max-width: 100%; max-height: 100%;">
                                                                <source>
                                                            </audio><iframe allowfullscreen="true"
                                                                style="display: none; width: 100%; height: 600px; max-width: 100%; max-height: 100%; border: 0px;"></iframe>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="b02" style="opacity: 1; display: none;">
                                                <div class="cont">
                                                    <div class="img user-thumbnail-div gld">
                                                        <img class="user-thumbnail"
                                                            style="width:50px !important;height:50px !important;"
                                                            src="/contents/user/831/thumbnail.jpg" alt="">
                                                    </div>
                                                    <div class="p_top">
                                                        <h5>Smart Man</h5>
                                                        <span class="artist artist3">Kim Won Geun</span>
                                                        <span class="artist">￦2,300,000 ($1,898 Ξ0.6)</span>
                                                    </div>
                                                    <div class="p_btm">
 
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="image" style="width: 100%; transform: translate(100%, 296.844px);">
                                    <div data-brackets-id="2440" class="card_b only-mb">
                                        <a data-brackets-id="2441" href="/item?iid=DE296D6BB0FA048BEB93513DD0E908D8"
                                            class="whole">Airport Man</a>
                                        <div data-brackets-id="2442" class="card_b_img">
                                            <div class="item-type-icon icon-fdview"></div>
                                            <div data-brackets-id="2443" class="i_empty"></div>
                                            <div data-brackets-id="2444" class="i_box">
                                                <img data-brackets-id="2445"
                                                    src="https://edenloop.net/contents/item/2022/01/06/b3061aa3-b30a-43d7-a7a2-75edc8e8e18e.jpg"
                                                    alt="">
                                            </div>
                                        </div>
                                        <div data-brackets-id="2446" class="card_b_info">
                                            <h3 data-brackets-id="2447">Airport Man</h3>
                                            <div data-brackets-id="2448" class="info">
                                                <div data-brackets-id="2449" class="left">
                                                    <a data-brackets-id="2450" href="#">
                                                        <span data-brackets-id="2451" class="img user-thumbnail-div gld"
                                                            style="max-width:100px;border:3px solid transparent;"><img
                                                                class="user-thumbnail" data-brackets-id="2452"
                                                                src="/contents/user/831/thumbnail.jpg" alt=""></span>
                                                        <b data-brackets-id="2453">Kim Won Geun</b>
                                                    </a>
                                                </div>

                                            </div>
                                        </div>
                                        <div data-brackets-id="2454" class="card_b_btm">
                                            <div data-brackets-id="2455" class="left">
                                                <span class="price" name="price" pri="2900000" pricd="03"
                                                    style="display:inline-block;margin:0;">￦2,900,000</span> <span
                                                    name="exchange"
                                                    style="display:inline-block;margin:0;font-size:0.7rem;color:#ccc;">
                                                    ($2,394 Ξ0.7)</span>
                                                <!-- <strong data-brackets-id="2456">Current bid</strong>
                                        <span data-brackets-id="2457" class="price">0.181 ETH</span> -->
                                            </div>
                                        </div>
                                    </div>
                                    <a href="/item?iid=DE296D6BB0FA048BEB93513DD0E908D8" style="width:100%;"
                                        class="only-pc">
                                        <div class="box">
                                            <div class="b01">
                                                <div name="viewer" class="img">
                                                    <div class="item-type-icon icon-fdview"></div>
                                                    <div style="position: relative; width: 100%; height: 100%;">
                                                        <div style="height: 100%;"><img
                                                                src="https://edenloop.net/contents/item/2022/01/06/b3061aa3-b30a-43d7-a7a2-75edc8e8e18e.jpg"
                                                                style="width: 100%; height: 100%; max-width: 100%; max-height: 100%;"><video
                                                                loop="" autoplay="" playsinline=""
                                                                crossorigin="anonymous"
                                                                style="display: none; width: 100%; height: 100%; max-width: 100%; max-height: 100%; user-select: none; pointer-events: none; cursor: default;">
                                                                <source>
                                                            </video><audio loop="" crossorigin="anonymous" controls=""
                                                                style="display: none; width: 100%; max-width: 100%; max-height: 100%;">
                                                                <source>
                                                            </audio><iframe allowfullscreen="true"
                                                                style="display: none; width: 100%; height: 600px; max-width: 100%; max-height: 100%; border: 0px;"></iframe>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="b02" style="opacity: 1; display: none;">
                                                <div class="cont">
                                                    <div class="img user-thumbnail-div gld">
                                                        <img class="user-thumbnail"
                                                            style="width:50px !important;height:50px !important;"
                                                            src="/contents/user/831/thumbnail.jpg" alt="">
                                                    </div>
                                                    <div class="p_top">
                                                        <h5>Airport Man</h5>
                                                        <span class="artist artist3">Kim Won Geun</span>
                                                        <span class="artist">￦2,900,000 ($2,394 Ξ0.7)</span>
                                                    </div>
                                                    <div class="p_btm">
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="image" style="width: 100%; transform: translate(200%, 296.844px);">
                                    <div data-brackets-id="2440" class="card_b only-mb">
                                        <a data-brackets-id="2441" href="/item?iid=C2F918C2F8D41FDF544E83FDFDB7D507"
                                            class="whole">Cat standing up</a>
                                        <div data-brackets-id="2442" class="card_b_img">
                                            <div class="item-type-icon icon-fdview"></div>
                                            <div data-brackets-id="2443" class="i_empty"></div>
                                            <div data-brackets-id="2444" class="i_box">
                                                <img data-brackets-id="2445"
                                                    src="https://edenloop.net/contents/item/2022/01/06/0e19fb0d-f03d-472f-a9a0-8debae370ef5.jpg"
                                                    alt="">
                                            </div>
                                        </div>
                                        <div data-brackets-id="2446" class="card_b_info">
                                            <h3 data-brackets-id="2447">Cat standing up</h3>
                                            <div data-brackets-id="2448" class="info">
                                                <div data-brackets-id="2449" class="left">
                                                    <a data-brackets-id="2450" href="#">
                                                        <span data-brackets-id="2451" class="img user-thumbnail-div slv"
                                                            style="max-width:100px;border:3px solid transparent;"><img
                                                                class="user-thumbnail" data-brackets-id="2452"
                                                                src="/contents/user/832/thumbnail.jpg" alt=""></span>
                                                        <b data-brackets-id="2453">SeMin Cho</b>
                                                    </a>
                                                </div>
                                                
                                            </div>
                                        </div>
                                        <div data-brackets-id="2454" class="card_b_btm">
                                            <div data-brackets-id="2455" class="left">
                                                <span class="price" name="price" pri="1500000" pricd="03"
                                                    style="display:inline-block;margin:0;">￦1,500,000</span> <span
                                                    name="exchange"
                                                    style="display:inline-block;margin:0;font-size:0.7rem;color:#ccc;">
                                                    ($1,238 Ξ0.4)</span>
                                                <!-- <strong data-brackets-id="2456">Current bid</strong>
                                        <span data-brackets-id="2457" class="price">0.181 ETH</span> -->
                                            </div>
                                        </div>
                                    </div>
                                    <a href="/item?iid=C2F918C2F8D41FDF544E83FDFDB7D507" style="width:100%;"
                                        class="only-pc">
                                        <div class="box">
                                            <div class="b01">
                                                <div name="viewer" class="img">
                                                    <div class="item-type-icon icon-fdview"></div>
                                                    <div style="position: relative; width: 100%; height: 100%;">
                                                        <div style="height: 100%;"><img
                                                                src="https://edenloop.net/contents/item/2022/01/06/0e19fb0d-f03d-472f-a9a0-8debae370ef5.jpg"
                                                                style="width: 100%; height: 100%; max-width: 100%; max-height: 100%;"><video
                                                                loop="" autoplay="" playsinline=""
                                                                crossorigin="anonymous"
                                                                style="display: none; width: 100%; height: 100%; max-width: 100%; max-height: 100%; user-select: none; pointer-events: none; cursor: default;">
                                                                <source>
                                                            </video><audio loop="" crossorigin="anonymous" controls=""
                                                                style="display: none; width: 100%; max-width: 100%; max-height: 100%;">
                                                                <source>
                                                            </audio><iframe allowfullscreen="true"
                                                                style="display: none; width: 100%; height: 600px; max-width: 100%; max-height: 100%; border: 0px;"></iframe>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="b02" style="opacity: 1; display: none;">
                                                <div class="cont">
                                                    <div class="img user-thumbnail-div slv">
                                                        <img class="user-thumbnail"
                                                            style="width:50px !important;height:50px !important;"
                                                            src="/contents/user/832/thumbnail.jpg" alt="">
                                                    </div>
                                                    <div class="p_top">
                                                        <h5>Cat standing up</h5>
                                                        <span class="artist artist3">SeMin Cho</span>
                                                        <span class="artist">￦1,500,000 ($1,238 Ξ0.4)</span>
                                                    </div>
                                                    <div class="p_btm">
                                                       
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="image" style="width: 100%; transform: translate(0%, 593.688px);">
                                    <div data-brackets-id="2440" class="card_b only-mb">
                                        <a data-brackets-id="2441" href="/item?iid=F291218F2D9D7E9A2A78700C8E73C11A"
                                            class="whole">Welcome with seven open arms</a>
                                        <div data-brackets-id="2442" class="card_b_img">
                                            <div class="item-type-icon icon-fdview"></div>
                                            <div data-brackets-id="2443" class="i_empty"></div>
                                            <div data-brackets-id="2444" class="i_box">
                                                <img data-brackets-id="2445"
                                                    src="https://edenloop.net/contents/item/2022/01/06/b759c729-4cec-4957-9e38-fe51d2cd0570.jpg"
                                                    alt="">
                                            </div>
                                        </div>
                                        <div data-brackets-id="2446" class="card_b_info">
                                            <h3 data-brackets-id="2447">Welcome with seven open arms</h3>
                                            <div data-brackets-id="2448" class="info">
                                                <div data-brackets-id="2449" class="left">
                                                    <a data-brackets-id="2450" href="#">
                                                        <span data-brackets-id="2451" class="img user-thumbnail-div slv"
                                                            style="max-width:100px;border:3px solid transparent;"><img
                                                                class="user-thumbnail" data-brackets-id="2452"
                                                                src="/contents/user/832/thumbnail.jpg" alt=""></span>
                                                        <b data-brackets-id="2453">SeMin Cho</b>
                                                    </a>
                                                </div>
                                                
                                            </div>
                                        </div>
                                        <div data-brackets-id="2454" class="card_b_btm">
                                            <div data-brackets-id="2455" class="left">
                                                <span class="price" name="price" pri="2100000" pricd="03"
                                                    style="display:inline-block;margin:0;">￦2,100,000</span> <span
                                                    name="exchange"
                                                    style="display:inline-block;margin:0;font-size:0.7rem;color:#ccc;">
                                                    ($1,733 Ξ0.5)</span>
                                                <!-- <strong data-brackets-id="2456">Current bid</strong>
                                        <span data-brackets-id="2457" class="price">0.181 ETH</span> -->
                                            </div>
                                        </div>
                                    </div>
                                    <a href="/item?iid=F291218F2D9D7E9A2A78700C8E73C11A" style="width:100%;"
                                        class="only-pc">
                                        <div class="box">
                                            <div class="b01">
                                                <div name="viewer" class="img">
                                                    <div class="item-type-icon icon-fdview"></div>
                                                    <div style="position: relative; width: 100%; height: 100%;">
                                                        <div style="height: 100%;"><img
                                                                src="https://edenloop.net/contents/item/2022/01/06/b759c729-4cec-4957-9e38-fe51d2cd0570.jpg"
                                                                style="width: 100%; height: 100%; max-width: 100%; max-height: 100%;"><video
                                                                loop="" autoplay="" playsinline=""
                                                                crossorigin="anonymous"
                                                                style="display: none; width: 100%; height: 100%; max-width: 100%; max-height: 100%; user-select: none; pointer-events: none; cursor: default;">
                                                                <source>
                                                            </video><audio loop="" crossorigin="anonymous" controls=""
                                                                style="display: none; width: 100%; max-width: 100%; max-height: 100%;">
                                                                <source>
                                                            </audio><iframe allowfullscreen="true"
                                                                style="display: none; width: 100%; height: 600px; max-width: 100%; max-height: 100%; border: 0px;"></iframe>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="b02" style="opacity: 1; display: none;">
                                                <div class="cont">
                                                    <div class="img user-thumbnail-div slv">
                                                        <img class="user-thumbnail"
                                                            style="width:50px !important;height:50px !important;"
                                                            src="/contents/user/832/thumbnail.jpg" alt="">
                                                    </div>
                                                    <div class="p_top">
                                                        <h5>Welcome with seven open arms</h5>
                                                        <span class="artist artist3">SeMin Cho</span>
                                                        <span class="artist">￦2,100,000 ($1,733 Ξ0.5)</span>
                                                    </div>
                                                    <div class="p_btm">
                                                       
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="image" style="width: 100%; transform: translate(100%, 593.688px);">
                                    <div data-brackets-id="2440" class="card_b only-mb">
                                        <a data-brackets-id="2441" href="/item?iid=5ACC3E14BD630155859BF0A823325D69"
                                            class="whole">Joker</a>
                                        <div data-brackets-id="2442" class="card_b_img">
                                            <div class="item-type-icon "></div>
                                            <div data-brackets-id="2443" class="i_empty"></div>
                                            <div data-brackets-id="2444" class="i_box">
                                                <img data-brackets-id="2445"
                                                    src="https://edenloop.net/contents/item/2021/11/16/530c844f-12ac-41b0-9671-430d5c73edf7.jpg"
                                                    alt="">
                                            </div>
                                        </div>
                                        <div data-brackets-id="2446" class="card_b_info">
                                            <h3 data-brackets-id="2447">Joker</h3>
                                            <div data-brackets-id="2448" class="info">
                                                <div data-brackets-id="2449" class="left">
                                                    <a data-brackets-id="2450" href="#">
                                                        <span data-brackets-id="2451" class="img user-thumbnail-div slv"
                                                            style="max-width:100px;border:3px solid transparent;"><img
                                                                class="user-thumbnail" data-brackets-id="2452"
                                                                src="/contents/user/389/thumbnail.jpg" alt=""></span>
                                                        <b data-brackets-id="2453">DragonChang</b>
                                                    </a>
                                                </div>
                                                
                                            </div>
                                        </div>
                                        <div data-brackets-id="2454" class="card_b_btm">
                                            <div data-brackets-id="2455" class="left">
                                                <span class="price" name="price" pri="3200000" pricd="03"
                                                    style="display:inline-block;margin:0;">￦3,200,000</span> <span
                                                    name="exchange"
                                                    style="display:inline-block;margin:0;font-size:0.7rem;color:#ccc;">
                                                    ($2,641 Ξ0.8)</span>
                                                <!-- <strong data-brackets-id="2456">Current bid</strong>
                                        <span data-brackets-id="2457" class="price">0.181 ETH</span> -->
                                            </div>
                                        </div>
                                    </div>
                                    <a href="/item?iid=5ACC3E14BD630155859BF0A823325D69" style="width:100%;"
                                        class="only-pc">
                                        <div class="box">
                                            <div class="b01">
                                                <div name="viewer" class="img">
                                                    <div class="item-type-icon "></div>
                                                    <div style="position: relative; width: 100%; height: 100%;">
                                                        <div style="height: 100%;"><img
                                                                src="https://edenloop.net/contents/item/2021/11/16/530c844f-12ac-41b0-9671-430d5c73edf7.jpg"
                                                                style="width: 100%; height: 100%; max-width: 100%; max-height: 100%;"><video
                                                                loop="" autoplay="" playsinline=""
                                                                crossorigin="anonymous"
                                                                style="display: none; width: 100%; height: 100%; max-width: 100%; max-height: 100%; user-select: none; pointer-events: none; cursor: default;">
                                                                <source>
                                                            </video><audio loop="" crossorigin="anonymous" controls=""
                                                                style="display: none; width: 100%; max-width: 100%; max-height: 100%;">
                                                                <source>
                                                            </audio><iframe allowfullscreen="true"
                                                                style="display: none; width: 100%; height: 600px; max-width: 100%; max-height: 100%; border: 0px;"></iframe>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="b02" style="opacity: 1; display: none;">
                                                <div class="cont">
                                                    <div class="img user-thumbnail-div slv">
                                                        <img class="user-thumbnail"
                                                            style="width:50px !important;height:50px !important;"
                                                            src="/contents/user/389/thumbnail.jpg" alt="">
                                                    </div>
                                                    <div class="p_top">
                                                        <h5>Joker</h5>
                                                        <span class="artist artist3">DragonChang</span>
                                                        <span class="artist">￦3,200,000 ($2,641 Ξ0.8)</span>
                                                    </div>
                                                    <div class="p_btm">
                                                       
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="image" style="width: 100%; transform: translate(200%, 593.688px);">
                                    <div data-brackets-id="2440" class="card_b only-mb">
                                        <a data-brackets-id="2441" href="/item?iid=0BDD9A62D70DCC70972B2DA664393842"
                                            class="whole">Joker</a>
                                        <div data-brackets-id="2442" class="card_b_img">
                                            <div class="item-type-icon "></div>
                                            <div data-brackets-id="2443" class="i_empty"></div>
                                            <div data-brackets-id="2444" class="i_box">
                                                <img data-brackets-id="2445"
                                                    src="https://edenloop.net/contents/item/2021/11/16/d132146c-a72d-4222-b25a-b824a8ad0f64.jpg"
                                                    alt="">
                                            </div>
                                        </div>
                                        <div data-brackets-id="2446" class="card_b_info">
                                            <h3 data-brackets-id="2447">Joker</h3>
                                            <div data-brackets-id="2448" class="info">
                                                <div data-brackets-id="2449" class="left">
                                                    <a data-brackets-id="2450" href="#">
                                                        <span data-brackets-id="2451" class="img user-thumbnail-div slv"
                                                            style="max-width:100px;border:3px solid transparent;"><img
                                                                class="user-thumbnail" data-brackets-id="2452"
                                                                src="/contents/user/389/thumbnail.jpg" alt=""></span>
                                                        <b data-brackets-id="2453">DragonChang</b>
                                                    </a>
                                                </div>
                                                
                                            </div>
                                        </div>
                                        <div data-brackets-id="2454" class="card_b_btm">
                                            <div data-brackets-id="2455" class="left">
                                                <span class="price" name="price" pri="3450000" pricd="03"
                                                    style="display:inline-block;margin:0;">￦3,450,000</span> <span
                                                    name="exchange"
                                                    style="display:inline-block;margin:0;font-size:0.7rem;color:#ccc;">
                                                    ($2,848 Ξ0.8)</span>
                                                <!-- <strong data-brackets-id="2456">Current bid</strong>
                                        <span data-brackets-id="2457" class="price">0.181 ETH</span> -->
                                            </div>
                                        </div>
                                    </div>
                                    <a href="/item?iid=0BDD9A62D70DCC70972B2DA664393842" style="width:100%;"
                                        class="only-pc">
                                        <div class="box">
                                            <div class="b01">
                                                <div name="viewer" class="img">
                                                    <div class="item-type-icon "></div>
                                                    <div style="position: relative; width: 100%; height: 100%;">
                                                        <div style="height: 100%;"><img
                                                                src="https://edenloop.net/contents/item/2021/11/16/d132146c-a72d-4222-b25a-b824a8ad0f64.jpg"
                                                                style="width: 100%; height: 100%; max-width: 100%; max-height: 100%;"><video
                                                                loop="" autoplay="" playsinline=""
                                                                crossorigin="anonymous"
                                                                style="display: none; width: 100%; height: 100%; max-width: 100%; max-height: 100%; user-select: none; pointer-events: none; cursor: default;">
                                                                <source>
                                                            </video><audio loop="" crossorigin="anonymous" controls=""
                                                                style="display: none; width: 100%; max-width: 100%; max-height: 100%;">
                                                                <source>
                                                            </audio><iframe allowfullscreen="true"
                                                                style="display: none; width: 100%; height: 600px; max-width: 100%; max-height: 100%; border: 0px;"></iframe>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="b02" style="opacity: 1; display: none;">
                                                <div class="cont">
                                                    <div class="img user-thumbnail-div slv">
                                                        <img class="user-thumbnail"
                                                            style="width:50px !important;height:50px !important;"
                                                            src="/contents/user/389/thumbnail.jpg" alt="">
                                                    </div>
                                                    <div class="p_top">
                                                        <h5>Joker</h5>
                                                        <span class="artist artist3">DragonChang</span>
                                                        <span class="artist">￦3,450,000 ($2,848 Ξ0.8)</span>
                                                    </div>
                                                    <div class="p_btm">
                                                       
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="image" style="width: 100%; transform: translate(0%, 890.532px);">
                                    <div data-brackets-id="2440" class="card_b only-mb">
                                        <a data-brackets-id="2441" href="/item?iid=DDD8D69EC32021E808DE0A823ED772C8"
                                            class="whole">Scared People: Death</a>
                                        <div data-brackets-id="2442" class="card_b_img">
                                            <div class="item-type-icon "></div>
                                            <div data-brackets-id="2443" class="i_empty"></div>
                                            <div data-brackets-id="2444" class="i_box">
                                                <img data-brackets-id="2445"
                                                    src="https://edenloop.net/contents/item/2021/11/08/f6e7cb9d-9b36-49da-8de1-d93d0a96e9a5.jpg"
                                                    alt="">
                                            </div>
                                        </div>
                                        <div data-brackets-id="2446" class="card_b_info">
                                            <h3 data-brackets-id="2447">Scared People: Death</h3>
                                            <div data-brackets-id="2448" class="info">
                                                <div data-brackets-id="2449" class="left">
                                                    <a data-brackets-id="2450" href="#">
                                                        <span data-brackets-id="2451" class="img user-thumbnail-div gld"
                                                            style="max-width:100px;border:3px solid transparent;"><img
                                                                class="user-thumbnail" data-brackets-id="2452"
                                                                src="/contents/user/405/thumbnail.jpg" alt=""></span>
                                                        <b data-brackets-id="2453">SoulEom</b>
                                                    </a>
                                                </div>
                                               
                                            </div>
                                        </div>
                                        <div data-brackets-id="2454" class="card_b_btm">
                                            <div data-brackets-id="2455" class="left">
                                                <span class="price" name="price" pri="8500000" pricd="03"
                                                    style="display:inline-block;margin:0;">￦8,500,000</span> <span
                                                    name="exchange"
                                                    style="display:inline-block;margin:0;font-size:0.7rem;color:#ccc;">
                                                    ($7,017 Ξ2.068)</span>
                                                <!-- <strong data-brackets-id="2456">Current bid</strong>
                                        <span data-brackets-id="2457" class="price">0.181 ETH</span> -->
                                            </div>
                                        </div>
                                    </div>
                                    <a href="/item?iid=DDD8D69EC32021E808DE0A823ED772C8" style="width:100%;"
                                        class="only-pc">
                                        <div class="box">
                                            <div class="b01">
                                                <div name="viewer" class="img">
                                                    <div class="item-type-icon "></div>
                                                    <div style="position: relative; width: 100%; height: 100%;">
                                                        <div style="height: 100%;"><img
                                                                src="https://edenloop.net/contents/item/2021/11/08/f6e7cb9d-9b36-49da-8de1-d93d0a96e9a5.jpg"
                                                                style="width: 100%; height: 100%; max-width: 100%; max-height: 100%;"><video
                                                                loop="" autoplay="" playsinline=""
                                                                crossorigin="anonymous"
                                                                style="display: none; width: 100%; height: 100%; max-width: 100%; max-height: 100%; user-select: none; pointer-events: none; cursor: default;">
                                                                <source>
                                                            </video><audio loop="" crossorigin="anonymous" controls=""
                                                                style="display: none; width: 100%; max-width: 100%; max-height: 100%;">
                                                                <source>
                                                            </audio><iframe allowfullscreen="true"
                                                                style="display: none; width: 100%; height: 600px; max-width: 100%; max-height: 100%; border: 0px;"></iframe>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="b02" style="opacity: 1; display: none;">
                                                <div class="cont">
                                                    <div class="img user-thumbnail-div gld">
                                                        <img class="user-thumbnail"
                                                            style="width:50px !important;height:50px !important;"
                                                            src="/contents/user/405/thumbnail.jpg" alt="">
                                                    </div>
                                                    <div class="p_top">
                                                        <h5>Scared People: Death</h5>
                                                        <span class="artist artist3">SoulEom</span>
                                                        <span class="artist">￦8,500,000 ($7,017 Ξ2.068)</span>
                                                    </div>
                                                    <div class="p_btm">
                                                       
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="image" style="width: 100%; transform: translate(100%, 1161.67px);">
                                    <div data-brackets-id="2440" class="card_b only-mb">
                                        <a data-brackets-id="2441" href="/item?iid=1DF2EE4ACCC3509E3414E8F33A4391A4"
                                            class="whole">Mathilda of Leon</a>
                                        <div data-brackets-id="2442" class="card_b_img">
                                            <div class="item-type-icon "></div>
                                            <div data-brackets-id="2443" class="i_empty"></div>
                                            <div data-brackets-id="2444" class="i_box">
                                                <img data-brackets-id="2445"
                                                    src="https://edenloop.net/contents/item/2021/11/05/bbed7e2d-f2e8-4c39-8ab6-b842d512f5c0.jpg"
                                                    alt="">
                                            </div>
                                        </div>
                                        <div data-brackets-id="2446" class="card_b_info">
                                            <h3 data-brackets-id="2447">Mathilda of Leon</h3>
                                            <div data-brackets-id="2448" class="info">
                                                <div data-brackets-id="2449" class="left">
                                                    <a data-brackets-id="2450" href="#">
                                                        <span data-brackets-id="2451" class="img user-thumbnail-div gld"
                                                            style="max-width:100px;border:3px solid transparent;"><img
                                                                class="user-thumbnail" data-brackets-id="2452"
                                                                src="/contents/user/405/thumbnail.jpg" alt=""></span>
                                                        <b data-brackets-id="2453">SoulEom</b>
                                                    </a>
                                                </div>
                                               
                                            </div>
                                        </div>
                                        <div data-brackets-id="2454" class="card_b_btm">
                                            <div data-brackets-id="2455" class="left">
                                                <span class="price" name="price" pri="5000000" pricd="03"
                                                    style="display:inline-block;margin:0;">￦5,000,000</span> <span
                                                    name="exchange"
                                                    style="display:inline-block;margin:0;font-size:0.7rem;color:#ccc;">
                                                    ($4,127 Ξ1.217)</span>
                                                <!-- <strong data-brackets-id="2456">Current bid</strong>
                                        <span data-brackets-id="2457" class="price">0.181 ETH</span> -->
                                            </div>
                                        </div>
                                    </div>
                                    <a href="/item?iid=1DF2EE4ACCC3509E3414E8F33A4391A4" style="width:100%;"
                                        class="only-pc">
                                        <div class="box">
                                            <div class="b01">
                                                <div name="viewer" class="img">
                                                    <div class="item-type-icon "></div>
                                                    <div style="position: relative; width: 100%; height: 100%;">
                                                        <div style="height: 100%;"><img
                                                                src="https://edenloop.net/contents/item/2021/11/05/bbed7e2d-f2e8-4c39-8ab6-b842d512f5c0.jpg"
                                                                style="width: 100%; height: 100%; max-width: 100%; max-height: 100%;"><video
                                                                loop="" autoplay="" playsinline=""
                                                                crossorigin="anonymous"
                                                                style="display: none; width: 100%; height: 100%; max-width: 100%; max-height: 100%; user-select: none; pointer-events: none; cursor: default;">
                                                                <source>
                                                            </video><audio loop="" crossorigin="anonymous" controls=""
                                                                style="display: none; width: 100%; max-width: 100%; max-height: 100%;">
                                                                <source>
                                                            </audio><iframe allowfullscreen="true"
                                                                style="display: none; width: 100%; height: 600px; max-width: 100%; max-height: 100%; border: 0px;"></iframe>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="b02" style="opacity: 1; display: none;">
                                                <div class="cont">
                                                    <div class="img user-thumbnail-div gld">
                                                        <img class="user-thumbnail"
                                                            style="width:50px !important;height:50px !important;"
                                                            src="/contents/user/405/thumbnail.jpg" alt="">
                                                    </div>
                                                    <div class="p_top">
                                                        <h5>Mathilda of Leon</h5>
                                                        <span class="artist artist3">SoulEom</span>
                                                        <span class="artist">￦5,000,000 ($4,127 Ξ1.217)</span>
                                                    </div>
                                                    <div class="p_btm">
                                                       
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="image" style="width: 100%; transform: translate(200%, 1246.27px);">
                                    <div data-brackets-id="2440" class="card_b only-mb">
                                        <a data-brackets-id="2441" href="/item?iid=840AE5644B5C3826DAB151B79E95181E"
                                            class="whole">2016 David Bowie X 33 Soul</a>
                                        <div data-brackets-id="2442" class="card_b_img">
                                            <div class="item-type-icon icon-video"></div>
                                            <div data-brackets-id="2443" class="i_empty"></div>
                                            <div data-brackets-id="2444" class="i_box">
                                                <img data-brackets-id="2445"
                                                    src="https://edenloop.net/contents/item/2021/09/17/ec822e5a-1bdf-4a7e-bd2f-2de8f8dffbf5.jpg"
                                                    alt="">
                                            </div>
                                        </div>
                                        <div data-brackets-id="2446" class="card_b_info">
                                            <h3 data-brackets-id="2447">2016 David Bowie X 33 Soul</h3>
                                            <div data-brackets-id="2448" class="info">
                                                <div data-brackets-id="2449" class="left">
                                                    <a data-brackets-id="2450" href="#">
                                                        <span data-brackets-id="2451" class="img user-thumbnail-div rbw"
                                                            style="max-width:100px;border:3px solid transparent;"><img
                                                                class="user-thumbnail" data-brackets-id="2452"
                                                                src="/contents/user/84/thumbnail.jpg" alt=""></span>
                                                        <b data-brackets-id="2453">TAEJOONG KIM</b>
                                                    </a>
                                                </div>
                                                
                                            </div>
                                        </div>
                                        <div data-brackets-id="2454" class="card_b_btm">
                                            <div data-brackets-id="2455" class="left">
                                                <span class="price" name="price" pri="1200000" pricd="03"
                                                    style="display:inline-block;margin:0;">￦1,200,000</span> <span
                                                    name="exchange"
                                                    style="display:inline-block;margin:0;font-size:0.7rem;color:#ccc;">
                                                    ($990 Ξ0.3)</span>
                                                 <strong data-brackets-id="2456">Current bid</strong>
                                        <span data-brackets-id="2457" class="price">0.181 ETH</span>
                                            </div>
                                        </div>
                                    </div>
                                    <a href="/item?iid=840AE5644B5C3826DAB151B79E95181E" style="width:100%;"
                                        class="only-pc">
                                        <div class="box">
                                            <div class="b01">
                                                <div name="viewer" class="img">
                                                    <div class="item-type-icon icon-video"></div>
                                                    <div style="position: relative; width: 100%; height: 100%;">
                                                        <div style="height: 100%;"><img
                                                                src="https://edenloop.net/contents/item/2021/09/17/ec822e5a-1bdf-4a7e-bd2f-2de8f8dffbf5.jpg"
                                                                style="width: 100%; height: 100%; max-width: 100%; max-height: 100%;"><video
                                                                loop="" autoplay="" playsinline=""
                                                                crossorigin="anonymous"
                                                                style="display: none; width: 100%; height: 100%; max-width: 100%; max-height: 100%; user-select: none; pointer-events: none; cursor: default;">
                                                                <source>
                                                            </video><audio loop="" crossorigin="anonymous" controls=""
                                                                style="display: none; width: 100%; max-width: 100%; max-height: 100%;">
                                                                <source>
                                                            </audio><iframe allowfullscreen="true"
                                                                style="display: none; width: 100%; height: 600px; max-width: 100%; max-height: 100%; border: 0px;"></iframe>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="b02" style="opacity: 1; display: none;">
                                                <div class="cont">
                                                    <div class="img user-thumbnail-div rbw">
                                                        <img class="user-thumbnail"
                                                            style="width:50px !important;height:50px !important;"
                                                            src="/contents/user/84/thumbnail.jpg" alt="">
                                                    </div>
                                                    <div class="p_top">
                                                        <h5>2016 David Bowie X 33 Soul</h5>
                                                        <span class="artist artist3">TAEJOONG KIM</span>
                                                        <span class="artist">￦1,200,000 ($990 Ξ0.3)</span>
                                                    </div>
                                                    <div class="p_btm">
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
<%@include file ="../footer.jsp" %>
</body>
</html>