<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/fundingtmdetail.css">
<style>

</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>  
<script>
	$(function() {
		var raminAmount = '${funding.sumAmount}';
			$("#remainAmount").text(raminAmount);
			$("#remainName").text("모인 금액");
		var rate = '${funding.sumAmount}'/'${funding.targetFunding}'*100;
		$("#rate").text(rate);
		$("#pro").val(rate);
	})
</script>
<body style="overflow-x: hidden">
	 <%@include file ="../header.jsp" %>
    <div id="contents">
        <header class="account-header">
            <h2 class="account-header-title">${funding.projTitle }</h2>
        </header>
        <div class="image-box">
            <img class="image-thumb" src="/funding/thumbview/${funding.thumbImg}" />
        </div>
        <div class="fundingdetail">
            <div id="name">펀딩 종료</div><br>
            <div id="amount">${funding.targetFunding} 목표 금액</div><br>
            <div id="amount">${funding.sumAmount } 모인 금액</div><br>
            <div id="amount">${count} 서포터</div><br>
            <div id="promain">
                <span id="rate"></span><span>%</span>
                <progress id="pro" value="30" max="100"></progress>
            </div><br>
            <div class="amountdetail">
                <button class="Btn1">전시 정보 보기</button>
            </div>
        </div>
    </div>
    <div class="projcontent">
        ${funding.projIntro} ${funding.projBudget}
    </div>
    <div class="artistIntro">
        <h2 class="artist">작가 소개</h2>
        <div class="artistContent">
            ${funding.projArtist }
        </div>
        <div class="artistContent">
            <button class="Btn2" onclick="location.href='${pageContext.request.contextPath}/artistdetail/${funding.artistNo }'">작가 페이지 이동</button>
        </div>
    </div>
    <div>
        <button class="Btn3" onclick="location.href='${pageContext.request.contextPath}/funding/fundingtm'">목록</button>
    </div>
</body>
</html>