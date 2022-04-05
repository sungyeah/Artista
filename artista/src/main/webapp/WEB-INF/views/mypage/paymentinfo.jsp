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
    <link rel="stylesheet" href="../css/paymentinfo.css">
<style>

</style>
</head>
<body>
<%@include file ="../header.jsp" %>
    <div id="contents">
        <header class="account-header">
            <h2 class="account-header-title">주문 상세정보</h2>
            <div class="account-header-description">주문과 관련된 정보입니다.</div>
        </header>
        <article class="account-body">
    <section class="orders-in-progress">
        <div style="font-weight: bold; margin-bottom: 12px;">
        <span class="span">주문일자</span><span style="margin-right: 30px;">${order.orderDate }</span><span class="span">주문번호</span><span class="span">${order.orderNo }</span>
        </div>
        <!-- <h3>주문 일자</h3> -->
        <table class="account-table">
            <thead>
            <tr>
                <!-- <th scope="col" class="time-code">주문번호</th> -->
                <th scope="col" class="type">상품명</th>
                <th scope="col" class="artworks">상품금액</th>
                <th scope="col" class="start-date">배송비</th>
                <th scope="col" class="status">운송장번호</th>
                <th scope="col" class="status">진행상태</th>
            </tr>
            </thead>
					<tbody>
						<c:choose>
							<c:when test='${empty order}'>
								<tr>
									<td class="empty" colspan="6">표시할 내역이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
									<tr>
										<td class="artworks">
											<c:forEach items="${order.workNo }" var="work">
												<왜곡3> 김소명<br>
												한지에 동양화 물감, 45x53cm<br>
											</c:forEach>
										</td>
										<td class="start-date" style="font-weight: bold;">￦ <fmt:formatNumber value="${order.orderCost }" />원</td>
										<td class="time-code">${order.deliveryCharge }</td>
										<td class="start-date">${order.trackingNo }</td>
										<td class="status">${order.orderStatus }</td>
									</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
    </section>
        </article>
        <section id="checkout_body" class="cf">
            <section id="checkout_value">
                <section id="billing_info">
                    <div class="sect-header">
                        <h3>주문자 정보</h3>
                        <!-- <span>계약서에 기재될 정보입니다. (입력 내용은 회원 정보에 반영됩니다.)</span> -->
                    </div>
                    <div id="checkout-profile" class="sect-info active certified">
                        
                        <div class="sect-body cf">
                            <div class="sect-body-th">상품금액</div>
                            <div class="sect-body-td">
                                <div class="checkout-profile-box">
                                    <input type="hidden" id="billing_name" name="billing_name" value="140,000">
                                    <span>${order.workPrice }</span>
                                </div>
                            </div>
                        </div>
                        <div class="sect-body cf">
                            <div class="sect-body-th">배송비</div>
                            <div class="sect-body-td">
                                <div class="checkout-profile-box">
                                    <input type="hidden" id="billing_name" name="billing_name" value="홍성호">
                                    <span>${order.deliveryCharge }</span>
                                </div>
                            </div>
                        </div>
                        <div class="sect-body cf">
                            <div class="sect-body-th">최종결제금</div>
                            <div class="sect-body-td">
                                <div class="checkout-profile-box">
                                    <input type="hidden" id="billing_phone1" name="billing_phone1" value="010-4012-9131">
                                    <span>${order.orderCost }</span>
                                    <!-- <input type="button" id="checkout-profile-recertifyButton" value="변경"> -->
                                </div>
                            </div>
                        </div>
                        <div class="sect-body cf">
                            <div class="sect-body-th">결제수단</div>
                            <div class="sect-body-td">
                                <div class="checkout-profile-box">
                                    <input type="hidden" id="checkout-input-billing_email" name="billing_email" value="ghdtjdgh0810@nate.com">
                                    <span>${order.pay_method }</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                
            </section>
            <section id="checkout_value2">
            <section id="billing_info">
                <div class="sect-header">
                    <h3>배송지 정보</h3>
                    <!-- <span>계약서에 기재될 정보입니다. (입력 내용은 회원 정보에 반영됩니다.)</span> -->
                </div>
                <div id="checkout-profile" class="sect-info active certified">
                    
                    <div class="sect-body cf">
                        <div class="sect-body-th">이름</div>
                        <div class="sect-body-td">
                            <div class="checkout-profile-box">
                                <input type="hidden" id="billing_name" name="billing_name" value="140,000">
                                <span>${order.receiverName }</span>
                            </div>
                        </div>
                    </div>
                    <div class="sect-body cf">
                        <div class="sect-body-th">연락처</div>
                        <div class="sect-body-td">
                            <div class="checkout-profile-box">
                                <input type="hidden" id="billing_name" name="billing_name" value="홍성호">
                                <span>${order.receiverNum }</span>
                            </div>
                        </div>
                    </div>
                    <div class="sect-body cf" style="height: 87px;">
                        <div class="sect-body-th">배송지주소</div>
                        <div class="sect-body-td" style="margin-top: 9px;">
                            <div class="checkout-profile-box">
                                <input type="hidden" id="billing_phone1" name="billing_phone1" value="010-4012-9131">
                                <div>${order.receiverAddress }</div>
                                <div style="float: right;">${order.receiverAddress2 }</div>
                                <!-- <input type="button" id="checkout-profile-recertifyButton" value="변경"> -->
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            </section>
        </section>
        <div style="text-align: center;font-size: 18px; margin-top: 20px;">
            <input type="button" class="cartBottom-btn" id="toCheckoutBtn" value="확인" onclick="location.href='mypage.html'">
            <input type="button" class="cartBottom-btn" id="toDiscoverBtn" value="결제취소" onclick="location.href='mypage.html'">
        </div>
        
    </div>
    <%@include file ="../footer.jsp" %>
</body>
</html>