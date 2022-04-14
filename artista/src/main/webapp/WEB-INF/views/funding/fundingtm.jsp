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
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="../css/fundingtm.css">
<style>
</style>
<body>
	<%@include file ="../header.jsp" %>

	<div class="con">
	<div class="con2">
            <span class="postbtn"><a href="fundinguc">펀딩 예정</a></span>
            <span class="postbtn"><a href="fundingov">펀딩 진행</a></span>
            <span class="postbtn"><a href="fundingtm"><b>펀딩 종료</b></a></span>
	</div>
    <div id="list12" class="flex-container">
    	<c:forEach items="${list}" var="funding">
        <div class="flex-item">
            <div id="box" class="image-box">
                <a href="${path}/funding/fundingtmdetail?fundingNo=${funding.fundingNo}">
                <img src="/funding/thumbview/${funding.thumbImg}" class="image-thumb">
                </a>
            </div>
            <span class="printer" id="artistName" >${funding.artistName}</span><br>
            <a href="${path}/funding/fundingtmdetail?fundingNo=${funding.fundingNo}">
            <span class="projname" id="projName">${funding.projTitle }</span>
            </a>
        </div>
        </c:forEach>
    </div>
    <button id="loadBtn" class="Btn">load more</button>
    </div>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script> 
	<script>

	let startrow = 12; 
	$('#loadBtn').on('click', function () {
		console.log(startrow);
		$.ajax({
			data:{"startrow" : startrow, "endrow" : 12},
			url: "/funding/loadFundingtm",
			type: "post",
			success: function (datalist) {
				for (let i of datalist ) {
					let data = "<div class='flex-item'>"
						data += "<div id='box' class='image-box'>"
						data += "<a href='${path}/funding/fundingovdetail?fundingNo="
						data += i.fundingNo
						data += "'>"
						data += "<img src='/funding/thumbview/"
						data += i.thumbImg
						data += "' class='image-thumb'>"
						data += "</a>"
						data += "</div>";
						
						data += "<span class='printer' id='artistName'>";
						data += i.artistName;
						data +="</span><br>";
						data += "<a href='${path}/funding/fundingovdetail?fundingNo="
						data += i.fundingNo
						data += "'>"
						data += "<span class='projname' id='projTitle'>";
						data += i.projTitle;
						data +="</span></a>";
						data +="</div>";
						$('#list12').append(data);
				}
				startrow += 12;
			}
		});
	});

</script>
</body>
</html>