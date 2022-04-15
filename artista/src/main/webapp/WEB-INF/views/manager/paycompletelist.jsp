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
<link rel="stylesheet" href="../css/applymodal.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<%@include file ="../header.jsp" %>
	
	<div id="trackingapply" class="modal-overlay">
        <div class="refusemodal-window">
            <header class="modal-header">
            	<div id="refuse_close" class="close-area close">X</div>
                <h4 class="modal-header-title">운송장 번호 입력</h4>
            </header>
            <article class="modal-body">
                <form class="modal-modify-form" method="post">
                    <div class="modal-modify-form-border"></div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 운송장번호 입력
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input id="trackingNo" class="modal-modify-form-input" style="width:300px;" />
                         </div>
                    </div>       
                    <input type="hidden" id="orderNo" />                          
                    <div class="modal-modify-form-border">
                        <div style="text-align: center; margin-top:15px; margin-bottom: 15px;">
                            <a class="yesNo-btn" id="refuse">입력</a>                    
                            <a class="yesNo-btn close" id="cancel">취소</a>      
                        </div>
                    </div>
                    </form>
            </article>  
        </div>
    </div>
	
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
                결제 전체내역
            </a>
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/manager/paycompletelist">
                <b>판매완료 작품</b>
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
                            	<th scope="col">${workreport.work.workPrice }</th>
                            	<th scope="col">${workreport.order.orderDate }</th>
                            	<th scope="col">${workreport.order.receiverName }</th>
                            	<th scope="col" colspan="1">
                           			<c:if test="${workreport.order.orderStatus eq '상품 준비 중'}">
                           				<a class="artist-detail-btn" onclick="tracking('${workreport.order.orderNo }')">송장번호 입력</a>
                           			</c:if>
                           		</th>                                
                           		<th scope="col" colspan="1">
                           			<c:if test="${workreport.work.workForSale eq 2}">
                           				<a class="artist-detail-btn" onclick="transfer('${workreport.work.workNo }')">작가 송금하기</a>
                           			</c:if>
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
    <%@include file ="../footer.jsp" %>
    
    <script>
    
    tracking
    $(function(){
    	$(document).on('click', '.close', function(e){
    		trackingapply.style.display = "none";
    	});
    });
   
   	function tracking(orderNo){
   		trackingapply.style.display = "flex";
   		$("#orderNo").attr("value", orderNo);
   	}
    function transfer(workNo){
    	alert("송금완료처리에 성공했습니다");
    	$.ajax({
			type:"post",
			dataType:"text",
			async: false,
			url:"${pageContext.request.contextPath}/manager/artistpaycomplete",
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
    	$(document).on('click', '#refuse', function(e){
    		$.ajax({
    			type:"post",
    			async: false,
    			url:"http://localhost:8090/manager/trackingNo",
    			data:{"orderNo":$('#orderNo').val(), "trackingNo": $("#trackingNo").val() },
    			dataType:"json",
    			success: function(data, textStatus){ 
    				alert("운송장 번호 등록이 완료되었습니다");
    				location.reload();
    			},
    			error:function(data, textStatus){
    				alert("운송장 번호 등록이 실패했습니다.");
    			}
    		});
    	});
    });
    </script>
</body>
</html>
