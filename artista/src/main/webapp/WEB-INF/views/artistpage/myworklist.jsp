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
</head>
<body>
    <div id="modal" class="modal-overlay">
        <div class="modal-window">
            <header class="modal-header">
                <h2 class="modal-header-title">작가등록 신청 내용 내용은 수정햐야함!</h2>
            </header>
            <article class="modal-body">
                <form class="modal-modify-form" method="post">
                    <input type="hidden" name="csrfmiddlewaretoken" value="8OgojRYOprkIqojoq6rJDIRZ5GySLqG97ZObqNAuZ7hU3OWjqtvuReHD9X6DBckA">
                    <div class="modal-modify-form-border"></div>
                    
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 전시 포스터
                        </div>
                        <div class="account-modify-form-row-value">
                            <img style="width:300px; height:300px; margin-top:10px; margin-bottom: 10px; padding-left: 12px;"/>
                        </div>
                    </div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 펀딩번호
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" type="text" name="new_password1" placeholder="" maxlength="20" autocomplete="off" autocorrect="off" autocapitalize="off" disabled><br>
                        </div>
                    </div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 전시명
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" type="text" name="new_password1" placeholder="" maxlength="20" autocomplete="off" autocorrect="off" autocapitalize="off" disabled><br>
                        </div>
                    </div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 전시작가
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" type="text" name="new_password1" placeholder="" maxlength="20" autocomplete="off" autocorrect="off" autocapitalize="off" disabled><br>
                        </div>
                    </div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 전시일정
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-date" type="text" name="new_password1" placeholder="" maxlength="20" autocomplete="off" autocorrect="off" autocapitalize="off" disabled> - 
                            <input class="modal-modify-form-date" type="text" name="new_password1" placeholder="" maxlength="20" autocomplete="off" autocorrect="off" autocapitalize="off" disabled><br>
                        </div>
                    </div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 전시장소
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" type="text" name="new_password1" placeholder="" maxlength="20" autocomplete="off" autocorrect="off" autocapitalize="off" disabled>
                        </div>
                    </div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 예매링크
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" type="text" name="new_password1" placeholder="" maxlength="20" autocomplete="off" autocorrect="off" autocapitalize="off" disabled><br>
                        </div>
                    </div>

                    <div class="modal-modify-form-border">
                        <div style="text-align: center; margin-top:15px; margin-bottom: 15px;">
                            <a class="yesNo-btn" id="workenroll">거절</a>                    
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
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/manager/memberlist">
                일반회원
            </a>
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/manager/artistlist">
                아티스트
            </a>
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/manager/artistapplylist">
                아티스트 신청
            </a>
        </nav>
        <article class="member-body">
            <section class="member-list">
                <table class="member-table">
                    <thead>
                    <tr>
                        <th scope="col" class="artistNo">아티스트 신청 번호</th>
                        <th scope="col" class="id">아이디</th>
                        <th scope="col" class="artistName">아티스트 필명</th>
                        <th scope="col" class="artistType">아티스트 유형</th>
                        <th scope="col" class="artistType">신청유형</th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="col" class="artistNo">아티스트 신청 번호</th>
                            <th scope="col" class="id">아이디</th>
                            <th scope="col" class="artistName">아티스트 필명</th>
                            <th scope="col" class="artistType">아티스트 유형</th>
                            <th scope="col" class="artistType">신청유형</th>
                            <th scope="col">
                                <a class="artist-detail-btn" href="/account/modify/" onclick="gaClickAccount('account_modify');">
                                    신청 상세보기
                                </a>
                            </th>
                        </tr>
                        <tr>
                            <th scope="col" class="artistNo">아티스트 신청 번호</th>
                            <th scope="col" class="id">아이디</th>
                            <th scope="col" class="artistName">아티스트 필명</th>
                            <th scope="col" class="artistType">아티스트 유형</th>
                            <th scope="col" class="artistType">신청유형</th>
                            <th scope="col">
                                <a class="artist-detail-btn" href="/account/modify/" onclick="gaClickAccount('account_modify');">
                                    신청 상세보기
                                </a>
                            </th>
                        </tr>
                    </tbody>
                </table>
            </section>
        </article>
	</div>
</body>
</html>