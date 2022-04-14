<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="../css/fundingov.css">
<title>Insert title here</title>
</head>
<style>
div { display:none; }
</style>
<body>
	 <%@include file ="../header.jsp" %>
	 <div class="con">
	<div class="con2">
            <span class="postbtn"><a href="fundinguc">펀딩 예정</a></span>
            <span class="postbtn"><a href="fundingov"><b>펀딩 진행</b></a></span>
            <span class="postbtn"><a href="fundingtm">펀딩 종료</a></span>
	</div>
    <div class="flex-container">
    	<c:forEach items="${list }" var="funding">
        <div class="flex-item" id="flex-item">
            <div id="box" class="image-box">
                <a href="${path}/funding/fundingovdetail?fundingNo=${funding.fundingNo}">
                <img src="/funding/thumbview/${funding.thumbImg}" class="image-thumb">
                </a>
            </div>
            <span class="printer" id="artistName" >${funding.artistName}</span><br>
            <a href="${path}/funding/fundingovdetail?fundingNo=${funding.fundingNo}">
            <span class="projname" id="projTitle">${funding.projTitle }</span>
            </a>
        </div>
     </c:forEach>
    </div>
    <button type="button" id="load" class="Btn">load more</button>
    </div>
<script src="http://code.jquery.com/jquery-latest.min.js"></script> 
<script>
$(function(){
    $("div").slice(0, 9).show(); // select the first ten
    $("#load").click(function(e){ // click event for load more
        e.preventDefault();
        $("div:hidden").slice(0, 10).show(); // select next 10 hidden divs and show them
        if($("div:hidden").length == 0){ // check if any hidden divs still exist
        }
    });
});

</script>
</body>
</html>