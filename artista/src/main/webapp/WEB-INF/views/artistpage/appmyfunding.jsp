<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script	src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>
</head>
<body>
	<%@include file="../header.jsp"%>
	<div id="applyfunding" class="modal-overlay">
        <div class="modal-window">
            <header class="modal-header">
            	<div id="apply_close" class="close-area">X</div>
                <h2 class="modal-header-title">펀딩 신청내용</h2>
            </header>
            <article class="modal-body">
                    <div class="modal-modify-form-border"></div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 아이디
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" id="id" type="text" disabled />
                        </div>
                    </div>
                    
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 아티스트 이름
                        </div>
                        <div class="modal-modify-form-row-value">
                        	<input class="modal-modify-form-input" id="artistName" type="text" disabled />
                        </div>
                    </div>    
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 이메일
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" id="email" type="text" disabled />
                        </div>
                    </div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 목표 금액
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" id="targetFunding" type="text" disabled />
                        </div>
                    </div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 펀딩 일정
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" id="Date" type="text" disabled />
                        </div>
                    </div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 대관장소
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" id="place" type="text" disabled />
                        </div>
                    </div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 프로젝트 제목
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" id="projTitle" type="text" disabled />
                        </div>
                    </div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 프로젝트 소개
                        </div>
                        <div class="modal-modify-form-row-value">
                        	<textarea id="projectIntro" style="width: 250px;"></textarea>
                        </div>
                    </div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 예산정보
                        </div>
                        <div class="modal-modify-form-row-value">
                            <textarea id="projectBudgetInfo" style="width: 250px;"></textarea>
                        </div>
                    </div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 작가소개
                        </div>
                        <div class="modal-modify-form-row-value">
                            <textarea id="projectArtistInfo" style="width: 250px;"></textarea>
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
				<h3 class="account-guide-name">${mem.name }님반갑습니다.</h3>
				<a class="account-modify-btn" href="mypage/mypagemodify"
					onclick="gaClickAccount('account_modify');">
					<p>작가 정보</p>
				</a>
			</div>
		</section>
		<nav class="manager-nav">
			<a class="manager-nav-btn current"
				href="${pageContext.request.contextPath}/artistpage/mywork"> 전체
				작품 </a> <a class="manager-nav-btn"
				href="${pageContext.request.contextPath}/artistpage/myproduct">
				판매 작품 </a> <a class="manager-nav-btn"
				href="${pageContext.request.contextPath}/artistpage/myfunding">
				나의 펀딩 </a> <a class="manager-nav-btn"
				href="${pageContext.request.contextPath}/artistpage/myexhibition">
				나의 전시 </a>
		</nav>


		<nav class="member-nav">
			<a class="member-nav-btn" href="${pageContext.request.contextPath}/artistpage/myfunding">
                나의 리스트
            </a>
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/artistpage/appmyfunding">
                <b>신청 내역</b>
            </a>
			<a class="member-delete-btn"
				href="${pageContext.request.contextPath}/artistpage/applyfunding">
				펀딩 신청 </a>
		</nav>

		<div class="mypage-project bg">
			
		<article class="member-body">
            <section class="member-list">
                <table class="member-table">
                    <thead>
                    <tr>
                        <th scope="col">펀딩 신청번호</th>
                        <th scope="col">프로젝트 제목</th>
                        <th scope="col">목표금액</th>
                        <th scope="col">대관장소</th>
                        <th scope="col">신청상태</th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <c:choose>
                    	<c:when test="${list!=null }">
                    	<tbody>
                    		<c:forEach items="${list }" var="funding">
                    			<tr>
                            	<th scope="col">${funding.fundingNo }</th>
                            	<th scope="col">${funding.projTitle }</th>
                            	<th scope="col">${funding.targetFunding }</th>
                            	<th scope="col">${funding.getplace } </th> 
                            	<th scope="col" class="applyState">
                            		<c:if test="${funding.applyStatus eq 0}">등록 검토중</c:if>
                            		<c:if test="${funding.applyStatus eq 1}">등록 거절</c:if>
                            		<c:if test="${funding.applyStatus eq 2}">수정 검토중</c:if>
                            		<c:if test="${funding.applyStatus eq 3}">수정 거절</c:if>
                            	</th>
                            	<th scope="col">
                           			<a class="artist-detail-btn" onclick="fundingDetail('${funding.fundingNo }')">신청 상세보기</a>
                            	</th>    
                           		<th scope="col">
                           			<c:if test="${funding.applyStatus eq 1}"><a class="artist-detail-btn" onclick="applyDetail('${funding.fundingNo }')">거절 사유</a></c:if>
                            		<c:if test="${funding.applyStatus eq 3}"><a class="artist-detail-btn" onclick="applyDetail('${funding.fundingNo }')">거절 사유</a></c:if>
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
	</div>

	<script>
	//modal창
    const applyfunding = document.getElementById("applyfunding");
    const refuseapply = document.getElementById("refuseapply");
    
    $(function(){
    	$(document).on('click', '.artist-detail-btn', function(e){
    		applyfunding.style.display = "flex";
    	});
    	$(document).on('click', '#apply_close', function(e){
    		applyfunding.style.display = "none";
    	});
    });
    $(function(){
    	$(document).on('click', '#refusemodal', function(e){
    		refuseapply.style.display = "flex";
    	});
    	$(document).on('click', '#refuse_close', function(e){
    		refuseapply.style.display = "none";
    	});
    	$(document).on('click', '#cancel', function(e){
    		refuseapply.style.display = "none";
    	});
    });
    
    function fundingDetail(fundingNo){
    	applyfunding.style.display = "flex";
		$.ajax({
			type:"post",
			dataType:"text",
			async: false,
			url:"http://localhost:8090/artistpage/fundingdetail",
			data:{"fundingNo":fundingNo},
			success: function(data, textStatus){ 
			 	var fundingData = JSON.parse(data);
			 	console.log(data);
			 	$("#id").attr("value", fundingData.id);
			 	$('#artistName').attr("value", fundingData.artistName);
			 	$('#email').attr("value", fundingData.email);
 			 	$("#targetFunding").attr("value", fundingData.funding.targetFunding);
 			 	$("#Date").attr("value", fundingData.funding.fundingDate);
 			 	$("#place").attr("value", fundingData.funding.getplace + " " + fundingData.funding.getplace2);
 			 	$("#projTitle").attr("value", fundingData.funding.projTitle);
 			 	$("#fundingNo").attr("value", fundingData.funding.fundingNo);
 			 	$("#projectIntro").editor.setData(fundingData.funding.projIntro);
 			 	$("#projectBudgetInfo").editor.setData(fundingData.funding.projBudget);
 			 	$("#projectArtistInfo").editor.setData(fundingData.funding.projArtist);
			},
			error:function(data, textStatus){
				alert("실패");
				alert(applyNo);
			}
		});
	}
    $(function(){
    	ClassicEditor.create(document.querySelector("#projectIntro"))
	    	.then(editor=>{
	    		window.editor = editor;
	    	    editor.isReadOnly = true;
	    	    const toolbarElement = editor.ui.view.toolbar.element;
	    	    toolbarElement.style.display = 'none';
	        	//editor.setData(fundingData.fundingapply.projIntro);
	        })
		    .catch((error) => {
	    	   	console.error(error);
		    });
	    	ClassicEditor.create(document.querySelector("#projectBudgetInfo"))
	    	.then(editor=>{
	    		window.editor = editor;
	    	    editor.isReadOnly = true;
	    	    const toolbarElement = editor.ui.view.toolbar.element;
	    	    toolbarElement.style.display = 'none';
	        	//editor.setData(fundingData.fundingapply.projBudget);
	        })
		    .catch((error) => {
	    	   	console.error(error);
		    });
	    	ClassicEditor.create(document.querySelector("#projectArtistInfo"))
	    	.then(editor=>{
	    		window.editor = editor;
	    	    editor.isReadOnly = true;
	    	    const toolbarElement = editor.ui.view.toolbar.element;
	    	    toolbarElement.style.display = 'none';
	        	//editor.setData(fundingData.fundingapply.projArtist);
	        })
		    .catch((error) => {
	    	   	console.error(error);
		    });
    })
    
    </script>

</body>
</html>