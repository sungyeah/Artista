<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/fundingucdetail.css">
<style>

</style>
<body style="overflow-x: hidden">
<%@include file ="../header.jsp" %>
    <div id="contents">
        <header class="account-header">
            <h2 class="account-header-title">${funding.projTitle}</h2>
        </header>
        <div class="image-box">
            <img class="image-thumb" src="/funding/thumbview/${funding.thumbImg}" />
        </div>
        <div class="fundingdetail">
            <div id="timealert">
            <fmt:parseDate value="${funding.startDate }" var="startDate" pattern="yyyy-MM-dd HH" />
            <fmt:formatDate value="${startDate }" pattern="M" /><span>월</span>
            <fmt:formatDate value="${startDate }" pattern="d" /><span>일</span>
            <fmt:formatDate value="${startDate }" pattern="H" /><span>시</span>
            <span>오픈 예정</span>
            </div><br>
            <div class="amountdetail">
                <button type="button" class="Btn1" id="Btn1" onclick="alarm('${funding.fundingNo}')">알림 신청 ${count}명 신청 중</button>
            </div>
            <div>
                지금 바로 알림 신청하고 미리 연락 받으세요.
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
            <button class="Btn2">작가 페이지 이동</button>
        </div>
    </div>
    <div>
        <button class="Btn3">목록</button>
    </div>
    
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>  
    <script>

     //버튼 색이 변경이 안 됨
    function alarm(fundingNo){
    	var color=document.getElementById("Btn1");
        var id = '<%=(String)session.getAttribute("id")%>';
    	console.log(fundingNo);
    	$.ajax({
    		type: "Get",
    		dataType: "text",
    		async: false,
    		url: "http://localhost:8090/funding/alarm",
    		data:{"fundingNo": fundingNo},
    		success: function(data, textStatus){
    			//인원수
    			if(id===null){
    				color.style.color="white";
    				color.style.background="black";
    				$('#Btn1').text("알림"+data+"명 신청중");
    			} else {
    				color.style.color="black";
    				color.style.background="white";
    				$('#Btn1').text("알림"+data+"명 신청중");
    			}
    		},
    		error:function(data, textStatus){
    			alert("실패");
    		}
    	});
    }
    </script>
</body>
</html>