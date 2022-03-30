<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/cart.css">
</head>
<body>
    <div id="contents">
        <section class="pageHead" id="checkout_head">
            <div class="pageHead-bar"></div>
            <h2 class="pageHead-title">카트</h2>
            <div class="pageHead-description">
                Cart
            </div>
            <div id="checkoutSteps">
                <span class="checkoutStep checkoutStep-bold">1. 카트</span><span class="checkoutStep">2. 주문결제</span><span class="checkoutStep">3. 주문완료</span>
            </div>
        </section>
        <section id="cartBody">
            <form method="post" action="/checkout/" id="cartForm">
                <input type="hidden" name="csrfmiddlewaretoken" value="zEQTTX2dH04N75nRqOgUhc4WpKvEKXudYC2IwAeyhZ8ddPv1KpUIHKq7YePVXnij">
                <input type="hidden" name="order_type" value="P">
                <table id="cartList">
                    <thead>
                    <tr>
                        <th scope="col" class="cartList-checkbox">
                            <input type="checkbox" class="cartList-checkAll" id="cartList-checkAll-1">
                            <label for="cartList-checkAll-1"></label>
                        </th>
                        <th scope="col" class="cartList-thInfo">작품정보</th>
                        <th scope="col" class="cartList-thPrice">구매가격</th>
                        <th scope="col" class="cartList-thRemove"></th>
                    </tr>
                    </thead>
                    <tbody>
                    
                        <tr>
                            <td class="cartList-checkbox">
                                <input type="checkbox" class="cartList-checkEach" id="cartList-checkEach-1" name="order_artwork" value="14213" data-code="A0365-0017" data-amount="300000" checked="checked">
                                <label for="cartList-checkEach-1"></label>
                            </td>
                            <td class="cartList-tdInfo">
                                <a class="cartList-imageHolder" href="/artwork/A0365-0017/">
                                    <img class="cartList-image" src="https://og-data.s3.amazonaws.com/media/artworks/h_fixed/A0365/A0365-0017.jpg">
                                </a>
                                <div class="cartList-info">
                                    <p class="cartList-info-code"><a href="/artwork/A0365-0017/">A0365-0017</a></p>
                                    <p class="cartList-info-title"><a href="/artwork/A0365-0017/">송대공원</a></p>
                                    <p class="cartList-info-extra">
                                        <a href="/artist/A0365/#artworks">추연신</a>
                                        <span class="cartList-info-slash">/</span>
                                        <br class="cartList-info-br">
                                        45x38cm (8호)
                                    </p>
                                    <p class="cartList-info-price">
                                        
                                            ￦ 300,000
                                        
                                    </p>
                                </div>
                            </td>
                            <td class="cartList-tdPrice">
                                
                                    ￦ 300,000
                                
                            </td>
                            <td class="cartList-tdRemove">
                                <input type="button" class="cartList-removeEach" value="삭제" onclick="opg.fn.remove_from_cart('p', 'A0365-0017');">
                            </td>
                        </tr>
                    
                    </tbody>
                    <tfoot>
                    <!-- <tr>
                         <td class="cartList-checkbox">
                            <input type="checkbox" class="cartList-checkAll" id="cartList-checkAll-2">
                            <label for="cartList-checkAll-2"></label>
                        </td> 
                        <td colspan="2">
                            <input type="button" id="cartList-function-remove" class="cartList-function" value="삭제">
                            <input type="button" id="cartList-function-collect" class="cartList-function" value="마이컬렉션에 추가">
                        </td>
                         <td class="cartList-tdDummy"></td>
                    </tr> -->
                    </tfoot>
                </table>
                <div id="cartBoard" class="cf">
                    <ul id="cartBoard-ul">
                        <li class="cartBoard-li cf">
                            <span class="cartBoard-label">총 작품수</span>
                            <span class="cartBoard-value">
                                <span id="cartBoard-val-artworkCount">1</span> 점
                            </span>
                        </li>
                        <li class="cartBoard-li cf">
                            <span class="cartBoard-label">총 구매가격</span>
                            <span class="cartBoard-value">
                                ￦ <span id="cartBoard-val-amount">300,000</span>
                            </span>
                        </li>
                        <li class="cartBoard-li cf">
                            <span class="cartBoard-label">배송비</span>
                            <span class="cartBoard-value">수령 방법, 지역 등에 따라 변동</span>
                        </li>
                    </ul>
                </div>
                <div id="cartNotice">
                    <p>배송비는 수령 방법, 지역, 작품 사이즈, 작품 수에 따라 변동됩니다.</p>
                    <p>작품의 액자 유무에 따라 추가 비용이 발생 할 수 있습니다.</p>
                    <p>수도권 일부 지역에 한하여 요청 시 오픈갤러리 전문인력을 통한 출장 및 설치가 가능하며, 추가 비용이 발생합니다.</p>
                </div>
                <div id="cartBottom">
                    <a href="/discover/"><input type="button" class="cartBottom-btn" id="toDiscoverBtn" value="작품 더 고르기"></a>
                    <a href="payment"><input type="button" class="cartBottom-btn" id="toCheckoutBtn" value="주문결제"></a>
                    <!-- <a href="payment.html"><input type="submit" class="cartBottom-btn" id="toCheckoutBtn" value="주문결제"></a> -->
                </div>
            </form>
        </section>
    </div>
</body>
</html>