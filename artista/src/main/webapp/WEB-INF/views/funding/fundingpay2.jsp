<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	 <%@include file ="../header.jsp" %>
    <section id="checkout_list">
        <section id="artworks">
            <h3>후원 정보</h3>
            <div class="mbtn_more martwork active">
                <input type="button" id="artworks_more_btn" class="active">
            </div>
            <div class="sect-list active">
                <div class="checkout-artwork-list">
                    
                        <div class="checkout-item">
                            <div class="checkout-img">
                                <img src="https://og-data.s3.amazonaws.com/media/artworks/h_fixed/A0365/A0365-0017.jpg">
                            </div>
                            <ul class="checkout-text">
                                <li class="code">${funding.projTitle }</li>
                                <li class="title">${funding.artistName }</li>
                            </ul>
                        </div>
                    
                </div>
                <ul class="checkout-billing-total cf">
                    <li>결제금액</li>
                    <li>
                    <form id="success" action="succesamount" method="post">
                        <span id="artworks-totalPrice"><fmt:formatNumber value="${sponsorAmount}" /></span>원
                        <input type="hidden" id="sponsorAmount" name="sponsorAmount" value='${sponsorAmount}'>
                        <input type="hidden" id="projTitle" name="projTitle" value='${funding.projTitle }'>
                        <input type="hidden" id="artistName" name="artistName" value='${funding.artistName }'>
                        <input type="hidden" id="fundingNo" name="fundingNo" value='${fundingNo}'>
                        <input type="hidden" id="name" name="name" value='${mem.name}'>
                        <input type="hidden" id="email" name="email" value='${mem.email}'>
                        <input type="hidden" id="contact" name="contact" value='${mem.contact}'>
                      </form>
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
            <button class="Btn" id="check_module" type="button">결제</button>
            <button class="Btn" type="button">취소</button>
        </div>
        </section>
        <!-- jQuery -->
	  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	  <!-- iamport.payment.js -->
      <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
        <script>
		var check=$('#sponsorAmount').val();
		console.log(typeof(check));
    	$("#check_module").click(function () {
    		var IMP = window.IMP; // 생략가능
    		IMP.init('imp30479474');
    		// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
    		// ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
    		IMP.request_pay({
    			pg: 'html5_inicis',
    			pay_method: 'card',
    			merchant_uid: 'merchant_' + new Date().getTime(),
    			/* 
    			 *  merchant_uid에 경우 
    			 *  https://docs.iamport.kr/implementation/payment
    			 *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
    			 */
    			name: $('#projTitle').val(),
    			// 결제창에서 보여질 이름
    			// name: '주문명 : ${auction.a_title}',
    			// 위와같이 model에 담은 정보를 넣어 쓸수도 있습니다.
    			amount: $('#sponsorAmount').val(),
    			// amount: ${bid.b_bid},
    			// 가격 
    			buyer_name: $('#name').val(),
    			// 구매자 이름, 구매자 정보도 model값으로 바꿀 수 있습니다.
    			// 구매자 정보에 여러가지도 있으므로, 자세한 내용은 맨 위 링크를 참고해주세요.
    			buyer_email: $('#email').val(),
    			buyer_tel: $('#contact').val(),
    			}, function (rsp) {
    				console.log(rsp);
    			if (rsp.success) {
    				var msg = '결제가 완료되었습니다.';
    				msg += '결제 금액 : ' + rsp.paid_amount;
    				 success.submit();
    				// 결제 성공 시 정보를 넘겨줘야한다면 body에 form을 만든 뒤 위의 코드를 사용하는 방법이 있습니다.
    				// 자세한 설명은 구글링으로 보시는게 좋습니다.
    			} else {
    				var msg = '결제에 실패하였습니다.';
    				msg += '에러내용 : ' + rsp.error_msg;
    			}
    			alert(msg);
    		});
    	});
    </script>
</body>
</html>