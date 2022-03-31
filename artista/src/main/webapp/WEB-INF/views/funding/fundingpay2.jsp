<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/fundingpay2.css">
</head>
<style>

    </style>
<body>
    <section id="checkout_list">
        <section id="artworks">
            <h3>후원 정보</h3>
            <div class="mbtn_more martwork active">
                <input type="button" id="artworks_more_btn" class="active">
                <span class="active-hide-text">총 1점</span>
            </div>
            <div class="sect-list active">
                <div class="checkout-artwork-list">
                    
                        <div class="checkout-item">
                            <div class="checkout-img">
                                <img src="https://og-data.s3.amazonaws.com/media/artworks/h_fixed/A0365/A0365-0017.jpg">
                            </div>
                            <ul class="checkout-text">
                                <li class="code">프로젝트 이름</li>
                                <li class="title">작가 이름</li>
                            </ul>
                        </div>
                    
                </div>
                <ul class="checkout-billing-total cf">
                    <li>결제금액</li>
                    <li>
                        <span id="artworks-totalPrice">50,000</span>원
                    </li>
                </ul>
            </div>
        </section>
        <div class="acceptlist">
            <span class="accept">
                <input id="payMethod_Card" class="checkbox" type="checkbox" value="ok1" checked="checked">
                <label for="payMethod_Card">개인정보 사용 동의 <a href="https://naver.com">자세히</a></label>
            </span><br>
            <span class="accept">
                <input id="payMethod_DirectBank" class="checkbox" type="checkbox" value="ok2">
                <label for="payMethod_DirectBank">후원 유의사항 확인 <a href="https://naver.com">자세히</a></label>
            </span>
        </div>
        <div class="btnlist">
            <button class="Btn">결제</button>
            <button class="Btn">취소</button>
        </div>
        </section>
</body>
</html>