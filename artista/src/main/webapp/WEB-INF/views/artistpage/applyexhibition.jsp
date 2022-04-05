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
<style>
	.posterImg {
		width:300px; height:300px; margin-top:7px; display:inline-block;
	}
</style>

</head>
<body>
    <div id="contents">
    	<header class="account-header">
            <h2 class="account-header-title">전시등록 신청하기</h2>
            <div class="account-header-description">등록할 젼시 정보를 입력하세요.</div>
        </header>

        <article class="enroll-body">
            <form class="enroll-modify-form" method="post" action="/artistpage/exhibitionApplyComplete" enctype="multipart/form-data">
                <div class="enroll-modify-form"></div>
                <div class="certification-container  certified">
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 전시포스터
                        </div>
                        <div class="enroll-modify-form-row-value">
                            <img class="posterImg" id="posterThumb" />
                            <input type="file" id="posterImg" name="posterImgFile" /><br>
                        </div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 펀딩번호
                        </div>
                        <div class="enroll-modify-form-row-value">
                            <input class="enroll-modify-form-input" type="number" name="fundingNo" placeholder="연결 펀딩번호를 입력하세요"  autocomplete="off" autocorrect="off" autocapitalize="off" style="width:300px;"><br>
                        </div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 전시명
                        </div>
                        <div class="enroll-modify-form-row-value">
                            <input class="enroll-modify-form-input" type="text" name="exhibitTitle" placeholder="전시 제목을 입력하세요"  autocomplete="off" autocorrect="off" autocapitalize="off" style="width:300px;"><br>
                        </div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 전시작가
                        </div>
                        <div class="enroll-modify-form-row-value">
                            <input class="enroll-modify-form-input" type="text" name="exhibitArtist" placeholder="전시에 참여한 작가 이름을 입력하세요"  autocomplete="off" autocorrect="off" autocapitalize="off" style="width:300px;"><br>
                        </div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 전시일정
                        </div>
                        <div class="enroll-modify-form-row-value">
                            <input id="datepickerstart" class="enroll-modify-form-input" name="exhibitStartDate" style="display:inline-block;" /> - <input id="datepickerend" class="enroll-modify-form-input" name="exhibitEndDate" style="display:inline-block;" />
                        </div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 전시장소
                        </div>
                        <div class="enroll-modify-form-row-value">
                        	<input class="enroll-modify-form-input" type="text" id="getplace" placeholder="주소" style="width:300px;" onClick=searchAddress()>
                			<input class="enroll-modify-form-input" type="button" value="검색"  style="width:80px; padding-right:5px; " onClick=searchAddress()><br>
                			<input class="enroll-modify-form-input" type="text" id="getplace2" placeholder="상세주소" maxlength="30"  style="width:300px;"><br>
       						<input type="hidden" id="exhibitPlace" name="exhibitPlace" />
       					</div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 예매링크
                        </div>
                        <div class="enroll-modify-form-row-value">
                        	<textarea class="enroll-modify-form-input" name="reserveLink" placeholder="최대 300자" maxlength="300" style="width:750px; height: 120px; resize: none;"></textarea>
                        </div>
                    </div>
                	<div class="account-modify-form-border">
                    	<div style="text-align: center; margin-top:15px; margin-bottom: 15px;">
                        	<button class="yesNo-btn" id="exhibitApply" style="width:120px;">전시등록 신청</button>
                    		<button class="yesNo-btn" id="cancel" type="reset">취소</button>      
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
    
    <script>
	// 전시 포스터이미지 show
	$("#posterImg").change(function (event) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$("#posterThumb").attr("src", e.target.result);	
		};
		reader.readAsDataURL(event.target.files[0]);
	});
	
	// 전시등록 신청 또는 취소
	$("#exhibitApply").click(function (event) {
		//$("#workType").attr("value", $(".selected-value").text());
		$("#"exhibitPlace"").attr("value", $("#getplace").val() +" " + $("#getplace2").val());
		$("#exhibitApply").submit();
	});
	$("#cancel").click(function () {
		window.history.back();
	});
	</script>
	<script>
	// 다음 주소 api
	function searchAddress(){
		new daum.Postcode({
	        oncomplete: function(data) {
	        	$('#getplace').val(data.address);
	        	$('#getplace').prop("readonly",true);
	        }
	    }).open();
	}
	</script>
	
</body>
</html>