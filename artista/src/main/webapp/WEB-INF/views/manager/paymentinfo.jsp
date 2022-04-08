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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/../css/paymentinfo.css">
<style>

</style>
</head>
<body>
	<%@include file ="../header.jsp" %>
    <div id="contents">
        <header class="account-header">
            <h2 class="account-header-title">관리자주문 상세정보</h2>
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
                <th scope="col" class="type">작품 이미지</th>
                <th scope="col" class="type">작품정보</th>
                <th scope="col" class="artworks">구매금액</th>
                <!-- <th scope="col" class="start-date">배송비</th>
                <th scope="col" class="status">운송장번호</th>
                <th scope="col" class="status">진행상태</th> -->
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
											<c:forEach items="${works }" var="work">
									<tr>
										 <td class="artworks2">
											<img class="cartList-image" src="/artistpage/workImg/${work.workImg }"><br>
										</td> 
										<td class="artworks">
												<${work.workName }> ${work.artistName }<br>
												${work.workTech }, ${work.workSize }<br>
										</td>
										<td class="start-date" ><fmt:formatNumber value="${work.workPrice }" />원</td>
									</tr>
											</c:forEach>
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
                            <div class="sect-body-th">이름</div>
                            <div class="sect-body-td">
                                <div class="checkout-profile-box">
                                    <span>${order.orderName }</span>
                                </div>
                            </div>
                        </div>
                        <div class="sect-body cf">
                            <div class="sect-body-th">연락처</div>
                            <div class="sect-body-td">
                                <div class="checkout-profile-box">
                                	<input id="contact" type="hidden" value="${order.orderNum }">
                                    <span id="contact2"></span>
                                </div>
                            </div>
                        </div>
                        <div class="sect-body cf">
                            <div class="sect-body-th">이메일</div>
                            <div class="sect-body-td">
                                <div class="checkout-profile-box">
                                    <span>${order.orderEmail }</span>
                                    <!-- <input type="button" id="checkout-profile-recertifyButton" value="변경"> -->
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                
            </section>
            <section id="checkout_value2">
                <c:choose>
                    <c:when test="${order.deliveryCharge eq '0'}">
                        <section id="billing_info">
                            <div class="sect-header">
                                <h3>픽업 정보</h3>
                                <!-- <span>계약서에 기재될 정보입니다. (입력 내용은 회원 정보에 반영됩니다.)</span> -->
                            </div>
                            <div id="checkout-profile" class="sect-info active certified">
                                
                                <div class="sect-body cf">
                                    <div class="sect-body-th">이름</div>
                                    <div class="sect-body-td">
                                        <div class="checkout-profile-box">
                                            <input type="hidden" id="billing_name" name="billing_name" value="140,000">
                                            <span>(주)아티스타</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="sect-body cf">
                                    <div class="sect-body-th">연락처</div>
                                    <div class="sect-body-td">
                                        <div class="checkout-profile-box">
                                            <input type="hidden" id="billing_name" name="billing_name" value="홍성호">
                                            <span>1544-9001</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="sect-body cf" style="height: 87px;">
                                    <div class="sect-body-th">픽업 주소</div>
                                    <div class="sect-body-td" style="margin-top: 9px;">
                                        <div class="checkout-profile-box">
                                            <input type="hidden" id="billing_phone1" name="billing_phone1" value="010-4012-9131">
                                            <div>서울특별시 강남구 언주로 508</div>
                                            <div style="float: right;">서울상록빌딩 14층</div>
                                            <!-- <input type="button" id="checkout-profile-recertifyButton" value="변경"> -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </c:when>
                    <c:otherwise>
            <section id="billing_info">
                <div class="sect-header">
                    <h3>수취인 정보</h3>
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
                                <input type="hidden" id="receiverCon" value="${order.receiverNum }">
                                <span id="receiverCon2"></span>
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
        </c:otherwise>
        </c:choose>
            <section id="billing_info">
                <div class="sect-header">
                    <h3>결제 정보</h3>
                    <!-- <span>계약서에 기재될 정보입니다. (입력 내용은 회원 정보에 반영됩니다.)</span> -->
                </div>
                <div id="checkout-profile" class="sect-info active certified">
                    
                    <div class="sect-body cf">
                        <div class="sect-body-th">상품금액</div>
                        <div class="sect-body-td">
                            <div class="checkout-profile-box">
                                <input type="hidden" id="billing_name" name="billing_name" value="140,000">
                                <span><fmt:formatNumber value="${order.workPrice }"/>원</span>
                            </div>
                        </div>
                    </div>
                    <div class="sect-body cf">
                        <div class="sect-body-th">배송비</div>
                        <div class="sect-body-td">
                            <div class="checkout-profile-box">
                                <input type="hidden" id="billing_name" name="billing_name" value="홍성호">
                                <span><fmt:formatNumber value="${order.deliveryCharge }"/>원</span>
                            </div>
                        </div>
                    </div>
                    <div class="sect-body cf">
                        <div class="sect-body-th">최종결제금</div>
                        <div class="sect-body-td">
                            <div class="checkout-profile-box">
                                <input type="hidden" id="billing_phone1" name="billing_phone1" value="010-4012-9131">
                                <span style="font-weight:bold;"><fmt:formatNumber value="${order.orderCost }"/>원</span>
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
        </section>
 
        <div style="text-align: center;font-size: 18px; margin-top: 20px;">
            <input type="button" class="cartBottom-btn" id="toDiscoverBtn" value="뒤로가기" onclick="window.history.back()">
        </div>
        
    </div>
    <!-- <%@include file ="../footer.jsp" %> -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>    
<script>
	var str = $('#contact').val().trim();    
	var phone = str.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
	document.getElementById('contact2').innerText = phone; 
	
	var str = $('#receiverCon').val().trim();    
	var phone = str.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
	document.getElementById('receiverCon2').innerText = phone; 
	
</script>
</body>

</html>