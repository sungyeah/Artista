<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script	src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
    <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link rel="stylesheet" href="../css/applyfunding.css">
<!-- <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<link rel="stylesheet" href="../css/applyfunding.css">
 --><title>Insert title here</title>
</head>
<style>

  </style>
<body>
	<%@include file ="../header.jsp" %>
    <form id="form" method="post" action="applyfunding" enctype="multipart/form-data" >
    <div id="contents">
        <header class="account-header">
            <h2 class="account-header-title">펀딩 신청</h2>
            <div class="account-header-description">펀딩 신청해 보자고</div>
        </header>
        <article class="account-body">
   	 	<div class="account-modify-form-border"></div>
        <div class="account-modify-form-row">
            <div class="account-modify-form-row-label">아이디</div>
            <div class="account-modify-form-row-value">
            	${id }
            	<input type="hidden" id="id" name="id" value='${id }'>
            </div>
        </div>
        <div class="account-modify-form-row">
            <div class="account-modify-form-row-label"> 이름 </div>
            <div class="account-modify-form-row-value">
                <div class="certification-value">${artistName }</div>
            </div>
        </div>
        <div class="account-modify-form-row">
            <div class="account-modify-form-row-label">이메일</div>
            <div class="account-modify-form-row-value">${email }</div>
        </div>

        <div class="account-modify-form-row">
            <div class="account-modify-form-row-label">
                목표 금액
            </div>
            <div class="account-modify-form-row-value">
                    <input class="account-modify-form-input" type="text" name="targetFunding" id="targetFunding" maxlength="20"><br>
            </div>
        </div>
        <div class="account-modify-form-row">
            <div class="account-modify-form-row-label">
                모금 일정 
            </div>
            <div class="account-modify-form-row-value">
                    <input class="account-modify-form-input" type="text" name="fundingDate" id="fundingDate" />
            </div>
        </div>
        <div class="account-modify-form-row">
            <div class="account-modify-form-row-label">
                장소 대관
            </div>
            <div class="account-modify-form-row-value">
                <input class="account-modify-form-input" type="text" name="getplace" id="getplace" placeholder="주소" maxlength="20" style="margin-bottom:7px;cursor:pointer" onClick=search3()>
                <input class="change-password-btn" type="button" id="search" value="검색" data-mode="change" onClick=search3()><br>
                <input class="account-modify-form-input" type="text" name="getplace2" id="getplace2" placeholder="상세주소" maxlength="20"><br>
       		</div>
       </div>
       <div class="account-modify-form-row">
            <div class="account-modify-form-row-label">
                대표 이미지
            </div>
            <div class="account-modify-form-row-value">
             	<input class="upload-name" value="파일선택" disabled="disabled">
				<label for="thumbImg">업로드</label>
            	<input id="thumbImg" type="file" name="thumbFile" class="upload-hidden" ><br>
            </div>
        </div>


    <div class="account-modify-form-border"></div>
    <div class="proj-content">
      <span class="question" id="que-1"><span id="que-1-toggle">+</span><span>프로젝트 소개</span></span>
      <div class="answer" id="ans-1">
        <div class="writing_title">
            <input type="text" id="projTitle" name="projTitle"
                placeholder="제목을 입력해 주세요." onfocus="this.placeholder=''"
                onblur="this.placeholder='제목을 입력해 주세요.'"
                style="width: 99%; height: 30px; margin: 15px 0 15px 0;" />
        </div>
        <div class="board_detail">
            <textarea  id="projIntro" name="projIntro" placeholder="프로젝트 소개를 써 주세요."></textarea>
        </div>
    	</div>
    	</div>
    	<div class="proj-content">
      <span class="question" id="que-2"><span id="que-2-toggle">+</span><span>예산 정보</span></span>
      <div class="answer" id="ans-2">
        <div class="board_detail">
            <textarea  id="projBudget" name="projBudget"  placeholder="예산에 대한 정보를 써 주세요."></textarea>
        </div>
      </div>
    	</div>
    	<div class="proj-content">
      <span class="question" id="que-3"><span id="que-3-toggle">+</span><span>작가 본인 소개</span></span>
      <div class="answer" id="ans-3">
        <div class="board_detail">
            <textarea  id="projArtist" name="projArtist" placeholder="작가 본인에 대한 소개를 써 주세요."></textarea>
        </div>
      </div>
    </div>
	</article>
	</div>
    <div class="a">
        <button class="yesNo-btn" style="background-color:#222;color:white;" type="button" onclick="apply()">신청</button>
        <button class="yesNo-btn" id="cancel" style="background-color:white;color:#222;margin-left:10px" type="reset">취소</button>
    </div>
    </form>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<script>
	
	
	function apply(){
		let targetFunding=$('#targetFunding').val();
			if(targetFunding==''){
				alert("목표 금액을 입력하세요.");
				$('#targetFunding').focus();
				return false;
			}
		let getplace=$('#getplace').val();
		if(getplace==''){
			alert("장소 대관을 입력하세요.");
			$('#getplace').focus();
			return false;
		}
		let thumbImg=$('#thumbImg').val();
		if(thumbImg==''){
			alert("대표 이미지를 입력하세요.");
			return false;
		}
		form.submit();
	}
	
	$("#cancel").click(function () {
		window.history.back();
	});
	
	function search3(){
		new daum.Postcode({
	        oncomplete: function(data) {
	        	$('#getplace').val(data.address);
	        	$('#getplace').prop("readonly",true);
	        }
	    }).open();
	    }
	</script>
    <script>
      const items = document.querySelectorAll('.question');
    
      function openCloseAnswer() {
        const answerId = this.id.replace('que', 'ans');
    
        if(document.getElementById(answerId).style.display === 'block') {
          document.getElementById(answerId).style.display = 'none';
          document.getElementById(this.id + '-toggle').textContent = '+';
        } else {
          document.getElementById(answerId).style.display = 'block';
          document.getElementById(this.id + '-toggle').textContent = '-';
        }
      }
    
      items.forEach(item => item.addEventListener('click', openCloseAnswer));

      $(function(){
        ClassicEditor
        	.create(document.querySelector("#projIntro"), {
        		ckfinder : {
        			uploadUrl : "/fundingApp"
        		}
        	}).then(editor1=> {
        		window.editor1=editor1;
        	})
        	.catch((error) => {
        		console.error(error);
        	});
	});
    $(function(){
        ClassicEditor
        	.create(document.querySelector("#projBudget"), {
        		ckfinder : {
        			uploadUrl : "/fundingApp"
        		}
        	}).then(editor2=> {
        		window.editor2=editor2;
        	})
        	.catch((error) => {
        		console.error(error);
        	});
	});
    $(function(){
        ClassicEditor
        	.create(document.querySelector("#projArtist"), {
        		ckfinder : {
        			uploadUrl : "/fundingApp"
        		}
        	}).then(editor3=> {
        		window.editor3=editor3;
        	})
        	.catch((error) => {
        		console.error(error);
        	});
	});
    
    $(function() {
      $("#fundingDate").daterangepicker({
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
   
    $(document).ready(function(){ 
    	var fileTarget = $('.account-modify-form-row-value .upload-hidden'); 
    	fileTarget.on('change', function(){ // 값이 변경되면 
    		if(window.FileReader){ // modern browser 
    			var filename = $(this)[0].files[0].name; 
    		} else { // old IE 
    			var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
    		} 
    		// 추출한 파일명 삽입 
    		$(this).siblings('.upload-name').val(filename); 
    	}); 
    });

    </script>    
</body>
</html>