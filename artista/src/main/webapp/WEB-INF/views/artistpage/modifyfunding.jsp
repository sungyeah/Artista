<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script	src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
	<link rel="stylesheet" href="../css/applyfunding.css">
<title>Insert title here</title>
</head>
<style>

  </style>
<body>
          <form method="post" action="modifyfunding" enctype="multipart/form-data" >
    <div id="contents">
        
        <header class="account-header">
            <h2 class="account-header-title">펀딩 신청</h2>
            <div class="account-header-description">펀딩 신청해 보자고</div>
        </header>
        <article class="account-body">

    <div class="account-modify-form-border"></div>
        <div class="account-modify-form-row">
            <div class="account-modify-form-row-label">
                아이디
            </div>
            <div class="account-modify-form-row-value">
            	${mem.id }
            </div>
        </div>
        <div class="account-modify-form-row">
            <div class="account-modify-form-row-label">
                이름
            </div>
            <div class="account-modify-form-row-value">
                <div class="certification-value">
                	${mem.name }
                </div>
            </div>
        </div>
        <div class="account-modify-form-row">
            <div class="account-modify-form-row-label">
                이메일
            </div>
            <div class="account-modify-form-row-value">
            	${mem.email }
        </div>
        </div>

        <div class="account-modify-form-row">
            <div class="account-modify-form-row-label">
                목표 금액
            </div>
            <div class="account-modify-form-row-value">
                    <input class="account-modify-form-input" type="text" name="targetFunding" id="targetFunding" value="${funding.targetFunding }" maxlength="20"><br>
            </div>
        </div>
        <div class="account-modify-form-row">
            <div class="account-modify-form-row-label">
                모금 일정 
            </div>
            <div class="account-modify-form-row-value">
                    <input class="account-modify-form-input" type="text" name="fundingDate" id="fundingDate" value="${funding.fundingDate}" />
            </div>
        </div>
        <div class="account-modify-form-row">
            <div class="account-modify-form-row-label">
                장소 대관
            </div>
            <div class="account-modify-form-row-value">
                <input class="account-modify-form-input" type="text" name="getplace" id="getplace" value="${funding.getplace}" maxlength="20" style="cursor:pointer" onClick=search3()>
                <input class="change-password-btn" type="button" id="search" value="검색" data-mode="change" onClick=search3()><br>
                <input class="account-modify-form-input" type="text" name="getplace2" id="getplace2" value="${funding.getplace2}" placeholder="상세주소" maxlength="20"><br>
       		</div>
       </div>
       <div class="account-modify-form-row">
            <div class="account-modify-form-row-label">
                대표 이미지
            </div>
            <div class="account-modify-form-row-value">
                    <input id="thumbImg" class="account-modify-form-input" value="${funding.thumbImg}"  type="file" name="thumbImg" ><br>
            </div>
        </div>


    <div class="account-modify-form-border"></div>
    <div class="proj-content">
      <span class="question" id="que-1"><span id="que-1-toggle">+</span><span>프로젝트 소개</span></span>
      <div class="answer" id="ans-1">
        <div class="writing_title">
            <input type="text" id="projTitle" name="projTitle"
                value="${funding.projTitle}" onfocus="this.placeholder=''"
                onblur="this.placeholder='제목을 입력해 주세요.'"
                style="width: 99%; height: 30px; margin: 15px 0 15px 0;" />
        </div>
        <div class="board_detail">
            <textarea  id="projIntro" name="projIntro">${funding.projIntro}</textarea>
        </div>
    </div>
    </div>
    <div class="proj-content">
      <span class="question" id="que-2"><span id="que-2-toggle">+</span><span>예산 정보</span></span>
      <div class="answer" id="ans-2">
        <div class="board_detail">
            <textarea  id="projBudget" name="projBudget">${funding.projBudget}</textarea>
        </div>
      </div>
    </div>
    <div class="proj-content">
      <span class="question" id="que-3"><span id="que-3-toggle">+</span><span>작가 본인 소개</span></span>
      <div class="answer" id="ans-3">
        <div class="board_detail">
            <textarea  id="projArtist" name="projArtist">${funding.projArtist}</textarea>
        </div>
      </div>
    </div>
</article>
</div>
    <div class="a">
        <button class="Btn" type="submit">확인</button>
        <button class="Btn" type="button">취소</button>
    </div>
    </form>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<script>
	function search3(){
		new daum.Postcode({
	        oncomplete: function(data) {
	        	$('#getplace').val(data.address);
	        	$('#getplace').prop("readonly",true);
	        	
	            console.log(data.getplace);
	            
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
   
    
    </script>    
</body>
</html>