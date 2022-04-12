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
                <form class="modal-modify-form" method="post">
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
                     <input type="hidden" id="fundingNo" disabled/>
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
				판매 작품 </a> <a class="manager-nav-btn" style="background-color: black;color: white;"
				href="${pageContext.request.contextPath}/artistpage/myfunding">
				나의 펀딩 </a> <a class="manager-nav-btn"
				href="${pageContext.request.contextPath}/artistpage/myexhibition">
				나의 전시 </a>
		</nav>


		<nav class="member-nav">
			<a class="member-nav-btn" href="${pageContext.request.contextPath}/artistpage/myfunding">
                <b>나의 리스트</b>
            </a>
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/artistpage/appmyfunding">
                신청 내역
            </a>
			<a class="member-delete-btn"
				href="${pageContext.request.contextPath}/artistpage/applyfunding">
				펀딩 신청 </a>
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
                    	<c:when test="${list!=null }">
                    	<tbody>
                    		<c:forEach items="${list }" var="funding">
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
									<c:when test="${funding.fundingState==2}"><a class="artist-detail-btn" onclick="showDetail('${worklist.workapplyNo }')">스폰서 보기</a></c:when>
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
        
		<div class="mypage-project bg">
			<div class="project-list">
				<div id="projectCardList" class="card-list">
					<ul>
						<c:forEach items="${list }" var="funding">
							<li class="reward">
								<div class="visibility-control">
									<button type="button" class="btn-more">
										<i class="wadizicon wa-more-vert"></i>
									</button>
									<button type="button" class="btn-control"
										onclick="deletePrjt(143877)">삭제</button>
								</div>
								<div class="project-card-wrap">
									<div class="project-card">
										<div class="card-img-section">
											<div class="image-box">
												<em class="project-img"> <img
													src="/funding/thumbview/${funding.thumbImg}"
													class="image-thumb">
												</em>
											</div>

											<c:choose>
												<c:when test="${funding.fundingState == 1}">
													<em class="project-type reward">예정</em>
												</c:when>
												<c:when test="${funding.fundingState==2}">
													<em class="project-type reward">진행</em>
												</c:when>
												<c:otherwise>
													<em class="project-type reward">종료</em>
												</c:otherwise>
											</c:choose>
										</div>
										<div class="card-info-section making-project">
											<h4>${funding.projTitle }</h4>
											<h5>${funding.fundingDate }</h5>
											<p class="status confirm">
												<i></i>으아아앙악
											</p>
											<p></p>
										</div>
										<div class="btn-wrap">
											<button
												onClick="location.href=${pageContext.request.contextPath}/artistpage/modifyfunding"
												class="btn-line div1">펀딩 내용 수정 요청</button>
										</div>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
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
    
    function fundingDetail(applyNo){
    	applyfunding.style.display = "flex";
		$.ajax({
			type:"post",
			dataType:"text",
			async: false,
			url:"http://localhost:8090/manager/fundingapplydetail",
			data:{"applyNo":applyNo},
			success: function(data, textStatus){ 
			 	var fundingData = JSON.parse(data);
			 	$("#id").attr("value", fundingData.fundingapply.id);
			 	$('#artistName').attr("value", fundingData.artist.artistName);
			 	$('#email').attr("value", fundingData.email);
 			 	$("#targetFunding").attr("value", fundingData.fundingapply.targetFunding);
 			 	$("#Date").attr("value", fundingData.fundingapply.fundingDate);
 			 	$("#place").attr("value", fundingData.fundingapply.getplace + " " + fundingData.fundingapply.getplace2);
 			 	$("#projTitle").attr("value", fundingData.fundingapply.projTitle);
 			 	$("#fundingNo").attr("value", fundingData.fundingapply.fundingNo);
 			 	
 			 	ClassicEditor.create(document.querySelector("#projectIntro"))
 		    	.then(editor=>{
 		    		window.editor = editor;
 		    	    editor.isReadOnly = true;
 		    	    const toolbarElement = editor.ui.view.toolbar.element;
 		    	    toolbarElement.style.display = 'none';
 		        	editor.setData(fundingData.fundingapply.projIntro);
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
 		        	editor.setData(fundingData.fundingapply.projBudget);
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
 		        	editor.setData(fundingData.fundingapply.projArtist);
 		        })
 			    .catch((error) => {
 		    	   	console.error(error);
 			    });
 			 	
 			 	//$('#email').attr("src", "/artistpage/posterImg/"+exhibitData.exhibitPoster);
 			 	//$("#reserveLink").attr("value", exhibitData.reserveLink);
			},
			error:function(data, textStatus){
				alert("실패");
				alert(applyNo);
			}
		});
	}


</body>
</html>