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
    <link rel="stylesheet" href="../css/mypage.css">
<style>

</style>
</head>
<body>
 <%@include file ="../header.jsp" %>
    <div id="contents">
        <header class="account-header">
            <h2 class="account-header-title">마이 페이지</h2>
            <div class="account-header-description">고객님과 관련된 정보입니다.</div>
        </header>
        <div class="register2" style="display: flex;align-items: center; flex-direction: row-reverse;">
        	<img style="width: 24px;height: 24px;" src="images/rightarrow2.png">
            <a class="manager-nav-btn" href="${pageContext.request.contextPath}/mypage/apply">
                작가 등록
            </a>
        </div>
        <section class="account-guide">
            <div class="account-guide-inner">
                <h3 class="account-guide-name">
                    ${name}님 반갑습니다.
                </h3>
                <a class="account-modify-btn" href="mypage/mypagemodify" onclick="gaClickAccount('account_modify');">
                    <p>회원 정보</p>
                </a>
            </div>
        </section>
         <article class="member-body">
         </article>
        <article class="account-body">
            <section class="orders-in-progress">
                <h3>주문 내역</h3>
                <table class="account-table">
                    <thead>
                    <tr>
                        <th scope="col" class="time-code">주문번호</th>
                        <th scope="col" class="type">주문작품</th>
                        <th scope="col" class="artworks">주문일자</th>
                        <th scope="col" class="start-date">상품금액</th>
                        <th scope="col" class="status">현황</th>
                    </tr>
                    </thead>
                    <tbody>
                    	<c:choose> 
                    		<c:when test='${empty orders}'>
                         <tr>
                            <td class="empty" colspan="6">표시할 내역이 없습니다.</td>
                        </tr>
                        	</c:when>
                        	<c:otherwise> 
                        <c:forEach items="${orders }" var="order">
                        <tr>
                        	<td class="time-code"><a href="paymentinfo/${order.orderNo }">${order.orderNo }</a></td>
                        	<td class="artworks">
                        		 <c:forEach items="${order.workNo }" var="work"> 
                        		<왜곡3> 김소명<br>
                        		한지에 동양화 물감, 45x53cm<br>
                        		 </c:forEach> 
                        	</td>
                        	
                        	<td class="start-date">${order.orderDate }</td>
                        	<td class="start-date" style="font-weight: bold;"><fmt:formatNumber value="${order.orderCost }"/>원</td>
                        	<td class="status">${order.orderStatus }</td>
                        </tr>
                        </c:forEach>
                         </c:otherwise>
                    	</c:choose>   
                    </tbody>
                </table>
                <!-- <div class="m-account-table">
                    
                        <div class="m-account-table-card empty">
                            표시할 내역이 없습니다.
                        </div>
                    
                </div> -->
            </section>
            <section class="orders-completed">
                <h3>펀딩 정보</h3>
                <table class="account-table">
                    <thead>
                    <tr>
                        <th scope="col" class="time-code">펀딩번호</th>
                        <th scope="col" class="type">펀딩작품</th>
                        <th scope="col" class="artworks">후원날짜</th>
                        <th scope="col" class="status">현황</th>
                    </tr>
                    </thead>
                    <tbody>
                    
                        <tr>
                            <td class="empty" colspan="6">표시할 내역이 없습니다.</td>
                        </tr>
                    
                    </tbody>
                </table>
                <!-- <div class="m-account-table">
                    
                        <div class="m-account-table-card empty">
                            표시할 내역이 없습니다.
                        </div>
                    
                </div> -->
            </section>
            <section class="orders-completed">
                <h3>팔로우한 작가</h3>
                <div class="container1">
                <div class="register">
                    <div
                        style="margin: 5px; padding: 5px; display: flex; align-items: flex-start; justify-content: space-between;">
                        <span><img class="profile" src='images/profile.png' onerror="this.src='/profile/profile.png'"></span>
                        <div style="width: 140px">
                            <span><input type="text" id="title" value='아이디'
                                    style="width:130px;height: 30px; vertical-align: middle; font-weight: bold; font-size: 15px; border: none; background-color: white;text-overflow: ellipsis;"
                                    disabled> </span>
                        </div>
                        <div style="display: inline-block;line-height: 30px;font-size: small;">팔로우 취소</div>
                    </div>
                    <div
                        style="margin: 5px; margin-top: 30px; padding: 5px; vertical-align: middle;display: flex;justify-content: space-between;">
                        <div style="display: flex; margin-left: 20px;">
                            <span>
                                <div class="heart" style="height: 30px;margin-bottom:17px;margin-top: 1px;">작품수</div>
                            </span>
                            <span><input type="text" id="like" value='13'
                                    style="width: 30px; display: inline-block; vertical-align: middle; margin-bottom: 20px; font-size: 15px; font-weight: bold; border: none; background-color: white;margin-left: 5px;"
                                    disabled></span>
                        </div>
                        <div style="display: flex;margin-right: 20px;">
                            <span>
                                <div class="heart" style="height: 30px;margin-bottom:17px;margin-top: 1px;">팔로워</div>
                            </span>
                            <span><input type="text" id="like" value='13'
                                    style="width: 30px; display: inline-block; vertical-align: middle; margin-bottom: 20px; font-size: 15px; font-weight: bold; border: none; background-color: white;margin-left: 5px;"
                                    disabled></span>
                        </div>
                    </div>
                </div>
                <div class="register">
                    <div
                        style="margin: 5px; padding: 5px; display: flex; align-items: flex-start; justify-content: space-between;">
                        <span><img class="profile" src='images/profile.png' onerror="this.src='/profile/profile.png'"></span>
                        <div style="width: 140px">
                            <span><input type="text" id="title" value='아이디'
                                    style="width:130px;height: 30px; vertical-align: middle; font-weight: bold; font-size: 15px; border: none; background-color: white;text-overflow: ellipsis;"
                                    disabled> </span>
                        </div>
                        <div style="display: inline-block;line-height: 30px;font-size: small;">팔로우 취소</div>
                    </div>
                    <div
                        style="margin: 5px; margin-top: 30px; padding: 5px; vertical-align: middle;display: flex;justify-content: space-between;">
                        <div style="display: flex; margin-left: 20px;">
                            <span>
                                <div class="heart" style="height: 30px;margin-bottom:17px;margin-top: 1px;">작품수</div>
                            </span>
                            <span><input type="text" id="like" value='13'
                                    style="width: 30px; display: inline-block; vertical-align: middle; margin-bottom: 20px; font-size: 15px; font-weight: bold; border: none; background-color: white;margin-left: 5px;"
                                    disabled></span>
                        </div>
                        <div style="display: flex;margin-right: 20px;">
                            <span>
                                <div class="heart" style="height: 30px;margin-bottom:17px;margin-top: 1px;">팔로워</div>
                            </span>
                            <span><input type="text" id="like" value='13'
                                    style="width: 30px; display: inline-block; vertical-align: middle; margin-bottom: 20px; font-size: 15px; font-weight: bold; border: none; background-color: white;margin-left: 5px;"
                                    disabled></span>
                        </div>
                    </div>
                </div>
                <div class="register">
                    <div
                        style="margin: 5px; padding: 5px; display: flex; align-items: flex-start; justify-content: space-between;">
                        <span><img class="profile" src='images/profile.png' onerror="this.src='/profile/profile.png'"></span>
                        <div style="width: 140px">
                            <span><input type="text" id="title" value='아이디'
                                    style="width:130px;height: 30px; vertical-align: middle; font-weight: bold; font-size: 15px; border: none; background-color: white;text-overflow: ellipsis;"
                                    disabled> </span>
                        </div>
                        <div style="display: inline-block;line-height: 30px;font-size: small;">팔로우 취소</div>
                    </div>
                    <div
                        style="margin: 5px; margin-top: 30px; padding: 5px; vertical-align: middle;display: flex;justify-content: space-between;">
                        <div style="display: flex; margin-left: 20px;">
                            <span>
                                <div class="heart" style="height: 30px;margin-bottom:17px;margin-top: 1px;">작품수</div>
                            </span>
                            <span><input type="text" id="like" value='13'
                                    style="width: 30px; display: inline-block; vertical-align: middle; margin-bottom: 20px; font-size: 15px; font-weight: bold; border: none; background-color: white;margin-left: 5px;"
                                    disabled></span>
                        </div>
                        <div style="display: flex;margin-right: 20px;">
                            <span>
                                <div class="heart" style="height: 30px;margin-bottom:17px;margin-top: 1px;">팔로워</div>
                            </span>
                            <span><input type="text" id="like" value='13'
                                    style="width: 30px; display: inline-block; vertical-align: middle; margin-bottom: 20px; font-size: 15px; font-weight: bold; border: none; background-color: white;margin-left: 5px;"
                                    disabled></span>
                        </div>
                    </div>
                </div>
            </div>
            </section>
        </article>
    </div>
     <%@include file ="../footer.jsp" %>
   
</body>
</html>