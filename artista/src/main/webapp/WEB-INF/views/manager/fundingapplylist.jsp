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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script	src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>
</head>
<body>
	<%@include file ="../header.jsp" %>
	<div id="applyfunding" class="modal-overlay">
        <div class="modal-window">
            <header class="modal-header">
            	<div id="apply_close" class="close-area">X</div>
                <h2 class="modal-header-title">펀딩 신청</h2>
            </header>
            <article class="modal-body">
                <form class="modal-modify-form" method="post">
                    <input type="hidden" name="csrfmiddlewaretoken" value="8OgojRYOprkIqojoq6rJDIRZ5GySLqG97ZObqNAuZ7hU3OWjqtvuReHD9X6DBckA">
                    <div class="modal-modify-form-border"></div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 아이디
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" type="text" disabled />
                        </div>
                    </div>
                    
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 아티스트 이름
                        </div>
                        <div class="modal-modify-form-row-value">
                        	<input class="modal-modify-form-input" type="text" disabled />
                        </div>
                    </div>    
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 이메일
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" type="text" disabled />
                        </div>
                    </div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 목표 금액
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" type="text" disabled />
                        </div>
                    </div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 펀딩 일정
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" style="width:140px;" type="text" disabled /> - <input class="modal-modify-form-input" style="width:140px;" type="text" disabled />
                        </div>
                    </div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 대관장소
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" type="text" disabled />
                        </div>
                    </div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 프로젝트 제목
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" type="text" disabled />
                        </div>
                    </div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 프로젝트 소개
                        </div>
                        <div class="modal-modify-form-row-value">
                        	<!-- ckeditor -->
                            <textarea id="projectIntro" style="width: 250px;;"></textarea>
                        </div>
                    </div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 예산정보
                        </div>
                        <div class="modal-modify-form-row-value">
                        	<!-- ckeditor -->
                            <textarea id="projectBudgetInfo" style="width: 250px;;"></textarea>
                        </div>
                    </div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 작가소개
                        </div>
                        <div class="modal-modify-form-row-value">
                        	<!-- ckeditor -->
                            <textarea id="projectArtistInfo" style="width: 250px;;"></textarea>
                        </div>
                    </div>        
                    <div class="modal-modify-form-border">
                        <div style="text-align: center; margin-top:15px; margin-bottom: 15px;">
                            <a class="yesNo-btn" id="enroll">등록</a>                    
                            <a class="yesNo-btn" id="refusemodal">등록 거절</a>      
                        </div>
                    </div>
                    </form>
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
                <form class="modal-modify-form" method="post">
                    <input type="hidden" name="csrfmiddlewaretoken" value="8OgojRYOprkIqojoq6rJDIRZ5GySLqG97ZObqNAuZ7hU3OWjqtvuReHD9X6DBckA">
                    <div class="modal-modify-form-border"></div>
                        
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 거절사유
                        </div>
                        <div class="modal-modify-form-row-value">
                            <textarea class="modal-modify-form-input" style="width:300px; height: 120px; resize: none;"></textarea>
                        </div>
                    </div>                                
                    <div class="modal-modify-form-border">
                        <div style="text-align: center; margin-top:15px; margin-bottom: 15px;">
                            <a class="yesNo-btn" id="refuse">거절</a>                    
                            <a class="yesNo-btn" id="cancel">취소</a>      
                        </div>
                    </div>
                    </form>
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
                        <th scope="col">펀딩 신청번호</th>
                        <th scope="col">프로젝트 제목</th>
                        <th scope="col">아티스트 이름</th>
                        <th scope="col">목표금액</th>
                        <th scope="col">대관장소</th>
                        <th scope="col">신청상태</th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th scope="col" class="fundingNo">펀딩 신청번호</th>
                        <th scope="col" class="projTitle">프로젝트 제목</th>
                        <th scope="col" class="artistName">아티스트 이름</th>
                        <th scope="col" class="targetFunding">목표금액</th>
                        <th scope="col" class="getplace">대관장소</th>
                        <th scope="col" class="applyStatus">신청상태</th>
                        <th scope="col"><a class="artist-detail-btn">상세보기</a></th>
                    </tr>
                    <tr>
                        <th scope="col" class="fundingNo">펀딩 신청번호</th>
                        <th scope="col" class="projTitle">프로젝트 제목</th>
                        <th scope="col" class="artistName">아티스트 이름</th>
                        <th scope="col" class="targetFunding">목표금액</th>
                        <th scope="col" class="getplace">대관장소</th>
                        <th scope="col" class="applyStatus">신청상태</th>
                        <th scope="col"><a class="artist-detail-btn">상세보기</a></th>
                    </tr>
                    </tbody>
                </table>
            </section>
        </article>
    </div>
	<%@include file ="../footer.jsp" %>
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
    
    //ckeditor
    $(function(){
    	ClassicEditor.create(document.querySelector("#projectIntro"))
    	.then(editor=>{
    		window.editor = editor;
    	    editor.isReadOnly = true;
    	    const toolbarElement = editor.ui.view.toolbar.element;
    	    toolbarElement.style.display = 'none';
        	editor.setData();
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
        	editor.setData();
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
        	editor.setData();
        })
	    .catch((error) => {
    	   	console.error(error);
	    });
    });
    
    
    </script>

</body>
</html>