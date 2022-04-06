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
<link rel="stylesheet" href="../css/mypage.css">
<link rel="stylesheet" href="../css/applymodal.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
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
                    홍성호님 반갑습니다.
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
        </nav>
        
		<article class="member-body">
            <section class="member-list">
                <table class="member-table">
                    <thead>
                    <tr>
                        <th scope="col" class="artistNo">작품 번호</th>
                        <th scope="col" class="id">작품 제목</th>
                        <th scope="col" class="artistType">구매자</th>
                        <th scope="col" class="artistName">주문일자</th>
                        <th scope="col" class="artistType">작품 가격</th>
                        <th scope="col" class="artistType">송장번호</th>
                        <th scope="col" class="artistType">현재상태</th>
                        <th scope="col" class="artistType"></th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr>
	                    	<th scope="col" class="artistNo">작품 번호</th>
                        	<th scope="col" class="id">작품 제목</th>
                        	<th scope="col" class="artistType">구매자</th>
                        	<th scope="col" class="artistName">주문일자</th>
                        	<th scope="col" class="artistType">작품 가격</th>
                        	<th scope="col" class="artistType">송장번호</th>
                        	<th scope="col" class="artistType">배송준비중</th>
                        	<th scope="col" class="artistType">
                        		<a class="artist-detail-btn" onclick="applyDetail('')">
                                    송장번호 입력
                                </a>
                        	</th>
                        </tr>
                        <tr>
                            <th scope="col" class="artistNo">작품 번호</th>
                        	<th scope="col" class="id">작품 제목</th>
                        	<th scope="col" class="artistType">구매자</th>
                        	<th scope="col" class="artistName">주문일자</th>
                        	<th scope="col" class="artistType">작품 가격</th>
                        	<th scope="col" class="artistType">송장번호</th>
                        	<th scope="col" class="artistType">배송중</th>
                        	<th scope="col" class="artistType">
                        		<a class="artist-detail-btn" href="/account/modify/" onclick="gaClickAccount('account_modify');">
                                    배송완료처리
                                </a>
                        	</th>
                        </tr>
                        <tr>
                            <th scope="col" class="artistNo">작품 번호</th>
                        	<th scope="col" class="id">작품 제목</th>
                        	<th scope="col" class="artistType">구매자</th>
                        	<th scope="col" class="artistName">주문일자</th>
                        	<th scope="col" class="artistType">작품 가격</th>
                        	<th scope="col" class="artistType">송장번호</th>
                        	<th scope="col" class="artistType">배송완료</th>
                        	<th scope="col" class="artistType">
                        		
                        	</th>
                        </tr>
                    </tbody>
                </table>
            </section>
        </article>
	</div>
	
	<script>
	function applyDetail(applyNo){
		modal.style.display = "flex";
		
	}
	$(function(){
		$(document).on('click', '#workenroll', function(e){
			modal.style.display = "flex";
	    });
	    $(document).on('click', '#cancel', function(e){
	    	modal.style.display = "none";
	    });
	    $(document).on('click', '#refuse_close', function(e){
	    	modal.style.display = "none";
	    });
	});
	</script>
</body>
</html>