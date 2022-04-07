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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
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
            <a class="manager-nav-btn current"  href="${pageContext.request.contextPath}/manager/paymentlist">
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
                결제 전체내역
            </a>
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/manager/paycompletelist">
                판매완료 작품
            </a>
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/manager/productapplylist">
                판매작품 등록신청
            </a>
        </nav>
        <article class="member-body">
            <section class="member-list">
                <table class="member-table">
                    <thead>
                    <tr>
                        <th scope="col">작품 번호</th>
                        <th scope="col">작품 제목</th>
                        <th scope="col">작품 가격</th>
                        <th scope="col">결제 일자</th>
                        <th scope="col">구매자</th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <c:choose>
                    	<c:when test="${workreport!=null && pageInfo.listCount>0 }">
                    	<tbody>
                    		<c:forEach items="${workreport }" var="workreport">
								<tr>
                            	<th scope="col">${workreport.work.workNo }</th>
                            	<th scope="col">${workreport.work.workName }</th>
                            	<th scope="col"">${workreport.work.workPrice }</th>
                            	<th scope="col">${workreport.order.orderDate }</th>
                            	<th scope="col">${workreport.order.receiverName }</th>                                
                           		<th scope="col" colspan="1">
                           			<c:choose>
                           			<c:when test="${workreport.work.workForSale eq 2}">
                           				<a class="artist-detail-btn" onclick="transfer('${workreport.work.workNo }')">작가 송금하기</a>
                           			</c:when>
                           			</c:choose>
                           		</th>
                        		</tr>
                        		</c:forEach>
                        </tbody>
                    	</c:when>
                    </c:choose>
                </table>
            </section>
        </article>
    </div>
    
    <script>
    function transfer(workNo){
    	$.ajax({
			type:"post",
			dataType:"text",
			async: false,
			url:"http://localhost:8090/manager/artistpaycomplete",
			data:{"workNo":workNo},
			success: function(data, textStatus){ 
				alert("송금완료처리에 성공했습니다");
				location.reload();
			},
			error:function(data, textStatus){
				alert("실패");
			}
		});
    }
    
    $(function(){
    	$(".artist-detail-btn").click(function(){
    		alert("작가 송금하기!");
    	});
    	
    });
    </script>
</body>
</html>
