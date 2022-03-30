<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <div id="contents">
        <section class="pageHead" id="checkout_head">
            <div class="pageHead-bar"></div>
            <h2 class="pageHead-title">후원하기</h2>
        </section>
        <section id="checkout_body" class="cf">
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
                                <span>밥줘</span>
                            </div>
                        </div>
                    </div>
                    <div class="sect-body cf">
                        <div class="sect-body-th">전화번호</div>
                        <div class="sect-body-td">
                            <div class="checkout-profile-box">
                                <input type="hidden" id="billing_phone1" name="billing_phone1">
                                <span>010-0210-1231</span>
                            </div>
                        </div>
                    </div>
                    <div class="sect-body cf">
                        <div class="sect-body-th">이메일</div>
                        <div class="sect-body-td">
                            <div class="checkout-profile-box">
                                <input type="hidden" id="checkout-input-billing_email" name="billing_email">
                                <span>test01@naver.com</span>
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
                            <span class="active-hide-text">
                                총 <span id="payment-header-totalPrice">340,000</span>원
                            </span>
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
                                                        <span id="id-payMethod_DirectBank" class="method active">
                                                            <input id="payMethod_DirectBank" class="checkbox_payment" type="radio" name="pay_method" value="trans">
                                                            <label for="payMethod_DirectBank">카카오페이</label>
                                                        </span>
                                                        <span class="method active">
                                                            <input id="payMethod_VBank" class="checkbox_payment" type="radio" name="pay_method" value="vbank">
                                                            <label for="payMethod_VBank">가상계좌(무통장입금)</label>
                                                        </span>
                                                    
                                                </div>
                                            </div>
                                            <div class="sect-body cf">
                                                <div class="sect-body-th mpaytotal">결제금액</div>
                                                <div class="sect-body-td mprice">
                                                    <span id="payment-totalPrice">50,000</span>원
                                                </div>
                                            </div>
                </div>
                </section>
                <div id="checkout_submitRow">
                    <input id="go_checkout" class="next_step" type="button" value="다음">
                </div>
            </section>
    </div>
    
</body>
</html>