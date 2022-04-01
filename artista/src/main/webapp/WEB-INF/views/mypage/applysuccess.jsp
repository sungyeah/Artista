<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Artista</title>
<link rel="stylesheet" href="../css/mypage.css">
<link rel="stylesheet" href="../css/enroll.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<style>
	.btn{
    	-webkit-text-size-adjust: 100%;
    	font-family: 'Noto Sans KR', sans-serif;
    	-webkit-font-smoothing: antialiased;
    	letter-spacing: -0.5px;
    	background: transparent;
    	text-decoration: none;
    	width: 150px;
    	height: 36px;
   		display: inline-block;
    	margin-left: 5px;
    	margin-right: 5px;
    	padding: 0;
    	border: 1px solid #dfdfdf;
    	font-size: 14px;
    	color: #989898;
    	line-height: 36px;
    	text-align: center;
	}
</style>
</head>
<body>
    <div id="contents">
    	<header class="account-header">
            <h2 class="account-header-title">작가등록 신청</h2>
        </header>
        <article class="enroll-body" style="margin-top:200px;">
        	<div class="account-modify-form-border">
            	<div class="account-header-description" style="text-align: center;">아티스트 등록 신청이 완료되었습니다.</div>
            </div><br>
        	<div class="account-modify-form-border">
            	<div style="text-align: center; margin-top:15px; margin-bottom: 15px;">
                	<button class="btn" onclick="location.href='/main'">마이페이지로 돌아가기</button>
                    <button class="btn">신청내용 보기</button>
                </div>
            </div>
		</article>
    </div>
       

</body>
</html>