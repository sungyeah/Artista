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
</head>
<body>


	<div id="applyproduct" class="modal-overlay">
        <div class="modal-window">
            <header class="modal-header">
            	<div id="apply_close" class="close-area">X</div>
                <h2 class="modal-header-title">작품판매 신청</h2>
            </header>
            <article class="modal-body">
                <form class="modal-modify-form" method="post">
                    <input type="hidden" name="csrfmiddlewaretoken" value="8OgojRYOprkIqojoq6rJDIRZ5GySLqG97ZObqNAuZ7hU3OWjqtvuReHD9X6DBckA">
                    <div class="modal-modify-form-border"></div>
                        
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 작품 이미지
                        </div>
                        <div class="modal-modify-form-row-value">
                        	<img style="width:300px; height:300px; margin-top:10px;" id="workImg"/>
                        </div>
                    </div>    
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 작품명
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" type="text" disabled />
                        </div>
                    </div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 작품유형
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" type="text" disabled />
                        </div>
                    </div>  
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 작품기법
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" type="text" disabled />
                        </div>
                    </div>  
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 작품사이즈
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" type="text" disabled />
                        </div>
                    </div>  
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 작품가격
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" type="text" disabled />
                        </div>
                    </div>  
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 작품소개
                        </div>
                        <div class="modal-modify-form-row-value">
                            <textarea class="modal-modify-form-input" style="width:300px; height: 120px; resize: none;" disabled></textarea>
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
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/manager/paymentlist">
                결제 전체내역
            </a>
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/manager/paycompletelist">
                판매완료 작품
            </a>
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/manager/productapplylist">
                판매작품 등록신청
            </a>
        </nav>
        
        <article class="member-body">
            <section class="member-list">
                <table class="member-table">
                    <thead>
                    <tr>
                        <th scope="col">작품 번호</th>
                        <th scope="col">작품 제목</th>
                        <th scope="col">아티스트 이름</th>
                        <th scope="col">작품 유형</th>
                        <th scope="col">신청유형</th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th scope="col" class="artistNo">아티스트 번호</th>
                        <th scope="col" class="artistName">아티스트 이름</th>
                        <th scope="col" class="workName">작품 제목</th>
                        <th scope="col" class="workType">작품 유형</th>
                        <th scope="col" class="applyState">수정신청</th>
                        <th scope="col"><a class="artist-detail-btn">상세보기</a></th>
                    </tr>
                    <tr>
                        <th scope="col" class="artistNo">아티스트 번호</th>
                        <th scope="col" class="artistName">아티스트 이름</th>
                        <th scope="col" class="workName">작품 제목</th>
                        <th scope="col" class="workType">작품 유형</th>
                        <th scope="col" class="applyState">등록신청</th>
                        <th scope="col"><a class="artist-detail-btn">상세보기</a></th>
                    </tr>
                    </tbody>
                </table>
            </section>
        </article>
    </div>
   

    
    <script>
    const applymodal = document.getElementById("applyproduct");
    const refuseapply = document.getElementById("refuseapply");
    
    
    $(function(){
    	$(document).on('click', '.artist-detail-btn', function(e){
    		applymodal.style.display = "flex";
    	});
    	$(document).on('click', '#apply_close', function(e){
    		applymodal.style.display = "none";
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
    
    
    </script>
</body>
</html>