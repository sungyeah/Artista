<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Artista</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<link rel="stylesheet" href="../css/manager.css">
<link rel="stylesheet" href="../css/mypage.css">
<link rel="stylesheet" href="../css/enroll.css">
</head>
<body>
    <div id="contents">
    	<header class="account-header">
            <h2 class="account-header-title">전시등록 신청하기</h2>
            <div class="account-header-description">등록할 젼시 정보를 입력하세요.</div>
        </header>

        <article class="enroll-body">
            <form class="enroll-modify-form" method="post">
                <input type="hidden" name="csrfmiddlewaretoken" value="8OgojRYOprkIqojoq6rJDIRZ5GySLqG97ZObqNAuZ7hU3OWjqtvuReHD9X6DBckA">
                <div class="enroll-modify-form"></div>
                
                <div class="certification-container  certified">
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 전시포스터
                        </div>
                        <div class="enroll-modify-form-row-value">
                            <img style="width:300px; height:300px;"/>
                            <a class="yesNo-btn" href="/account/delete/">
                                사진선택
                            </a>
                        </div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 펀딩번호
                        </div>
                        <div class="enroll-modify-form-row-value">
                            <input class="enroll-modify-form-input" type="text" name="new_password1" placeholder="작품명을 입력하세요" maxlength="20" autocomplete="off" autocorrect="off" autocapitalize="off"><br>
                        </div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 전시명
                        </div>
                        <div class="enroll-modify-form-row-value">
                            <input class="enroll-modify-form-input" type="text" name="new_password1" placeholder="작품명을 입력하세요" maxlength="20" autocomplete="off" autocorrect="off" autocapitalize="off"><br>
                        </div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 전시작가
                        </div>
                        <div class="enroll-modify-form-row-value">
                            <input class="enroll-modify-form-input" type="text" name="new_password1" placeholder="작품명을 입력하세요" maxlength="20" autocomplete="off" autocorrect="off" autocapitalize="off"><br>
                        </div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 전시일정
                        </div>
                        <div class="enroll-modify-form-row-value">
                            <input id="datepickerstart" class="enroll-modify-form-input" style="display:inline-block;" /> - <input id="datepickerend" class="enroll-modify-form-input" style="display:inline-block;" />
                        </div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 전시장소
                        </div>
                        <div class="enroll-modify-form-row-value">
                            <input class="enroll-modify-form-input" type="text" name="new_password1" placeholder="작품명을 입력하세요" maxlength="20" autocomplete="off" autocorrect="off" autocapitalize="off"><br>
                        </div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 예매링크
                        </div>
                        <div class="enroll-modify-form-row-value">
                            <input class="enroll-modify-form-input" type="text" name="new_password1" placeholder="작품명을 입력하세요" maxlength="20" autocomplete="off" autocorrect="off" autocapitalize="off"><br>
                        </div>
                    </div>
                	<div class="account-modify-form-border">
                    	<div style="text-align: center; margin-top:15px; margin-bottom: 15px;">
                        	<a class="yesNo-btn" id="workenroll">작품 등록</a>                    
                        	<a class="yesNo-btn" id="cancel">등록 취소</a>      
                   		</div>
                	</div>
                </div>
            </form>
        </article>
    </div>
   
    <script type="text/javascript">
    	$("#datepickerstart").flatpickr({
    		dateFormat:"Y-m-d",
    		minDate: "today",
    		maxDate: new Date().fp_incr(30)
    	});
    	$("#datepickerend").flatpickr({
    		dateFormat:"Y-m-d",
    		minDate: "today",
    		maxDate: new Date().fp_incr(30)
    	});
    </script>
</body>
</html>