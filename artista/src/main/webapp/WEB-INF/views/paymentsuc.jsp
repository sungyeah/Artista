<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/paymentsuc.css">
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
            <section class="order-info"><section class="address-info"><h3>수취인 정보</h3><ul><li>수취인명</li><li>홍성호<span class="subphone"></span></li></ul><ul><li>주소</li><li>
                                
                                    세종특별자치시 대평로 34(대평동, 해들마을4단지)<br class="subaddress"> 해들마을 420동1601호
                                
                            </li></ul></section>
                            <section class="pay-info cf"><h3>결제 정보</h3><ul class="first"><li>주문작품</li><li>총 1점</li></ul><ul class="first"><li>결제방식</li><li>
                                
                                    
                                        신용/체크카드
                                    
                                
                            </li></ul><ul><li>결제카드</li><li>NH카드</li></ul><ul><li class="total">결제금액</li><li class="total">￦ 100,000</li></ul>
                        </section></section>
        </section>
        <a href="mypage" class="order_detail">주문내역 확인</a>
        <!-- <a href="/account/orders/6366NS823022/" class="order_detail">주문내역 확인</a> -->
    </div>
</body>
</html>