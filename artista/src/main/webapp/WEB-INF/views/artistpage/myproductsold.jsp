<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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
	<div id="applyproduct" class="modal-overlay">
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
                    <div class="modal-modify-form-border">
                        <div style="text-align: center; margin-top:15px; margin-bottom: 15px;">
                            <a class="yesNo-btn" id="enroll">등록</a>                    
                            <a class="yesNo-btn" id="refusemodal">등록 거절</a>      
                        </div>
                    </div>
                    <input type="hidden" id="workapplyNo" />
            </article>  
        </div>
    </div>
    
	<div id="modal" class="modal-overlay">
        <div class="refusemodal-window">
            <header class="modal-header">
            	<div id="refuse_close" class="close-area">X</div>
                <h2 class="modal-header-title">송장번호 입력</h2>
            </header>
            <article class="modal-body">
                <form class="modal-modify-form" method="post">
                    <div class="modal-modify-form-border"></div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 송장번호
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" type="text" name="new_password1" placeholder="" maxlength="20" autocomplete="off" autocorrect="off" autocapitalize="off" ><br>
                        </div>
                    </div>
                    <div class="modal-modify-form-border">
                        <div style="text-align: center; margin-top:15px; margin-bottom: 15px;">
                            <a class="yesNo-btn" id="workenroll">송장등록</a>                    
                            <a class="yesNo-btn" id="cancel">취소</a>      
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
                <b>판매 완료 작품</b>
            </a>
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/artistpage/myproductapply">
                신청내역
            </a>
        </nav>
        
		<article class="member-body">
            <section class="member-list">
                <table class="member-table">
                    <thead>
                    <tr>
                        <th scope="col" class="artistNo">작품 번호</th>
                        <th scope="col" class="id">작품 이미지</th>
                        <th scope="col" class="id">작품제목</th>
                        <th scope="col" class="artistType">구매자</th>
                        <th scope="col" class="artistName">주문일자</th>
                        <th scope="col" class="artistType">작품 가격</th>
                        <th scope="col" class="artistType"></th>
                    </tr>
                    </thead>
                    <c:choose>
                    	<c:when test="${soldlist!=null }">
                    	<tbody>
                    		<c:forEach items="${soldlist }" var="soldlist">
								<tr>
                            	<th scope="col">${soldlist.work.workNo }</th>
                            	<th scope="col">
                            		<img src="/artistpage/workImg/${soldlist.work.workImg }" style="width:100px; height:100px;">	
                            	</th>
                            	<th scope="col"">${soldlist.work.workName }</th>
                            	<th scope="col"">${soldlist.order.receiverName }</th>
                            	<th scope="col">${soldlist.order.orderDate }</th>
                            	<th scope="col"><fmt:formatNumber value="${soldlist.order.workPrice }"/>원</th>                                
                           		<th scope="col" colspan="1">
                           			<a class="artist-detail-btn" onclick="showDetail('${workreport.work.workNo }')">작품상세보기</a>
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
	function showDetail(workNo){
		applyproduct.style.display = "flex";
		$.ajax({
			type:"post",
			dataType:"text",
			async: false,
			url:"${pageContext.request.contextPath}/artistpage/productdetail",
			data:{"workNo":workNo},
			success: function(data, textStatus){ 
			 	var workData = JSON.parse(data);
			 	$('#workapplyNo').attr("value", workData.workNo);
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
	$(function(){
		$(document).on('click', '#workenroll', function(e){
			modal.style.display = "flex";
	    });
	    $(document).on('click', '#cancel', function(e){
	    	applyproduct.style.display = "none";
	    });
	    $(document).on('click', '#refuse_close', function(e){
	    	applyproduct.style.display = "none";
	    });
	});
	</script>
</body>
</html>