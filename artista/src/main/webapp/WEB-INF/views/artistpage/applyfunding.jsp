<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script type="text/javascript" src="js/main.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script	src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<title>Insert title here</title>
</head>
<style>
    .answer {
      display: none;
      padding-bottom: 30px;
    }
    #faq-title {
      font-size: 25px;
    }
    .faq-content {
      border-bottom: 1px solid #e0e0e0;
    }
    .question {
      font-size: 19px;
      padding: 30px 0;
      cursor: pointer;
      border: none;
      outline: none;
      background: none;
      width: 100%;
      text-align: left;
    }
    [id$="-toggle"] {
      margin-right: 15px;
    }
    html{overflow:scorll;}
    h1, h2, a, form, table, caption, thead, tbody, tr, th, td, submit {
        margin:0; outline:0; border:0; padding:0; font-size:100%; vertical-align:baseline; background:transparent;
    }
    h1, h2, h3 {font-size: 1.5em;}
    p{margin:0; padding:0;}
    input{vertical-align:middle;}
    input:focus {outline:0;}
    caption {display:none; width:0; height:0; margin-top:-1px; overflow:hidden; visibility:hidden; font-size:0; line-height:0;}

    .board_detail {width:100%; border-top:2px solid #252525; border-bottom:1px solid #ccc; border-collapse:collapse;}
    .board_detail tbody input {width:100%;}
    .board_detail tbody th {text-align:left; background:#f7f7f7; color:#3b3a3a; vertical-align:middle; text-align: center;}
    .board_detail tbody th, .board_detail tbody td {padding:10px 15px; border-bottom:1px solid #ccc;}
    .board_detail tbody textarea {width:100%; min-height:500px}

    .btn2 {margin:5px; padding:5px 11px; color:#fff !important; display:inline-block; background-color:#7D7F82; vertical-align:middle; border-radius:0 !important; cursor:pointer; border:none;}
    .btn2:hover {background: #6b9ab8; }
    a { text-decoration-line: none;}
        
    .ck.ck-reset.ck-editor.ck-rounded-corners {
                width: 100%;
            }

    .ck-editor__editable {
        min-height: 700px;
    }
    .Btn{
        width: 80px;
        height: 45px;
        background-color: black;
        color: white;
        border: 0;
        font-size: 20px;
        margin-left: 20px;
        margin-right: 20px;
    }

    .a{
        display: flex;
        justify-content: center;
        margin-top: 30px;
    }
    .account-modify-form-border {
        border-top: 1px solid #222222;
    }
    .account-modify-form-row {
        display: -ms-flexbox;
        display: flex;
        padding: 7px 10px;
        border-bottom: 1px solid #eeeeee;
        line-height: 2.25;
    }   
    .account-modify-form-row-label {
        width: 20%;
        font-weight: bold;
    }
    .account-modify-form-row-value {
        width: 80%;
        font-size: 14px;
    }
    #contents {
    padding-top: 60px;
    }
    #contents {
        width: 100%;
        margin: 0 auto;
        background-color: #fff;
        padding-bottom: 46px;
    }
    #contents:before {
        content: '.';
        display: block;
        overflow: hidden;
        visibility: hidden;
        font-size: 0;
        line-height: 0;
        width: 0;
        height: 0;
    }
    .account-header {
        width: 96%;
        max-width: 1152px;
        margin: 78px auto 50px;
        line-height: 1.5;
    }
    .account-header-title {
        margin-bottom: 10px;
        font-size: 36px;
        font-weight: bold;
    }
    .account-header-description {
        font-size: 18px;
        color: #989898;
    }
    .account-body {
        width: 96%;
        max-width: 1152px;
        margin: 36px auto 0;
    }
    .account-modify-form-input {
        box-sizing: border-box;
        -webkit-box-sizing: border-box;
        height: 36px;
        padding: 0 0 0 6px;
        border: 1px solid #dfdfdf;
        outline: 0;
        font-size: 14px;
    }
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
                    <input class="account-modify-form-input" type="text" name="Sfundingdate" maxlength="20" id="testDatepicker1" placeholder="날짜를 선택해 주세요"> -
                    <input class="account-modify-form-input" type="text" name="Efundingdate" maxlength="20" id="testDatepicker2" placeholder="날짜를 선택해 주세요">
            </div>
        </div>
        <div class="account-modify-form-row">
            <div class="account-modify-form-row-label">
                전시 일정
            </div>
            <div class="account-modify-form-row-value">
                <input class="account-modify-form-input" type="text" name="Sexhibitiondate" maxlength="20" id="testDatepicker3" placeholder="날짜를 선택해 주세요"> -
                <input class="account-modify-form-input" type="text" name="Eexhibitiondate" maxlength="20" id="testDatepicker4" placeholder="날짜를 선택해 주세요">
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
    $(function(){
        $("#testDatepicker1").datepicker({
        });
    });
    $(function(){
        $("#testDatepicker2").datepicker({
        });
    });
    $(function(){
        $("#testDatepicker3").datepicker({
        });
    });
    $(function(){
        $("#testDatepicker4").datepicker({
        });
    });
    
    </script>    
</body>
</html>