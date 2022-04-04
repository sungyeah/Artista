<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
	.workImg {
		width:300px; height:300px; margin-top:7px; display:inline-block;
	}
</style>
</head>
<body>
	<%@include file ="../header.jsp" %>
    <div id="contents">
    	<header class="account-header">
            <h2 class="account-header-title">작품 등록하기</h2>
            <div class="account-header-description">등록할 작품 정보를 입력하세요.</div>
        </header>

        <article class="enroll-body">
            <form class="enroll-modify-form" method="post" action="/artistpage/enrollworkComplete" enctype="multipart/form-data">
                 <div class="enroll-modify-form"></div>
                <div class="certification-container certified">
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 작품 이미지
                        </div>
                        <div class="enroll-modify-form-row-value">
                            <img class="workImg" id="workThumb" />
                            <input type="file" id="workImg" name="workImgFile" /><br>
                        </div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 작품명
                        </div>
                        <div class="enroll-modify-form-row-value">
                            <input class="enroll-modify-form-input" type="text" name="workName" placeholder="작품명을 입력하세요" autocomplete="off" autocorrect="off" autocapitalize="off" style="width:300px;"><br>
                        </div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 작품유형
                        </div>
                        <div class="enroll-modify-form-row-value">
                            <div class="wrap">
                                <div class="select">
  									<div class="selected">
    									<div class="selected-value">none</div>
    									<div class="arrow"></div>
  									</div>
  									<ul>
  									    <li class="option">회화</li>
  									    <li class="option">조각</li>
  									    <li class="option">사진</li>
  									    <li class="option">소묘</li>
  									    <li class="option">종이</li>
  									    <li class="option">기타매체</li>
  									</ul>
  								</div>
                            </div>
                            <input type="hidden" id="workType" name="workType" value="none"/>
                        </div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 작품기법
                        </div>
                        <div class="enroll-modify-form-row-label">
                            <input class="enroll-modify-form-input" type="text" name="workTech" placeholder="작품기법을 입력하세요" autocomplete="off" autocorrect="off" autocapitalize="off" style="width:300px;"><br>
                        </div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 작품사이즈
                        </div>
                        <div class="enroll-modify-form-row-value">
                            <input class="enroll-modify-form-input" type="text" name="workSize" placeholder="작품사이즈를 입력하세요"  autocomplete="off" autocorrect="off" autocapitalize="off" style="width:300px;"><br>
                        </div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 작품소개
                        </div>
                        <div class="enroll-modify-form-row-value">
                        	<textarea class="enroll-modify-form-input" name="workIntro" placeholder="최대 300자" maxlength="300" style="width:750px; height: 120px; resize: none;"></textarea>
                        </div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 픽업주소
                        </div>
                        <div class="enroll-modify-form-row-value">
                        	<input class="enroll-modify-form-input" type="text" id="getplace" placeholder="주소" style="width:300px;" onClick=searchAddress()>
                			<input class="enroll-modify-form-input" type="button" value="검색"  style="width:80px; padding-right:5px; " onClick=searchAddress()><br>
                			<input class="enroll-modify-form-input" type="text" id="getplace2" placeholder="상세주소" maxlength="30"  style="width:300px;"><br>
       						<input type="hidden" id="pickupAddress" name="pickupAddress" />
       					</div>
                    </div>
                    
                	<div class="account-modify-form-border">
                    	<div style="text-align: center; margin-top:15px; margin-bottom: 15px;">
                        	<button class="yesNo-btn" id="workenroll" style="width:120px;">작품등록</button>
                    		<button class="yesNo-btn" id="cancel" type="reset">취소</button>      
                    	</div>
                	</div>
                </div>
            </form>
        </article>
    </div>
    
    <script>
	// 작품 대표이미지 show
	$("#workImg").change(function (event) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$("#workThumb").attr("src", e.target.result);	
		};
		reader.readAsDataURL(event.target.files[0]);
	});
	
	// 작품 등록 또는 취소
	$("#workenroll").click(function (event) {
		$("#workType").attr("value", $(".selected-value").text());
		$("#pickupAddress").attr("value", $("#getplace").val() +" " + $("#getplace2").val());
		$("#workenroll").submit();
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
	</script>

        
</body>
</html>