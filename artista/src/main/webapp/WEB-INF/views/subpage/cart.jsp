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
    <link rel="stylesheet" href="../css/cart.css">
</head>
<body>
 <%@include file ="../header.jsp" %>
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
            <form method="post" action="payment" id="cartForm">
                <input type="hidden" name="csrfmiddlewaretoken" value="zEQTTX2dH04N75nRqOgUhc4WpKvEKXudYC2IwAeyhZ8ddPv1KpUIHKq7YePVXnij">
                <input type="hidden" name="order_type" value="P">
                <table id="cartList">
                    <thead>
                    <tr>
                        <th scope="col" class="cartList-checkbox">
                            <input type="checkbox" class="cartList-checkAll" id="cartList-checkAll-1" onclick="selectAll(this),getCheckedCnt(),itemSum(this.form)">
                            <label for="cartList-checkAll-1"></label>
                        </th>
                        <th scope="col" class="cartList-thInfo">작품정보</th>
                        <th scope="col" class="cartList-thPrice">구매가격</th>
                        <th scope="col" class="cartList-thRemove"></th>
                    </tr>
                    </thead>
                    <tbody>
                    	  <c:choose> 
                    	<c:when test='${empty carts}'>
                    		<tr>
                            	<td class="cartList-tdDummy"></td>
                            	<td colspan="3" class="cartList-tdEmpty">카트에 담겨있는 작품이 없습니다</td>
                        	</tr>
                    	</c:when>
                    	 <c:otherwise> 
                    	 	<c:set var="tot" value="0"/>
                    		<c:forEach items="${carts }" var="cart">
                        	<tr>
                            <td class="cartList-checkbox">
                                <input type="checkbox" class="cartList-checkEach" id="${cart.cartNo }#${cart.workPrice }" name="order_artwork" value="${cart.cartNo }" onclick='itemSum(),getCheckedCnt()'>
                                <label for="${cart.cartNo }#${cart.workPrice }"></label>
                              
                            </td>
                            <td class="cartList-tdInfo">
                                <a class="cartList-imageHolder" href="/artwork/A0365-0017/">
                                    <img class="cartList-image" src="https://og-data.s3.amazonaws.com/media/artworks/h_fixed/A0365/A0365-0017.jpg">
                                </a>
                                <div class="cartList-info">
                                    <p class="cartList-info-code"><a href="/artwork/A0365-0017/">${cart.workNo }</a></p>
                                    <p class="cartList-info-title"><a href="/artwork/A0365-0017/">${cart.workName }</a></p>
                                    <p class="cartList-info-extra">
                                        <a href="/artist/A0365/#artworks">${cart.workArtist }</a>
                                        <span class="cartList-info-slash">/</span>
                                        <br class="cartList-info-br">
                                        ${cart.workSize }
                                    </p>
                                </div>
                            </td>
                            <td class="cartList-tdPrice">
                                ￦ <fmt:formatNumber value="${cart.workPrice }"/>
                            </td>
                            <td class="cartList-tdRemove">
                                <input type="button" class="cartList-removeEach" value="삭제" onclick="deleteCart('${cart.cartNo}')">
                            </td>
                        </tr>
                        	
                    		 </c:forEach>
                          </c:otherwise>
                    	</c:choose>   
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
                                <span id="cartBoard-val-artworkCount">0</span> 점
                            </span>
                        </li>
                        <li class="cartBoard-li cf">
                            <span class="cartBoard-label">총 구매가격</span>
                            <span class="cartBoard-value">
                                ￦ <span id="cartBoard-val-amount">0</span>
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
                    <input type="submit" class="cartBottom-btn" id="toCheckoutBtn" value="주문결제">
                    <!-- <a href="payment.html"><input type="submit" class="cartBottom-btn" id="toCheckoutBtn" value="주문결제"></a> -->
                </div>
            </form>
        </section>
    </div>
    <%@include file ="../footer.jsp" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>    
<script>
	
 
	function selectAll(selectAll)  {
	  const checkboxes 
	       = document.getElementsByName('order_artwork');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  })
	}
	function getCheckedCnt()  {
		  // 선택된 목록 가져오기
		  const query = 'input[name="order_artwork"]:checked';
		  const selectedElements = document.querySelectorAll(query);
		  
		  // 선택된 목록의 갯수 세기
		  const selectedElementsCnt = selectedElements.length;
		  // 출력
		  document.getElementById('cartBoard-val-artworkCount').innerText
		    = selectedElementsCnt;
		}
	
	  function itemSum(){
		   
		// 선택된 목록 가져오기
		   var sum = 0;
		   var count = document.getElementsByName("order_artwork").length;
		   for(var i=0; i < count; i++ ){
		       if(document.getElementsByName("order_artwork")[i].checked == true ){
		    	   var id = document.getElementsByName("order_artwork")[i].getAttribute("id");
		    	   var price = +id.split("#")[1];
		    	   sum += price;
			    //sum += parseInt(document.getElementsByName("order_artwork")[i].getAttribute("id"));
			    
		       }
		   }
		   document.getElementById('cartBoard-val-amount').innerText = sum.toLocaleString();
		}   
	
	function deleteCart(no){
		$.ajax({     
			type:"post",
			dataType:"text",
			async:false,
			url:"http://localhost:8090/delete",
			data:{"no":no},
			success: function(data, textStatus){
				alert("삭제가 완료되었습니다.")
				location.reload();
			},
			error:function(data, textStatus){
				alert("실패");
			}
		});
	}
	
	
</script>
</body>
</html>