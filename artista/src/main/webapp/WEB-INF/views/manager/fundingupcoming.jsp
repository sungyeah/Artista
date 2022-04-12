<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<%@include file ="../header.jsp" %>
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
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/manager/fundingapplylist">
                펀딩 신청 목록
            </a>
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/manager/fundingupcoming">
                펀딩 예정
            </a>
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/manager/fundingproceeding">
                진행중인 펀딩
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
                    </tr>
                    </thead>
                    <c:choose>
                    	<c:when test="${fundingUpList!=null }">
                    	<tbody>
                    		<c:forEach items="${fundingUpList }" var="funding">
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
	//modal창
    const applyfunding = document.getElementById("applyfunding");
    
    $(function(){
    	$(document).on('click', '.close-area', function(e){
    		applyfunding.style.display = "none";
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
 			 	projectIntro.setData(fundingData.funding.projIntro);
 			 	projectBudgetInfo.setData(fundingData.funding.projBudget);
 			 	projectArtistInfo.setData(fundingData.funding.projArtist);
			},
			error:function(data, textStatus){
				alert("실패");
			}
		});
	}
    
    let projectIntro;
    let projectBudgetInfo;
    let projectArtistInfo;
    ClassicEditor.create(document.querySelector("#projectIntro"))
	.then(editor=>{
		window.editor = editor;
	    editor.isReadOnly = true;
	    const toolbarElement = editor.ui.view.toolbar.element;
	    toolbarElement.style.display = 'none';
	    projectIntro=editor;
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
	    projectBudgetInfo=editor;
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
	    projectArtistInfo=editor;
    })
    .catch((error) => {
	   	console.error(error);
    });
    </script>
</body>
</html>