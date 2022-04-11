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
    <link rel="stylesheet" href="../css/paymentsuc.css">
    <style>
        
    </style>
</head>
<body>
    <div id="contents">
        <section class="pageHead" id="checkout_head">
            <div class="pageHead-bar"></div>
            <h2 class="pageHead-title">주문완료</h2>
            <div class="pageHead-description">
                Order Complete
            </div>
            <div id="checkoutSteps">
                <span class="checkoutStep">1. 카트</span><span class="checkoutStep">2. 주문결제</span><span class="checkoutStep checkoutStep-bold">3. 주문완료</span>
            </div>
        </section>
        <section id="checkout_body" class="complete">
            <section class="payment-title">
                <div class="payment-type">구매</div>
                <div class="payment-title-img"></div>
                <div class="payment-title-textbox">
                    <h3>주문이 성공적으로 완료되었습니다.</h3>
                    
                        <span>담당자가 확인하여 전화(1668-1056)로 연락드립니다.</span>
                    
                </div>
            </section>
            <c:choose>
            	<c:when test="${order.deliveryCharge eq '0' }">
            <section class="order-info"><section class="address-info">
            <h3>수령 정보</h3>
            <ul>
            <li>이름</li><li>(주)아티스타<span class="subphone"></span></li></ul><ul><li>주소</li><li>
                                
                                    서울특별시 강남구 언주로 508<br class="subaddress"> 서울상록빌딩 14층
                                
                            </li></ul></section>
                            <section class="pay-info cf"><h3>결제 정보</h3><ul class="first"><li>주문작품</li><li>총 ${order.ordercount }점</li></ul><ul class="first"><li>결제방식</li><li>
                                
                                    
                                        ${order.pay_method }
                                    
                                
                            </li></ul><ul><li>결제카드</li><li>NH카드</li></ul><ul><li class="total">결제금액</li><li class="total">￦ <fmt:formatNumber value="${order.orderCost }"/></li></ul>
                        </section></section>
           		</c:when>
           		<c:otherwise>
           		<section class="order-info"><section class="address-info">
            <h3>수취인 정보</h3>
            <ul>
            <li>수취인명</li><li>${order.receiverName }<span class="subphone"></span></li></ul><ul><li>주소</li><li>
                                
                                    ${order.receiverAddress }<br class="subaddress"> ${order.receiverAddress2 }
                                
                            </li></ul></section>
                            <section class="pay-info cf"><h3>결제 정보</h3><ul class="first"><li>주문작품</li><li>총 ${order.ordercount }점</li></ul><ul class="first"><li>결제방식</li><li>
                                
                                    
                                        ${order.pay_method }
                                    
                                
                            </li></ul><ul><li>결제카드</li><li>국민카드</li></ul><ul><li class="total">결제금액</li><li class="total">￦ <fmt:formatNumber value="${order.orderCost }"/></li></ul>
                        </section></section>
           		</c:otherwise>
           </c:choose>
        </section>
        <a href="${pageContext.request.contextPath}/mypage" class="order_detail">주문내역 확인</a>
        <!-- <a href="/account/orders/6366NS823022/" class="order_detail">주문내역 확인</a> -->
    </div>
</body>
</html>