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
<link rel="stylesheet" href="../css/applymodal.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<%@include file ="../header.jsp" %>
	<div id="applyexhibition" class="modal-overlay">
        <div class="modal-window">
            <header class="modal-header">
            	<div id="apply_close" class="close-area cloas-area1">X</div>
                <h2 class="modal-header-title">전시 상세보기</h2>
            </header>
            <article class="modal-body">
                   	<div class="modal-modify-form-border"></div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 전시포스터
                        </div>
                        <div class="modal-modify-form-row-value">
                            <img style="width:300px; height:300px;" id="exhibitPoster"/>
                        </div>
                    </div>
                    
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 펀딩번호
                        </div>
                        <div class="modal-modify-form-row-value">
                        	<input class="modal-modify-form-input" id="fundingNo" type="text" disabled />
                        </div>
                    </div>    
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 전시명
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" id="exhibitTitle" type="text" disabled />
                        </div>
                    </div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 전시작가
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" id="exhibitArtist" type="text" disabled />
                        </div>
                    </div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 전시일정
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" id="exhibitDate" style="width:250px;" disabled />
                        </div>
                    </div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 전시장소
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" id="exhibitPlace" type="text" disabled />
                        </div>
                    </div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 예매링크
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" id="reserveLink" type="text" disabled />
                        </div>
                    </div>
                    <input type="hidden" id="exhibitapplyNo" disabled/>
                    <div class="modal-modify-form-border">
                        <div style="text-align: center; margin-top:15px; margin-bottom: 15px;">
                            <a class="yesNo-btn cloas-area1">닫기</a>           
                        </div>
                    </div>
            </article>  
        </div>
    </div>
    <div id="refuseReason" class="modal-overlay">
        <div class="refusemodal-window">
            <header class="modal-header">
            	<div class="close-area cloas-area1">X</div>
                <h2 class="modal-header-title">거절 사유</h2>
            </header>
            <article class="modal-body">
                <form class="modal-modify-form" method="post">
                    <div class="modal-modify-form-border"></div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 거절사유
                        </div>
                        <div class="modal-modify-form-row-value">
                            <textarea id="refusedContents" class="modal-modify-form-input" style="width:300px; height: 120px; resize: none;" readonly></textarea>
                        </div>
                    </div>
                    <div class="modal-modify-form-border">
                        <div style="text-align: center; margin-top:15px; margin-bottom: 15px;">               
                            <a class="yesNo-btn cloas-area1">닫기</a>      
                        </div>
                    </div>
                </form>
            </article>  
        </div>
    </div>
    
    <div id="contents">
        <header class="account-header">
            <h2 class="account-header-title">작가 페이지</h2>
            <div class="account-header-description">고객님과 관련된 정보입니다.</div>
        </header>
        <section class="account-guide">
            <div class="account-guide-inner">
                <h3 class="account-guide-name">
                    ${artistName }님 반갑습니다.
                </h3>
                <a class="account-modify-btn1" href="${pageContext.request.contextPath}/artistdetail/${artistNo }" style="right:120px;">
                    <p>미리보기</p>
                </a>
                <a class="account-modify-btn" href="${pageContext.request.contextPath}/artistpage/artistModify" >
                    <p>정보 수정</p>
                </a>
            </div>
        </section>
        <nav class="manager-nav">
            <a class="manager-nav-btn current" href="${pageContext.request.contextPath}/artistpage/mywork">
                전체 작품
            </a>
            <a class="manager-nav-btn" href="${pageContext.request.contextPath}/artistpage/myproduct">
                판매 작품
            </a>
            <a class="manager-nav-btn" href="${pageContext.request.contextPath}/artistpage/myfunding">
                나의 펀딩
            </a>
            <a class="manager-nav-btn" style="background-color: black;color: white;" href="${pageContext.request.contextPath}/artistpage/myexhibition">
                나의 전시
            </a>
        </nav>
        
        <nav class="member-nav">
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/artistpage/myexhibition">
                나의 전시
            </a>
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/artistpage/myexhibitionapply">
            	<b>신청 내역</b>
            </a>
            
            <a class="member-delete-btn" href="${pageContext.request.contextPath}/artistpage/applyexhibition" style="width:120px;">
       		 	전시등록 신청
        	</a>
        </nav>
        
        <article class="member-body">
            <section class="member-list">
                <table class="member-table">
                    <thead>
                    <tr>
                        <th scope="col" class="artistNo">전시 번호</th>
                        <th scope="col" class="id">전시 제목</th>
                        <th scope="col" class="artistName">전시 시작일</th>
                        <th scope="col" class="artistType">전시 종료일</th>
                        <th scope="col" class="artistType">펀딩번호</th>
                        <th scope="col" class="artistType">결과</th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <c:choose>
                    	<c:when test="${exhibitlist!=null }">
                    	<tbody>
                    		<c:forEach items="${exhibitlist }" var="exhibitlist">
								<tr>
                            	<th scope="col">${exhibitlist.exhibitapplyNo }</th>
                            	<th scope="col">${exhibitlist.exhibitTitle }</th>
                            	<th scope="col">${exhibitlist.startDate }</th>
                            	<th scope="col">${exhibitlist.endDate }</th>
                           		<th scope="col">${exhibitlist.fundingNo }</th>  
                            	<th scope="col">
                            		<c:if test="${exhibitlist.applyStatus eq 0}">전시등록 요청 중</c:if>
                            		<c:if test="${exhibitlist.applyStatus eq 1}">전시등록 거절</c:if>
                            		<c:if test="${exhibitlist.applyStatus eq 2}">전시수정 요청 중</c:if>
                            		<c:if test="${exhibitlist.applyStatus eq 3}">전시수정 거절</c:if>
                            	</th>         
                            	<th scope="col" colspan="1">
                           			<a class="artist-detail-btn" id="showDetail" onclick="showDetail('${exhibitlist.exhibitapplyNo }')">신청내용보기</a>
                            	</th>                  
                           		<th scope="col" colspan="1">
                           			<c:if test="${exhibitlist.applyStatus eq 1}"><a class="artist-detail-btn" id="showReason" onclick="showReason('${exhibitlist.exhibitapplyNo }')">거절사유보기</a></c:if>
                            		<c:if test="${exhibitlist.applyStatus eq 3}"><a class="artist-detail-btn" id="showReason" onclick="showReason('${exhibitlist.exhibitapplyNo }')">거절사유보기</a></c:if>
                           		</th>    
                        		</tr>
                        		</c:forEach>
                        </tbody>
                    	</c:when>
                    </c:choose>
                </table>
            </section>
        </article>
        
        <%@include file ="../footer.jsp" %>

    </div>
    
    <script>
	//modal창
    const applyexhibition = document.getElementById("applyexhibition");
    $(function(){
    	$(document).on('click', '#showDetail', function(e){
    		applyexhibition.style.display = "flex";
    	});
    	$(document).on('click', '#showReason', function(e){
    		refuseReason.style.display = "flex";
    	});
    	$(document).on('click', '.cloas-area1', function(e){
    		applyexhibition.style.display = "none";
    		refuseReason.style.display = "none";
    	});
    ;});
    
    function showDetail(applyNo){
    	applyexhibition.style.display = "flex";
		$.ajax({
			type:"post",
			dataType:"text",
			async: false,
			url:"${pageContext.request.contextPath}/manager/exhibitapplydetail",
			data:{"applyNo":applyNo},
			success: function(data, textStatus){ 
			 	var exhibitData = JSON.parse(data);
			 	console.log(exhibitData);
			 	$("#exhibitapplyNo").attr("value", exhibitData.exhibitapplyNo);
			 	$('#fundingNo').attr("value", exhibitData.fundingNo);
 			 	$('#exhibitPoster').attr("src", "/artistpage/posterImg/"+exhibitData.exhibitPoster);
 			 	$("#exhibitTitle").attr("value", exhibitData.exhibitTitle);
 			 	$("#exhibitArtist").attr("value", exhibitData.exhibitArtist);
 			 	$("#exhibitDate").attr("value", exhibitData.startDate + " ~ " + exhibitData.endDate);
 			 	$("#exhibitPlace").attr("value", exhibitData.exhibitPlace);
 			 	$("#reserveLink").attr("value", exhibitData.reserveLink);
			},
			error:function(data, textStatus){
				alert("실패");
			}
		});
	}
    function showReason(applyNo){
		refuseReason.style.display = "flex";
		$.ajax({
			type:"post",
			dataType:"text",
			async: false,
			url:"${pageContext.request.contextPath}/artistpage/exhibitrefuseReason",
			data:{"exhibitapplyNo":applyNo},
			success: function(data, textStatus){ 
				$("#refusedContents").html(data);   
			},
			error:function(data, textStatus){
				alert("실패");
			}
		});		
	}
    </script>
</body>
</html>