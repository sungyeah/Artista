<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script type="text/javascript" src="js/main.js"></script>
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
                lalalal
            </div>
        </div>
        <div class="account-modify-form-row">
            <div class="account-modify-form-row-label">
                이름
            </div>
            <div class="account-modify-form-row-value">
                <div class="certification-value">
                    <span class="certified_name">아앙아아</span>
                </div>
            </div>
        </div>
        <div class="account-modify-form-row">
            <div class="account-modify-form-row-label">
                이메일
            </div>
            <div class="account-modify-form-row-value">
                test01@naver.com
        </div>
        </div>
        <div class="account-modify-form-row">
            <div class="account-modify-form-row-label">
                목표 금액
            </div>
            <div class="account-modify-form-row-value">
                    <input class="account-modify-form-input" type="text" name="money" maxlength="20"><br>
            </div>
        </div>
        <div class="account-modify-form-row">
            <div class="account-modify-form-row-label">
                모금 일정 
            </div>
            <div class="account-modify-form-row-value">
                    <input class="account-modify-form-input" type="text" name="fundingdate" />
            </div>
        </div>
        <div class="account-modify-form-row">
            <div class="account-modify-form-row-label">
                전시 일정
            </div>
            <div class="account-modify-form-row-value">
					<input class="account-modify-form-input" type="text" name="exhibitiondate" />
            </div>
        </div>
    <div class="account-modify-form-border"></div>
    <div class="faq-content">
      <button class="question" id="que-1"><span id="que-1-toggle">+</span><span>프로젝트 소개</span></button>
      <div class="answer" id="ans-1">
          <input type="hidden"name="user_img" id="user_img" value=''>
        <div class="writing_title">
            <input type="text" id="title" name="fb_title"
                placeholder="제목을 입력해 주세요." onfocus="this.placeholder=''"
                onblur="this.placeholder='제목을 입력해 주세요.'"
                style="width: 99%; height: 30px; margin: 15px 0 15px 0;" />
        </div>
        <div class="board_detail">
            <textarea  id="editor1" name="fb_content1"></textarea>
        </div>
    </div>
    </div>
    <div class="faq-content">
      <button class="question" id="que-2"><span id="que-2-toggle">+</span><span>예산 정보</span></button>
      <div class="answer" id="ans-2">
        <div class="board_detail">
            <textarea  id="editor2" name="fb_content2"></textarea>
        </div>
      </div>
    </div>
    <div class="faq-content">
      <button class="question" id="que-3"><span id="que-3-toggle">+</span><span>작가 본인 소개</span></button>
      <div class="answer" id="ans-3">
        <div class="board_detail">
            <textarea  id="editor3" name="fb_content3"></textarea>
        </div>
      </div>
    </div>
</article>
</div>
    <div class="a">
        <button class="Btn">확인</button>
        <button class="Btn">취소</button>
    </div>

    <input type="text" id="testDatepicker" placeholder="날짜를 선택해 주세요">
    
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
        	.create(document.querySelector("#editor1"), {
        		ckfinder : {
        			uploadUrl : "/upload"
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
        	.create(document.querySelector("#editor2"), {
        		ckfinder : {
        			uploadUrl : "/upload"
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
        	.create(document.querySelector("#editor3"), {
        		ckfinder : {
        			uploadUrl : "/upload"
        		}
        	}).then(editor3=> {
        		window.editor3=editor3;
        	})
        	.catch((error) => {
        		console.error(error);
        	});
	});
    
    $(function() {
      $('input[name="fundingdate"]').daterangepicker({
        timePicker: true,
        startDate: moment().startOf('hour'),
        endDate: moment().startOf('hour').add(32, 'hour'),
        locale: {
          format: 'YY-M-DD hh a'
        }
      });
    });
    
    $(function() {
        $('input[name="exhibitiondate"]').daterangepicker({
          timePicker: true,
          startDate: moment().startOf('hour'),
          endDate: moment().startOf('hour').add(32, 'hour'),
          locale: {
            format: 'YY-M-DD hh a'
          }
        });
      });
    
    </script>    
</body>
</html>