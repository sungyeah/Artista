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
<link rel="stylesheet" href="../css/applyfunding.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<style>
	.posterImg {
		width:308px; height:300px; margin-top:7px; display:inline-block;
	}
</style>
</head>
<body>
	<%@include file ="../header.jsp" %>
    <div id="contents">
    	<header class="account-header">
            <h2 class="account-header-title">전시 내용수정 요청하기</h2>
            <div class="account-header-description">전시 정보를 입력하세요.</div>
        </header>

        <article class="enroll-body">
        	<form id="form" class="enroll-modify-form" method="post" action="/artistpage/exhibitModifyComplete" enctype="multipart/form-data">
            	<div class="enroll-modify-form"></div>
                <div class="certification-container certified">
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 전시포스터
                        </div>
                        <div class="enroll-modify-form-row-value">
                        	<input type="hidden" value="1" id="fileChange" name="fileChange" />
                        	<img class="posterImg" id="posterThumb" src="/artistpage/posterImg/${exhibit.exhibitPoster }" />
                            <label for="posterImg">파일 선택</label>
                            <input type="file" id="posterImg" name="posterImgFile" /><br>
                       
                        </div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 펀딩번호
                        </div>
                        <div class="enroll-modify-form-row-value">
                            <input class="enroll-modify-form-input" type="number" id="fundingNo" name="fundingNo" value="${exhibit.fundingNo }" placeholder="연결 펀딩번호를 입력하세요"  autocomplete="off" autocorrect="off" autocapitalize="off" style="width:300px;"><br>
                       	</div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 전시명
                        </div>
                        <div class="enroll-modify-form-row-value">
                        	<input class="enroll-modify-form-input" type="text" id="exhibitTitle" name="exhibitTitle" value="${exhibit.exhibitTitle }" placeholder="전시 제목을 입력하세요"  autocomplete="off" autocorrect="off" autocapitalize="off" style="width:300px;"><br>
                        </div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 전시작가
                        </div>
                        <div class="enroll-modify-form-row-label">
                        	<input class="enroll-modify-form-input" type="text" id="exhibitArtist" name="exhibitArtist" value="${exhibit.exhibitArtist }" placeholder="전시에 참여한 작가 이름을 입력하세요"  autocomplete="off" autocorrect="off" autocapitalize="off" style="width:300px;"><br>
                        
                        </div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 전시일정
                        </div>
                        <div class="enroll-modify-form-row-value">
                        	<input class="enroll-modify-form-input" id="exhibitDate" name="exhibitDate" value="${exhibit.startDate }-${exhibit.endDate }" style="width:300px;" />
                       	</div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 전시장소
                        </div>
                        <div class="enroll-modify-form-row-value">
                        	<input class="enroll-modify-form-input" type="text" id="getplace" value="${exhibit.exhibitPlace }" placeholder="주소" style="width:300px;" onClick=searchAddress()>
                			<input class="change-password-btn" type="button" value="검색"  style="width:84px;margin-top:7px" onClick=searchAddress()><br>
                			<input class="enroll-modify-form-input" type="text" id="getplace2" placeholder="상세주소" maxlength="30"  style="width:300px;"><br>
       						<input type="hidden" id="exhibitPlace" name="exhibitPlace" />
       					
                        </div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 예매링크
                        </div>
                        <div class="enroll-modify-form-row-value">
                        	<textarea class="enroll-modify-form-input" id="reserveLink" name="reserveLink" placeholder="최대 300자" maxlength="300" style="width:750px; height: 120px; resize: none;">${exhibit.reserveLink }</textarea>
                        </div>
                    </div>  
                    <div class="account-modify-form-border">
                    	<div style="text-align: center; margin-top:15px; margin-bottom: 15px;">
                        	<button class="yesNo-btn" type="button" id="exhibitApply" style="width:120px;">작품수정 신청</button>
                    		<button class="yesNo-btn" id="cancel" type="reset">취소</button>      
                    	</div>
                	</div>
                	<input type="hidden" name="exhibitNo" value="${exhibit.exhibitNo }"/>
                </div>
        	</form>
        </article>
    </div>
    
    <%@include file ="../footer.jsp" %>

    <script>
    $(function(){
    	$(document).on("click","#exhibitApply", function(){
    		if($("#posterImg").src==""){
    			alert("포스터 사진을 입력해주세요");
    			return false;
    		}
        	if($("#fundingNo").val()==""){
    			alert("펀딩번호을 입력해주세요");
    			return false;
    		}
        	if($("#exhibitTitle").val()==""){
    			alert("전시 제목을 선택해주세요");
    			return false;
    		}
        	if($("#exhibitArtist").val()==""){
    			alert("전시 참여 작가를 입력해주세요");
    			return false;
    		}
        	if($("#exhibitDate").val()==""){
    			alert("전시 일정을 입력해주세요");
    			return false;
    		}
    		if($("#getplace").val()==""){
    			alert("전시 장소를 입력해주세요");
    			return false;
    		}
    		if($("#reserveLink").val()==""){
    			alert("전시 예매 링크를 입력해주세요");
    			return false;
    		}
    		
    		$("#form").submit();	
    	});
    	
    });
	// 작품 대표이미지 show
	$("#posterImg").change(function (event) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$("#posterThumb").attr("src", e.target.result);	
		};
		$("#fileChange").val("0");
		reader.readAsDataURL(event.target.files[0]);
	});
	// 전시등록 신청 또는 취소
	$("#exhibitApply").click(function (event) {
		$("#exhibitPlace").attr("value", $("#getplace").val() +" " + $("#getplace2").val());
		$("#exhibitApply").submit();
	});
	$("#cancel").click(function () {
		window.history.back();
	});
	</script>

	<script>
	// selectbox 구현
	$(document).on("click", ".select", function(e){
		const selectBoxElements = document.querySelectorAll(".select");
		function toggleSelectBox(selectBox) {
			selectBox.classList.toggle("active");
		}
		function selectOption(optionElement) {
			const selectBox = optionElement.closest(".select");
		  	const selectedElement = selectBox.querySelector(".selected-value");
		  	selectedElement.textContent = optionElement.textContent;
		}
		selectBoxElements.forEach(selectBoxElement => {
			selectBoxElement.addEventListener("click", function (e) {
		    	const targetElement = e.target;
		    	const isOptionElement = targetElement.classList.contains("option");
		    	if (isOptionElement) {
		      		selectOption(targetElement);
		    	}
		    	toggleSelectBox(selectBoxElement);
		  	});
		});
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
	$(function() {
	     $("#exhibitDate").daterangepicker({
	    	    locale: {
	    	        "separator": " ~ ",                     // 시작일시와 종료일시 구분자
	    	        "format": 'YYYY-MM-DD HH',     // 일시 노출 포맷
	    	        "applyLabel": "확인",                    // 확인 버튼 텍스트
	    	        "cancelLabel": "취소",                   // 취소 버튼 텍스트
	    	        "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
	    	        "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
	    	        },
	    	        timePicker: true,                        // 시간 노출 여부
	    	        showDropdowns: true,                     // 년월 수동 설정 여부
	    	        autoApply: true,                         // 확인/취소 버튼 사용여부
	    	        timePicker24Hour: true,                  // 24시간 노출 여부(ex> true : 23:50, false : PM 11:50)
	    	    });
	   });
	</script>




</body>
</html>