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
<%@include file="../header.jsp"%>
	<div id="productdetail" class="modal-overlay">
        <div class="modal-window">
            <header class="modal-header">
            	<div id="apply_close" class="close-area">X</div>
                <h2 class="modal-header-title">작품 상세내용</h2>
            </header>
            <article class="modal-body">
                    <div class="modal-modify-form-border"></div>
                        
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 작품 이미지
                        </div>
                        <div class="modal-modify-form-row-value">
                        	<img src="/workImg/${work.workImg }" style="width:300px; height:300px; margin-top:10px;" id="workImg"/>
                        </div>
                    </div>    
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 작품명
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" type="text" id="workName" disabled />
                        </div>
                    </div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 아티스트 이름
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" type="text" id="artistName" disabled />
                        </div>
                    </div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 작품유형
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" type="text" id="workType" disabled />
                        </div>
                    </div>  
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 작품기법
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" type="text" id="workTech" disabled />
                        </div>
                    </div>  
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 작품사이즈
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" type="text" id="workSize" disabled />
                        </div>
                    </div>  
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 작품가격
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" type="text" id="workPrice" disabled />
                        </div>
                    </div>  
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 작품소개
                        </div>
                        <div class="modal-modify-form-row-value">
                            <textarea class="modal-modify-form-input" style="width:300px; height: 120px; resize: none;" id="workIntro" disabled></textarea>
                        </div>
                    </div> 
                    <input type="hidden" id="workapplyNo" />
            </article>  
        </div>
    </div>
    
	<div id="refuseReason" class="modal-overlay">
        <div class="refusemodal-window">
            <header class="modal-header">
            	<div class="close-area">X</div>
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
                            <a class="yesNo-btn close-area">닫기</a>      
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
                    ${artistName} 님 반갑습니다.
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
            <a class="manager-nav-btn" style="background-color: black;color: white;" href="${pageContext.request.contextPath}/artistpage/myproduct">
                판매 작품
            </a>
            <a class="manager-nav-btn" href="${pageContext.request.contextPath}/artistpage/myfunding">
                나의 펀딩
            </a>
            <a class="manager-nav-btn" href="${pageContext.request.contextPath}/artistpage/myexhibition">
                나의 전시
            </a>
        </nav>
        
        <nav class="member-nav">
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/artistpage/myproduct">
                판매 중인 작품
            </a>
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/artistpage/myproductsold">
                판매 완료 작품
            </a>
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/artistpage/myproductapply">
                <b>신청내역</b>
            </a>
            
            <a class="member-delete-btn" href="${pageContext.request.contextPath}/artistpage/applyproduct" style="width:120px;">
                작품판매 신청
            </a>
        </nav>
        
		<article class="member-body">
            <section class="member-list">
                <table class="member-table">
                    <thead>
                    <tr>
                        <th scope="col">작품신청번호</th>
                        <th scope="col">작품 이미지</th>
                        <th scope="col">작품제목</th>
                        <th scope="col">작품 가격</th>
                        <th scope="col">신청현황</th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <c:choose>
                    	<c:when test="${worklist!=null }">
                    	<tbody>
                    		<c:forEach items="${worklist }" var="worklist">
								<tr>
                            	<th scope="col">${worklist.workapplyNo }</th>
                            	<th scope="col">
                            		<img src="/artistpage/workImg/${worklist.workImg }" style="width:100px; height:100px;">	
                            	</th>
                            	<th scope="col"">${worklist.workName }</th>
                            	<th scope="col">${worklist.workPrice }</th>              
                            	<th scope="col">
                            		<c:if test="${worklist.applyState eq 0}">작품등록 요청 중</c:if>
                            		<c:if test="${worklist.applyState eq 1}">작품등록 거절</c:if>
                            		<c:if test="${worklist.applyState eq 2}">작품수정 요청 중</c:if>
                            		<c:if test="${worklist.applyState eq 3}">작품수정 거절</c:if>
                            	</th>
                            	<th scope="col" colspan="1">
                           			<c:if test="${worklist.applyState eq 1}"><a class="artist-detail-btn" onclick="showDetail('${worklist.workapplyNo }')">신청내용보기</a></c:if>
                            		<c:if test="${worklist.applyState eq 3}"><a class="artist-detail-btn" onclick="showDetail('${worklist.workapplyNo }')">신청내용보기</a></c:if>
                           		</th>                  
                           		<th scope="col" colspan="1">
                           			<c:if test="${worklist.applyState eq 0}"><a class="artist-detail-btn" onclick="showDetail('${worklist.workapplyNo }')">신청내용보기</a></c:if>
                            		<c:if test="${worklist.applyState eq 1}"><a class="artist-detail-btn" onclick="showReason('${worklist.workapplyNo }')">거절사유보기</a></c:if>
                            		<c:if test="${worklist.applyState eq 2}"><a class="artist-detail-btn" onclick="showDetail('${worklist.workapplyNo }')">신청내용보기</a></c:if>
                            		<c:if test="${worklist.applyState eq 3}"><a class="artist-detail-btn" onclick="showReason('${worklist.workapplyNo }')">거절사유보기</a></c:if>
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
	function showDetail(workapplyNo){
		productdetail.style.display = "flex";
		$.ajax({
			type:"post",
			dataType:"text",
			async: false,
			url:"http://localhost:8090/artistpage/productapplydetail",
			data:{"workNo":workapplyNo},
			success: function(data, textStatus){ 
			 	var workData = JSON.parse(data);
			 	$('#workapplyNo').attr("value", workData.workapplyNo);
 			 	$('#workImg').attr("src", "/artistpage/workImg/"+workData.workImg);
 			 	$("#artistName").attr("value", workData.artistName);
 			 	$("#workName").attr("value", workData.workName);
 			 	$("#workType").attr("value", workData.workType);
 			 	$("#workTech").attr("value", workData.workTech);
 			 	$("#workSize").attr("value", workData.workSize);
 			 	$("#workIntro").html(workData.workIntro);    
 			 	$("#workPrice").attr("value", workData.workPrice);
			},
			error:function(data, textStatus){
				alert("실패");
			}
		});		
	}
	function showReason(workapplyNo){
		refuseReason.style.display = "flex";
		$.ajax({
			type:"post",
			dataType:"text",
			async: false,
			url:"http://localhost:8090/artistpage/refuseReason",
			data:{"workNo":workapplyNo},
			success: function(data, textStatus){ 
				console.log(data);
				$("#refusedContents").html(data);   
			},
			error:function(data, textStatus){
				alert("실패");
			}
		});		
	}
	$(function(){
	    $(document).on('click', '.close-area', function(e){
	    	refuseReason.style.display = "none";
	    	productdetail.style.display = "none";
	    });
	});
	</script>
</body>
</html>