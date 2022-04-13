<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Artista</title>
<link rel="stylesheet" href="../css/manager.css">
<link rel="stylesheet" href="../css/applymodal.css">
</head>
<body>
	<%@include file ="../header.jsp" %>
    <div id="exhibition" class="modal-overlay">
        <div class="modal-window">
            <header class="modal-header">
            	<div id="apply_close" class="close-area">X</div>
                <h2 class="modal-header-title">스폰서 목록</h2>
            </header>
            <article class="modal-body">
            	<table class="spon-table">
            		<thead>
            			<tr>
            				<th>스폰서 번호</th>
            				<th>아이디</th>
            				<th>이름</th>
            				<th>연락처</th>
            				<th>이메일</th>
            				<th>후원 금액</th>
            			</tr>
            		</thead>
            		<tbody id="sponsorTbody">
            			
            		</tbody>
            	</table>
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
            <a class="manager-nav-btn current"  href="${pageContext.request.contextPath}/manager/paymentlist">
                작품 관리
            </a>
            <a class="manager-nav-btn" href="${pageContext.request.contextPath}/manager/fundinglist" style="background-color:#222;color:white;">
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
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/manager/fundingapplylist">
                펀딩 신청 목록
            </a>
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/manager/fundingupcoming">
                펀딩 예정
            </a>
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/manager/fundingproceeding">
                <b>진행중인 펀딩</b>
            </a>
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/manager/fundingended">
                종료된 펀딩
            </a>
        </nav>
        
        <article class="member-body">
            <section class="member-list">
                <table class="member-table">
                    <thead>
                    <tr>
                        <th scope="col">펀딩 번호</th>
                        <th scope="col">대표이미지</th>
                        <th scope="col">펀딩제목</th>
                        <th scope="col">현재 상태</th>
                       	<th scope="col">일정</th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <c:choose>
                    	<c:when test="${fundingNowList!=null }">
                    	<tbody>
                    		<c:forEach items="${fundingNowList }" var="funding">
								<tr>
                            	<th scope="col">${funding.fundingNo }</th>
                            	<th scope="col">
                            		<img src="/funding/thumbview/${funding.thumbImg}" style="width:100px; height:100px;">	
                            	</th>
                            	<th scope="col"">${funding.projTitle }</th>            
                            	<th scope="col">
                            		<c:choose>
									<c:when test="${funding.fundingState==1}">예정</c:when>
									<c:when test="${funding.fundingState==2}">진행</c:when>
									<c:otherwise>종료</c:otherwise>
									</c:choose>
                            	</th>
                            	<th scope="col"">${funding.fundingDate }</th>    
                            	<th scope="col" colspan="1">
                            		<a class="artist-detail-btn" onclick="fundingDetail('${funding.fundingNo }')">내용 상세보기</a>
                            	</th>                  
                           		<th scope="col" colspan="1">
                           			<c:choose>
									<c:when test="${funding.fundingState==1}"><a class="artist-detail-btn" onclick="showDetail('${worklist.workapplyNo }')">알람 신청내역</a></c:when>
									<c:when test="${funding.fundingState==2}"><a class="artist-detail-btn" onclick="showSpon('${funding.fundingNo }')">스폰서 보기</a></c:when>
									<c:otherwise><a class="artist-detail-btn" onclick="showDetail('${worklist.workapplyNo }')">결과보기</a></c:otherwise>
									</c:choose></th>
                        		</tr>
                        		</c:forEach>
                        </tbody>
                    	</c:when>
                    </c:choose>
                </table>
            </section>
        </article>
        
	<%@include file ="../footer.jsp" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	const exhibition = document.getElementById("exhibition");
	
	$(function(){
		$(document).on('click', '.close-area', function(e){
			exhibition.style.display = "none";
		});
		
	});
	
	function showSpon(fundingNo){
		exhibition.style.display = "flex";
		$.ajax({
			type:"post",
			async: false,
			url:"http://localhost:8090/manager/sponList",
			dataType:"text",
			/* contentType:"application/json;charset=UTF-8", */
			data:{"fundingNo":fundingNo},
			success: function(data, textStatus){ 
			 	var fundingData = JSON.parse(data);
			 	var accEle = "";
  				for(var i in fundingData) {
  					accEle += '<tr class="aa">'
					accEle += '<td>'+ (+i + 1) +'</td>'
  					accEle += '<td>'+ fundingData[i].id +'</td>'
  					accEle += '<td>'+ fundingData[i].name +'</td>'
  					accEle += '<td>'+ fundingData[i].contact +'</td>'
  					accEle += '<td>'+ fundingData[i].email +'</td>'
  					accEle += '<td>'+ fundingData[i].sponAmount +'</td>'
  					accEle += '</tr>'
  				}
  				$('.aa').detach();
  				$('#sponsorTbody').append(accEle);
			},
			error:function(data, textStatus){
				alert("실패");
			}
		});
	}

</script>
</body>
</html>