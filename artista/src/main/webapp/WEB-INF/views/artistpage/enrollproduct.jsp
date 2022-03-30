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
<link rel="stylesheet" href="../css/enroll.css">
</head>
<body>
    <div id="contents">
    	<header class="account-header">
            <h2 class="account-header-title">판매작품 등록하기</h2>
            <div class="account-header-description">등록할 작품 정보를 입력하세요.</div>
        </header>

        <article class="enroll-body">
            <form class="enroll-modify-form" method="post">
                <input type="hidden" name="csrfmiddlewaretoken" value="8OgojRYOprkIqojoq6rJDIRZ5GySLqG97ZObqNAuZ7hU3OWjqtvuReHD9X6DBckA">
                <div class="enroll-modify-form"></div>
                
                <div class="certification-container  certified">
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 작품 이미지
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
                            <span class="red">*</span> 작품명
                        </div>
                        <div class="enroll-modify-form-row-value">
                            <input class="enroll-modify-form-input" type="text" name="new_password1" placeholder="작품명을 입력하세요" maxlength="20" autocomplete="off" autocorrect="off" autocapitalize="off"><br>
                        </div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 작품유형
                        </div>
                        <div class="enroll-modify-form-row-value">
                            <div class="wrap">
                                <div class="select_box">
                                    <div class="box">
                                        <div class="select">선택</div>
                                        <ul class="list">
                                            <li class="selected">선택</li>
                                            <li>항목01</li>
                                            <li>항목02</li>
                                            <li>항목03</li>
                                            <li>항목04</li>
                                            <li>항목05</li>
                                            <li>항목06</li>
                                            <li>항목07</li>
                                            <li>항목08</li>
                                            <li>항목09</li>
                                            <li>항목10</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 작품기법
                        </div>
                        <div class="enroll-modify-form-row-label">
                            <input class="enroll-modify-form-input" type="text" name="new_password1" placeholder="작품기법을 입력하세요" maxlength="20" autocomplete="off" autocorrect="off" autocapitalize="off"><br>
                        </div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 작품사이즈
                        </div>
                        <div class="enroll-modify-form-row-value">
                            <input class="enroll-modify-form-input" type="text" name="new_password1" placeholder="작품사이즈를 입력하세요" maxlength="20" autocomplete="off" autocorrect="off" autocapitalize="off"><br>
                        </div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 작품가격
                        </div>
                        <div class="enroll-modify-form-row-value">
                            <input class="enroll-modify-form-input" type="text" name="new_password1" placeholder="작품사이즈를 입력하세요" maxlength="20" autocomplete="off" autocorrect="off" autocapitalize="off"><br>
                        </div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 작품소개
                        </div>
                        <div class="enroll-modify-form-row-value">
                            <input class="enroll-modify-form-input" type="textarea" name="new_password1" placeholder="작품사이즈를 입력하세요" maxlength="20" autocomplete="off" autocorrect="off" autocapitalize="off"><br>
                        </div>
                    </div>
                    
                <div class="account-modify-form-border">
                    <div style="text-align: center; margin-top:15px; margin-bottom: 15px;">
                        <a class="yesNo-btn" id="workenroll">작품 등록</a>                    
                        <a class="yesNo-btn" id="cancel">등록 취소</a>      
                    </div>
                </div>
            </form>
        </article>
    </div>
        
</body>
</html>