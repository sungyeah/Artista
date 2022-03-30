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
            <h2 class="account-header-title">작가등록 신청</h2>
            <div class="account-header-description">등록할 작가정보를 입력하세요.</div>
        </header>

        <article class="enroll-body">
            <form class="enroll-modify-form" method="post">
                <input type="hidden" name="csrfmiddlewaretoken" value="8OgojRYOprkIqojoq6rJDIRZ5GySLqG97ZObqNAuZ7hU3OWjqtvuReHD9X6DBckA">
                <div class="enroll-modify-form"></div>
                
                <div class="certification-container  certified">
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 프로필 사진
                        </div>
                        <div class="enroll-modify-form-row-value">
                            <img style="width:300px; height:300px; margin-top:7px; display:inline-block;"/>
                            <a class="yesNo-btn" href="/account/delete/" style=" display:inline-block;">
                                사진선택
                            </a>
                        </div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 아이디
                        </div>
                        <div class="enroll-modify-form-row-value">
                            <input class="enroll-modify-form-input" type="text" autocomplete="off" autocorrect="off" autocapitalize="off" disabled><br>
                        </div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 필명
                        </div>
                        <div class="enroll-modify-form-row-value">
                            <input class="enroll-modify-form-input" type="text" placeholder="필명을 입력하세요" autocomplete="off" autocorrect="off" autocapitalize="off"><br>
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
                                            <li class="selected">화가</li>
                                            <li>조각가</li>
                                            <li>사진가</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 이메일
                        </div>
                        <div class="enroll-modify-form-row-label">
                            <input class="enroll-modify-form-input" type="text" placeholder="아티스트 이메일을 입력하세요" autocomplete="off" autocorrect="off" autocapitalize="off" style="width:500px;"><br>
                        </div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 아티스트 소개
                        </div>
                        <div class="enroll-modify-form-row-value">
                            <input class="enroll-modify-form-input" type="textarea" placeholder="아티스트의 소개을 입력하세요" autocomplete="off" autocorrect="off" autocapitalize="off" style="width:500px;"><br>
                        </div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 아티스트의 이력
                        </div>
                        <div class="enroll-modify-form-row-value">
                            <div class="wrap">
                                <div class="select_box">
                                    <div class="box">
                                        <div class="select">선택</div>
                                        <ul class="list">
                                            <li class="selected">수상</li>
                                            <li>전시</li>
                                            <li>사진가</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 아티스트의 작업세계 
                        </div>
                        <div class="enroll-modify-form-row-value">
                            <a class="yesNo-btn" href="/account/delete/">
                                사진선택
                            </a>
                        </div>
                    </div>
                    
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 인스타그램링크
                        </div>
                        <div class="enroll-modify-form-row-value">
                            <input class="enroll-modify-form-input" placeholder="아티스트 instagram 링크를 입력하세요" autocomplete="off" autocorrect="off" autocapitalize="off" style="width:500px;"><br>
                        </div>
                    </div>
                    
                	<div class="account-modify-form-border">
                    	<div style="text-align: center; margin-top:15px; margin-bottom: 15px;">
                        	<a class="yesNo-btn" id="workenroll" style="width:120px;">아티스트 신청</a>                    
                        	<a class="yesNo-btn" id="cancel">취소</a>      
                    	</div>
                	</div>
                </div>
            </form>
           
        </article>
    </div>
        
</body>
</html>