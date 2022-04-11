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
	<div id="exhibition" class="modal-overlay">
        <div class="modal-window">
            <header class="modal-header">
            	<div id="apply_close" class="close-area">X</div>
                <h2 class="modal-header-title">전시 상세보기</h2>
            </header>
            <article class="modal-body">
            	<form class="modal-modify-form" method="post" action="/artistpage/exhibitModify">
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
                    <input type="hidden" id="exhibitNo" name="exhibitNo" />
                    <div class="modal-modify-form-border">
                        <div style="text-align: center; margin-top:15px; margin-bottom: 15px;">
                            <button class="yesNo-btn" id="modify" style="width:120px;">수정 요청하기</button>                    
                            <button type="reset" class="yesNo-btn close-area">닫기</button>      
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
                <a class="account-modify-btn" href="mypage/mypagemodify" onclick="gaClickAccount('account_modify');">
                    <p>작가 정보</p>
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
                <b>나의 전시</b>
            </a>
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/artistpage/myexhibitionapply">
            	신청 내역
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
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <c:choose>
                    	<c:when test="${exhibitlist!=null }">
                    	<tbody>
                    		<c:forEach items="${exhibitlist }" var="exhibitlist">
								<tr>
                            	<th scope="col">${exhibitlist.exhibitNo }</th>
                            	<th scope="col">${exhibitlist.exhibitTitle }</th>
                            	<th scope="col"">${exhibitlist.startDate }</th>
                            	<th scope="col"">${exhibitlist.endDate }</th>
                            	<th scope="col">${exhibitlist.fundingNo }</th>                             
                           		<th scope="col" colspan="1">
                           			<a class="artist-detail-btn" onclick="showDetail('${exhibitlist.exhibitNo }')">전시상세보기</a>
                           		</th>
                        		</tr>
                        	</c:forEach>
                        </tbody>
                    	</c:when>
                    </c:choose>
                </table>
                <a class="member-delete-btn" href="/account/delete/">
                    내용 삭제
                </a>
            </section>
        </article>
        
        <%@include file ="../footer.jsp" %>

    </div>
    
    <script>
 	//modal창
    const exhibition = document.getElementById("exhibition");
 	
    $(function(){
    	$(document).on('click', '.artist-detail-btn', function(e){
    		exhibition.style.display = "flex";
    	});
    	$(document).on('click', '.close-area', function(e){
    		exhibition.style.display = "none";
    	});
    });
 	
    function showDetail(exhibitNo){
    	exhibition.style.display = "flex";
		$.ajax({
			type:"post",
			dataType:"text",
			async: false,
			url:"http://localhost:8090/artistpage/exhibitdetail",
			data:{"exhibitNo":exhibitNo},
			success: function(data, textStatus){ 
			 	var exhibitData = JSON.parse(data);
			 	console.log(exhibitData);
			 	$("#exhibitNo").attr("value", exhibitData.exhibitNo);
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
 	
    </script>
</body>
</html>