<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Artista</title>
<link rel="stylesheet" href="../css/manager.css">
<link rel="stylesheet" href="../css/mypage.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<%@include file ="../header.jsp" %>
    <div class="contents">
        <header class="manager-header">
            <h2 class="manager-header-title">관리자 페이지</h2>
        </header>
        <section class="manager-guide">
            <div class="manager-guide-inner">
                <h3 class="manager-guide-name">
                    관리자님 반갑습니다.
                </h3>
            </div>
        </section>
        <nav class="manager-nav">
            <a class="manager-nav-btn current"  href="${pageContext.request.contextPath}/manager/paymentlist" style="background-color:#222;color:white;">
                작품 관리
            </a>
            <a class="manager-nav-btn" href="${pageContext.request.contextPath}/manager/fundinglist">
                펀딩 관리
            </a>
            <a class="manager-nav-btn" href="${pageContext.request.contextPath}/manager/exhibitionlist">
                전시 관리
            </a>
            <a class="manager-nav-btn" href="${pageContext.request.contextPath}/manager/memberlist">
                회원 관리
            </a>
        </nav>

        <nav class="member-nav">
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/manager/paymentlist">
                <b>결제 전체내역</b>
            </a>
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/manager/paycompletelist">
                판매완료 작품
            </a>
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/manager/productapplylist">
                판매작품 등록신청
            </a>
        </nav>
        <article class="member-body">
            <section class="orders-in-progress">
                <table class="account-table">
                    <thead>
                    <tr>
                        <th scope="col" class="time-code">주문번호</th>
                        <th scope="col" class="type">주문작품</th>
                        <th scope="col" class="artworks">주문일자</th>
                        <th scope="col" class="start-date">상품금액</th>
                        <th scope="col" class="status">현황</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                    	<c:when test="${orderdetail!=null && pageInfo.listCount>0 }">
                    	<tbody>
                    		<c:forEach items="${orderdetail }" var="orderdetail">
								<tr>
                            	<td scope="col" class="artistNo">${orderdetail.order.orderNo }</td>
                            	<td class="artworks">
                            		<c:forEach items="${orderdetail.works }" var="work"> 
                        				<${work.workName }> ${work.artistName }<br>
                        				${work.workTech }, ${work.workSize }<br>
                        		 </c:forEach> 
                            	</td>
                            	<th scope="col" class="id">${orderdetail.order.orderDate }</th>
                            	<td scope="col" class="artistName">${orderdetail.order.orderCost }</td>
                            	<td scope="col" class="artistType">${orderdetail.order.orderStatus }</td>                            
                           		<td scope="col"><a class="artist-detail-btn" href="${pageContext.request.contextPath}/manager/paymentInfo/${orderdetail.order.orderNo }">신청 상세보기</a></td>
                        		</tr>
                        		</c:forEach>
                        </tbody>
                    	</c:when>
                    	<c:otherwise>
                    		<tr><td class="empty" colspan="6">표시할 내역이 없습니다.</td></tr>
                    	</c:otherwise>
                    </c:choose>
					</tbody>
                </table>
            </section>
        </article>
    </div>
    
    <%@include file ="../footer.jsp" %>
</body>
</html>