<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/fundingpay.css">
</head>
<style>

</style>
<body>
	 <%@include file ="../header.jsp" %>
    <div id="contents">
        <section class="pageHead" id="checkout_head">
            <div class="pageHead-bar"></div>
            <h2 class="pageHead-title">후원하기</h2>
        </section>
        <section id="checkout_body" class="cf">
        <form action="fundingpay2" id="fundingpay2" method="post">
            <section id="billing_info">
                <div class="sect-header">
                    <h3>후원자 정보</h3>
                    <div class="mbtn_more active">
                        <input type="button" id="billing_more_btn" class="active">
                        <span class="active-hide-text">
                            <span id="billing_name_dsp">밥줘</span>
                        </span>
                    </div>
                </div>
                <div id="checkout-profile" class="sect-info active certified">
                    
                    <div class="sect-body cf">
                        <div class="sect-body-th">후원자명</div>
                        <div class="sect-body-td">
                            <div class="checkout-profile-box">
                                <input type="hidden" id="billing_name" name="billing_name">
                                <span>${mem.name }</span>
                            </div>
                        </div>
                    </div>
                    <c:choose>
                    	<c:when test="${empty mem.contact }">
                    		
                    	</c:when>
                    	<c:otherwise>
                    		<div class="sect-body cf">
                        <div class="sect-body-th">휴대폰</div>
                        <div class="sect-body-td">
                            <div class="checkout-profile-box">
                                <input type="hidden" id="billing_phone1" name="billing_phone1">
                                <span>${mem.contact }</span>
                            </div>
                        </div>
                    </div>
                    	</c:otherwise>
                    </c:choose>
                    <div class="sect-body cf">
                        <div class="sect-body-th">이메일</div>
                        <div class="sect-body-td">
                            <div class="checkout-profile-box">
                                <input type="hidden" id="checkout-input-billing_email" name="billing_email">
                                <span>${mem.email}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
                <section id="payment" class="Type_p">
                    <div class="sect-header">
                        <h3>결제 정보</h3>
                        <div class="mbtn_more active">
                            <input type="button" id="payment_more_btn" class="active">
							
                        </div>
                    </div>
                    <div class="sect-info active certified">
                                            <div id="payMethod" class="sect-body cf">
                                                <div class="sect-body-th">결제방식</div>
                                                <div class="sect-body-td">
                                                    
                                                        <span class="method checked">
                                                            <input id="payMethod_Card" class="checkbox_payment" type="radio" name="pay_method" value="card" checked="checked">
                                                            <label for="payMethod_Card">신용카드</label>
                                                        </span>
                                                </div>
                                            </div>
                                            <div class="sect-body cf">
                                                <div class="sect-body-th mpaytotal">결제금액</div>
                                                <div class="sect-body-td mprice">
                                                    <span id="payment-totalPrice"><fmt:formatNumber value="${sponsorAmount}" /></span>원
                               							<input type="hidden" id="sponsorAmount" name="sponsorAmount" value='${sponsorAmount}'>
                               							<input type="hidden" id="fundingNo" name="fundingNo" value="${fundingNo }">
                                                </div>
                                            </div>
                </div>
                </section>
                <div id="checkout_submitRow">
                    <input id="go_checkout" class="next_step" type="submit" value="다음">
                </div>
                </form>
            </section>
    </div>
    <%@include file ="../footer.jsp" %>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
    console.log($('#fundingNo').val());
    </script>
</body>
</html>