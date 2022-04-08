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
<script	src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>
</head>
<body>
	<div id="applyexhibition" class="modal-overlay">
        <div class="modal-window">
            <header class="modal-header">
            	<div id="apply_close" class="close-area">X</div>
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
                            <a class="yesNo-btn" id="accept">등록</a>                    
                            <a class="yesNo-btn" id="refusemodal">거절</a>      
                        </div>
                    </div>
            </article>  
        </div>
    </div>
    
    <div id="refuseapply" class="modal-overlay">
        <div class="refusemodal-window">
            <header class="modal-header">
            	<div id="refuse_close" class="close-area">X</div>
                <h4 class="modal-header-title">거절 사유</h4>
            </header>
            <article class="modal-body">
                    <div class="modal-modify-form-border"></div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 거절사유
                        </div>
                        <div class="modal-modify-form-row-value">
                            <textarea class="modal-modify-form-input" id="refusedContents" style="width:300px; height: 120px; resize: none;"></textarea>
                        </div>
                    </div>                                
                    <div class="modal-modify-form-border">
                        <div style="text-align: center; margin-top:15px; margin-bottom: 15px;">
                            <a class="yesNo-btn" id="refuse">거절</a>                    
                            <a class="yesNo-btn" id="cancel">취소</a>      
                        </div>
                    </div>
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
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/manager/exhibitionlist">
                전시 목록 관리
            </a>
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/manager/exhibitionapplylist">
                전시 등록 신청
            </a>
        </nav>
    	<article class="member-body">
            <section class="member-list">
            	<table class="member-table">
                    <thead>
                    <tr>
                        <th scope="col">전시신청번호</th>
                        <th scope="col">전시 제목</th>
                        <th scope="col">아티스트 이름</th>
                        <th scope="col">전시시작일</th>
                        <th scope="col">전시종료일</th>
                        <th scope="col">대관장소</th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <c:choose>
                    	<c:when test="${applylist!=null }">
                    	<tbody>
                    		<c:forEach items="${applylist }" var="applylist">
								<tr>
                            	<th scope="col">${applylist.exhibitapplyNo }</th>
                            	<th scope="col">${applylist.exhibitTitle }</th>
                            	<th scope="col">${applylist.exhibitArtist }</th>
                            	<th scope="col">${applylist.startDate }</th>
                            	<th scope="col">${applylist.endDate }</th>
                            	<th scope="col">${applylist.exhibitPlace }</th>                       
                           		<th scope="col"><a class="artist-detail-btn" onclick="exhibitlist('${applylist.exhibitapplyNo }')">신청 상세보기</a></th>
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
	//modal창
    const applyexhibition = document.getElementById("applyexhibition");
    const refuseapply = document.getElementById("refuseapply");
    
    $(function(){
    	$(document).on('click', '.artist-detail-btn', function(e){
    		applyexhibition.style.display = "flex";
    	});
    	$(document).on('click', '#apply_close', function(e){
    		applyexhibition.style.display = "none";
    	});
    });
    $(function(){
    	$(document).on('click', '#refusemodal', function(e){
    		refuseapply.style.display = "flex";
    	});
    	$(document).on('click', '#cancel', function(e){
    		refuseapply.style.display = "none";
    	});
    	$(document).on('click', '#refuse_close', function(e){
    		refuseapply.style.display = "none";
    	});
    });
    
    function exhibitlist(applyNo){
    	applyexhibition.style.display = "flex";
		$.ajax({
			type:"post",
			dataType:"text",
			async: false,
			url:"http://localhost:8090/manager/exhibitapplydetail",
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
    
    $(function(){
    	$(document).on('click', '#accept', function(e){
    		alert($('#exhibitapplyNo').val());
    		$.ajax({
    			type:"post",
    			async: false,
    			url:"http://localhost:8090/manager/exhibitapplysuccess",
    			data:{"applyNo":$('#exhibitapplyNo').val()},
    			dataType:"text",
    			success: function(data, textStatus){ 
    				alert("전시 등록이 성공했습니다");
    				location.reload();
    			},
    			error:function(data, textStatus){
    				alert("아티스트 등록이 실패했습니다.");
    			}
    		});
    	});
    	$(document).on('click', '#refuse', function(e){
    		alert($("#refusedContents").val());
    		$.ajax({
    			type:"post",
    			async: false,
    			url:"http://localhost:8090/manager/exhibitapplyfail",
    			data:{"applyNo":$('#exhibitapplyNo').val(), "refusedContents" : $("#refusedContents").val()},
    			dataType:"text",
    			success: function(data, textStatus){ 
    				alert("전시등록 거절이 성공했습니다");
    				location.reload();
    			},
    			error:function(data, textStatus){
    				alert("전시등록 거절이 실패했습니다.");
    			}
    		});
    	});
    });
    
    </script>
</body>
</html>