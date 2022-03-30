<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/payment.css">
<style>
    
</style>
</head>
<body>
    <div id="contents">
        <section class="pageHead" id="checkout_head">
            <div class="pageHead-bar"></div>
            <h2 class="pageHead-title">주문결제</h2>
            <div class="pageHead-description">Checkout</div>
            <div id="checkoutSteps">
                <span class="checkoutStep">1. 카트</span><span class="checkoutStep checkoutStep-bold">2. 주문결제</span><span class="checkoutStep">3. 주문완료</span>
            </div>
        </section>
        <section id="checkout_body" class="cf">
            <section id="checkout_value">
                <section id="billing_info">
                    <div class="sect-header">
                        <h3>주문자 정보</h3>
                        <span>계약서에 기재될 정보입니다. (입력 내용은 회원 정보에 반영됩니다.)</span>
                        <div class="mbtn_more active">
                            <input type="button" id="billing_more_btn" class="active">
                            <span class="active-hide-text">
                                <span id="billing_name_dsp">홍성호</span>
                            </span>
                        </div>
                    </div>
                    <div id="checkout-profile" class="sect-info active certified">
                        
                        <div class="sect-body cf">
                            <div class="sect-body-th">주문자명</div>
                            <div class="sect-body-td">
                                <div class="checkout-profile-box">
                                    <input type="hidden" id="billing_name" name="billing_name" value="홍성호">
                                    <span>홍성호</span>
                                </div>
                            </div>
                        </div>
                        <div class="sect-body cf">
                            <div class="sect-body-th">주소</div>
                            <div class="sect-body-td">
                                <input type="text" id="billing_address1" class="address1" name="billing_address1" value="세종특별자치시 대평로 34(대평동, 해들마을4단지)" placeholder="기본 주소" readonly="readonly">
                                <input id="billing_address_btn" class="address-btn" type="button" value="주소 찾기" readonly="readonly"><br>
                                <input type="text" id="billing_address2" class="address2" name="billing_address2" value="해들마을 420동1601호" placeholder="상세 주소">
                            </div>
                        </div>
                        <div class="sect-body cf">
                            <div class="sect-body-th">휴대폰</div>
                            <div class="sect-body-td">
                                <div class="checkout-profile-box">
                                    <input type="hidden" id="billing_phone1" name="billing_phone1" value="010-4012-9131">
                                    <span>010-4012-9131</span>
                                    <!-- <input type="button" id="checkout-profile-recertifyButton" value="변경"> -->
                                </div>
                            </div>
                        </div>
                        <div class="sect-body cf">
                            <div class="sect-body-th">이메일</div>
                            <div class="sect-body-td">
                                <div class="checkout-profile-box">
                                    <input type="hidden" id="checkout-input-billing_email" name="billing_email" value="ghdtjdgh0810@nate.com">
                                    <span>ghdtjdgh0810@nate.com</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                
                    <section id="receive">
                        <div class="sect-header">
                            <h3>수령 방법</h3>
                            <div class="mbtn_more active">
                                <input type="button" id="receive_more_btn" class="active">
                            </div>
                        </div>
                        <div class="sect-info active">
                            <div class="sect-body active cf">
                                <div class="sect-body-th">수령</div>
                                <div class="sect-body-td">
                                    <div id="receive-innerContainer">
                                        <div id="method1" class="method checked active">
                                            <input id="receive-radio-delivery" class="checkbox_receive" type="radio" name="how_to_receive" value="D" checked="checked">
                                            <label for="receive-radio-delivery">배송</label>
                                            <div id="receive-card-delivery" class="receive-card cf active show">
                                                <ul>
                                                    <li>배송비</li>
                                                    <li>소요 기간</li>
                                                </ul>
                                                <ul>
                                                    <li> 40,000원</li>
                                                    <li>평균 5~8 영업일</li>
                                                </ul>
                                                <div class="receive-card-desc">
                                                    <span>작품의 액자 유무에 따라 추가 비용이 발생할 수 있습니다.</span><br>
                                                    <span>작품은 전문 포장 후 안전하게 배송됩니다.</span><br>
                                                    <span>25호 이상 사이즈, 변형 사이즈 작품 주문 시 배송비는카카오톡 상담 후 별도 결제됩니다.</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="method2" class="method">
                                            <input id="receive-radio-visited" class="checkbox_receive" type="radio" name="how_to_receive" value="V">
                                            <label for="receive-radio-visited">방문수령</label>
                                            <div id="receive-card-visited" class="receive-card cf">
                                                <ul>
                                                    <li>배송비</li>
                                                    <li>수령 가능일</li>
                                                    <li>방문 시간</li>
                                                    <li>주소</li>
                                                </ul>
                                                <ul>
                                                    <li>무료</li>
                                                    <li>평균 5 영업일 이후</li>
                                                    <li>평일 오전 10시 ~ 오후 6시</li>
                                                    <li>서울 성동구 성수동1가 656-75<br> 헤이그라운드 서울숲점 7층
                                                    </li>
                                                </ul>
                                                <div class="receive-card-desc">
                                                    <span>방문 일정 협의를 위해 담당자가 전화 연락을 드립니다.협의 날짜 전에 방문 시 작품 수령이 어려우니 유의 부탁드립니다.</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                
                <section id="shipping_info">
                    <div class="sect-header">
                        <h3>수취인 정보</h3>
                        <span>작품이 실제 설치될 곳의 정보입니다.</span>
                        <div class="mbtn_more active">
                            <input type="button" id="shipping_more_btn" class="active">
                            <span class="active-hide-text">
                                <span id="shipping_name_dsp">홍성호</span>
                            </span>
                        </div>
                    </div>
                    <div class="sect-info active">
                        <div class="sect-body cf">
                            <div class="sect-body-th mpaste"></div>
                            <div class="sect-body-td">
                                <input type="button" id="shipping-copy_button" value="주문자 정보와 동일" class="" onclick="duplication()">
                            </div>
                        </div>
                        <div class="sect-info-body cf">
                            <div class="sect-body cf">
                                <div class="sect-body-th">수취인명</div>
                                <div class="sect-body-td">
                                    <input type="text" id="shipping_name" name="shipping_name" placeholder="이름">
                                </div>
                            </div>
                            <div class="sect-body cf">
                                <div class="sect-body-th">주소</div>
                                <div class="sect-body-td">
                                    <input type="text" id="shipping_address1" class="address1" name="shipping_address1" placeholder="기본 주소"><input id="shipping_address_btn" class="address-btn" type="button" value="주소 찾기" readonly="readonly"><br><input type="text" id="shipping_address2" name="shipping_address2" class="address2" placeholder="상세 주소">
                                </div>
                            </div>
                            <div class="sect-body cf">
                                <div class="sect-body-th">휴대폰</div>
                                <div class="sect-body-td">
                                    <input type="text" id="shipping_phone" name="shipping_phone" placeholder="이름">
                                </div>
                            </div>
                            <div class="sect-copy-address-mask"></div>
                        </div>
                    </div>
                </section>
                
            </section>
            <section id="checkout_list">
                <section id="artworks">
                    <h3>주문 작품 정보<span> / <span>1</span>점</span></h3>
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
                                        <li class="code">A0365-0017</li>
                                        <li class="title">송대공원</li>
                                        <li class="sub">
                                            추연신 / 45x38cm (8호)
                                        </li>
                                        <li class="value">
                                            
                                                ￦ 300,000
                                            
                                        </li>
                                    </ul>
                                </div>
                            
                        </div>
                        <div class="checkout-billing-value cf">
                            <ul class="checkout-billing-title">
                                <li>작품 수</li>
                                
                                    <li>구매가격</li>
                                    <li>배송비</li>
                                
                            </ul>
                            <ul class="checkout-billing-info">
                                <li>1점</li>
                                
                                    <li>300,000원</li>
                                    <li>
                                        <span id="artworks-shippingFee-purchase">40,000원</span>
                                    </li>
                                
                            </ul>
                        </div>
                        <ul class="checkout-billing-total cf">
                            <li>총 결제금액</li>
                            <li>
                                <span id="artworks-totalPrice">340,000</span>원
                            </li>
                        </ul>
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
                    <div id="payMethod" class="sect-body cf">
                        <div class="sect-body-th">결제방식</div>
                        <div class="sect-body-td">
                            
                                <span class="method checked">
                                    <input id="payMethod_Card" class="checkbox_payment" type="radio" name="pay_method" value="card" checked="checked">
                                    <label for="payMethod_Card">신용/체크카드</label>
                                </span>
                                <span id="id-payMethod_DirectBank" class="method active">
                                    <input id="payMethod_DirectBank" class="checkbox_payment" type="radio" name="pay_method" value="trans">
                                    <label for="payMethod_DirectBank">실시간 계좌이체</label>
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
                            <span id="payment-totalPrice">340,000</span>원
                        </div>
                    </div>
                </section>
                <div id="checkout_submitRow">
                    <input id="input_tst" type="hidden" name="tst" value="1648449975.960295">
                    <!-- <input id="go_checkout" class="next_step" type="button" value="결제하기"> -->
                    <input id="go_checkout" class="next_step" type="button" value="결제하기" onclick="location.href='paymentsuc'">
                </div>
            </section>
        </section>
    </div>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        function duplication(){
            if($("#shipping_name").is('[readonly]')===false){
                $('input[name=shipping_name]').val($('#billing_name').val()); 
                $('input[name=shipping_address1]').val($('#billing_address1').val()); 
                $('input[name=shipping_address2]').val($('#billing_address2').val());

                // var num = $('#billing_phone1').val();
                // var num1 = num.split("-");

                // $('#shipping_phone11').val(num1[0]).prop("selected",true);
                // $('input[name=shipping_phone12]').val(num1[1]);
                // $('input[name=shipping_phone13]').val(num1[2]);
                $('input[name=shipping_phone]').val($('#billing_phone1').val());

                $('#shipping-copy_button').css({
                    "background-image": "url(images/check-icon.png)"
                });
                $("#shipping_name").prop("readonly",true);
                $("#shipping_address1").prop("readonly",true);
                $("#shipping_address2").prop("readonly",true);
                $("#shipping_phone").prop("readonly",true);
                // $("#shipping_phone12").prop("readonly",true);
                // $("#shipping_phone13").prop("readonly",true);
            }else{
                $("#shipping_name").prop("readonly",false);
                $("#shipping_address1").prop("readonly",false);
                $("#shipping_address2").prop("readonly",false);
                $("#shipping_phone").prop("readonly",false);
                // $("#shipping_phone12").prop("readonly",false);
                // $("#shipping_phone13").prop("readonly",false);
                $('#shipping-copy_button').css({
                    "background-image": "url(images/checkno.png)"
                });
            }
        }
        $('#receive-radio-delivery').click(function(){
            $('#method1').attr("class","method checked active")
            $('#receive-card-delivery').attr("class","receive-card cf active show")
            $('#method2').attr("class","method")
            $('#receive-card-visited').attr("class","receive-card cf")

               
        });
        $('#receive-radio-visited').click(function(){
            $('#method1').attr("class","method")
            $('#receive-card-delivery').attr("class","receive-card cf")
            $('#method2').attr("class","method checked active")
            $('#receive-card-visited').attr("class","receive-card cf active show")
        });
    </script>
    
</body>
</html>