<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
            <!-- <script src="js/jquery-3.4.1.js"></script>
            <script src="js/slick.js"></script>
            <script src="js/script.js"></script> -->
            <link rel="stylesheet" type="text/css" href="css/store.css">
</head>
<body>
<%@include file ="../header.jsp" %>
<section>

                <div class="container2">
                    <!-- <div class="topBtns" style="margin: 0 82.5px;">
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
                    </div> -->
                    <div class="scrollList">
                        <div class="list">
                            <div class="images card_list" id="itemList" style="height: 1777.55px;margin: 0 82.5px;">
                            	<c:forEach var="work" items="${works}" varStatus="status">
                            	<%-- <div class="image" style="width: 100%; transform: translate(${(status.index % 3) * 100}%, ${works[status.index-3] == null ? 0 : works[status.index-3].workPrice}px);"> --%>
                            	<div class="image" style="width: 290px; transform: translate(${(status.index % 4) * 103}%, ${works[status.index-4] == null ? 0 : works[status.index-4].workHeight+9}px);">
                            	 <div data-brackets-id="2440" class="card_b only-mb">
                                        <a data-brackets-id="2441" href=#
                                            class="whole">${work.workName }</a>
                                        <div data-brackets-id="2442" class="card_b_img">
                                            <div class="item-type-icon icon-fdview"></div>
                                            <div data-brackets-id="2443" class="i_empty"></div>
                                            <div data-brackets-id="2444" class="i_box">
                                                <img data-brackets-id="2445"
                                                    src="/artistpage/workImg/${work.workImg }"
                                                    alt="">
                                            </div>
                                        </div>
                                        <div data-brackets-id="2446" class="card_b_info">
                                            <h3 data-brackets-id="2447">${work.workName }</h3>
                                            <div data-brackets-id="2448" class="info">
                                                <div data-brackets-id="2449" class="left">
                                                    <a data-brackets-id="2450" href="#">
                                                        <span data-brackets-id="2451" class="img user-thumbnail-div gld"
                                                            style="max-width:100px;border:3px solid transparent;"><img
                                                                class="user-thumbnail" data-brackets-id="2452"
                                                                src="/mypage/artistprofile/${img[status.index] } " alt=""></span>
                                                        <b data-brackets-id="2453">${work.artistName }</b>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div data-brackets-id="2454" class="card_b_btm">
                                            <div data-brackets-id="2455" class="left">
                                                <span class="price" name="price" pri="1900000" pricd="03"
                                                    style="display:inline-block;margin:0;">￦${work.workPrice }</span> <span
                                                    name="exchange"
                                                    style="display:inline-block;margin:0;font-size:0.7rem;color:#ccc;">
                                                    </span>

                                            </div>
                                        </div>
                                    </div>
                                    <c:choose>
                                    <c:when test="${work.workForSale == 1 }">
                                    	<a href="storedetail/${work.workNo }" style="width:100%;" class="only-pc">
                                        <div class="box">
                                            <div class="b01">
                                                <div name="viewer" class="img">
                                                    <div class="item-type-icon icon-fdview"></div>
                                                    <div style="position: relative; width: 100%; height: 100%;">
                                                        <div style="height: 100%;"><img
                                                                src="/artistpage/workImg/${work.workImg }"
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
                                                            src="/mypage/artistprofile/${img[status.index] } " alt="">
                                                    </div>
                                                    <div class="p_top">
                                                        <h5>${work.workName }</h5>
                                                        <span class="artist artist3">${work.artistName }</span>
                                                       <span class="artist">￦<fmt:formatNumber value="${work.workPrice }"/></span>
                                                       <c:choose>
                                					   		<c:when test="${work.orderNo == -1 }">
                                					   			<h5>${work.workName }</h5>
                                					   			<span class="artist artist3">${work.artistName }</span>
                                							</c:when>
                                							<c:otherwise>
                                                       			<div class="artwork-detail-info-status red">판매됨</div>
                                							</c:otherwise>
                                						</c:choose>
                                                    </div>
                                                    <div class="p_btm">

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    	</a>
                                    </c:when>
                                    <c:otherwise>
                                    	<a href="workdetail/${work.workNo }" style="width:100%;" class="only-pc">
                                        <div class="box">
                                            <div class="b01">
                                                <div name="viewer" class="img">
                                                    <div class="item-type-icon icon-fdview"></div>
                                                    <div style="position: relative; width: 100%; height: 100%;">
                                                        <div style="height: 100%;"><img
                                                                src="/artistpage/workImg/${work.workImg }"
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
                                                            src="/mypage/artistprofile/${img[status.index] } " alt="">
                                                    </div>
                                                    <div class="p_top">
                                                        <h5>${work.workName }</h5>
                                                        <span class="artist artist3">${work.artistName }</span>
                                                       	<div class="artwork-detail-info-status" style="color:#a48e69;">전시용</div>
                                                    </div>
                                                    <div class="p_btm">

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    	</a>
                                    </c:otherwise>
                                    </c:choose>
                            	</div>	
                            	</c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
<%@include file ="../footer.jsp" %>
</body>
</html>