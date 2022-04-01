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

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<link href="https://cdnjs.cloudflare.com/ajax/libs/air-datepicker/2.2.3/css/datepicker.min.css" rel="stylesheet" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/air-datepicker/2.2.3/js/datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/air-datepicker/2.2.3/js/i18n/datepicker.en.min.js"></script>

<style>
	.artistImg {
		width:300px; height:300px; margin-top:7px; display:inline-block;
	}

	.topadd_delete {
		cursor: pointer;
		float:right; 
		padding-left:10px; 
	}
	.artistsWorld {
		width:350px;  margin-bottom:12px; 
		float:left;
		display:inline-block;
	}
	.artistsWorldImg {
		width:300px; height:300px; margin-top:7px; display:inline-block; 
	}
	
	
</style>

</head>
<body>
    <div id="contents">
    	<header class="account-header">
            <h2 class="account-header-title">작가등록 신청 완료</h2>
            <div class="account-header-description">등록할 작가정보를 입력하세요.</div>
        </header>

		<button>마이페이지로 돌아가기</button>
		<button>신청내용 보기</button>
        <article class="enroll-body">
		</article>
    </div>
       

</body>
</html>