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
                <input class="account-modify-form-input" type="text" id="id" name="id" />
            </div>
        </div>
        <div class="account-modify-form-row">
            <div class="account-modify-form-row-label">
                이름
            </div>
            <div class="account-modify-form-row-value">
                <div class="certification-value">
                	<input class="account-modify-form-input" type="text" id="name" name="name" />
                </div>
            </div>
        </div>
        <div class="account-modify-form-row">
            <div class="account-modify-form-row-label">
                이메일
            </div>
            <div class="account-modify-form-row-value">
                <input class="account-modify-form-input" type="text" id="email" name="email" />
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
                장소 대관
            </div>
          	<input type="hidden" id="sample6_postcode" placeholder="우편번호">
			<input type="text" id="sample6_address" class="account-modify-form-input-address1" placeholder="주소">
			<input type="text" id="sample6_detailAddress" class="account-modify-form-input-address2" placeholder="상세주소">
			<button class="Btn" onclick="sample6_execDaumPostcode()">검색</button>
			<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
        </div>
    <div class="account-modify-form-border"></div>
    <div class="faq-content">
      <button class="question" id="que-1"><span id="que-1-toggle">+</span><span>프로젝트 소개</span></button>
      <div class="answer" id="ans-1">
          <input type="hidden"name="user_img" id="user_img" value=''>
        <div class="writing_title">
            <input type="text" id="title" name="title"
                placeholder="제목을 입력해 주세요." onfocus="this.placeholder=''"
                onblur="this.placeholder='제목을 입력해 주세요.'"
                style="width: 99%; height: 30px; margin: 15px 0 15px 0;" />
        </div>
        <div class="board_detail">
            <textarea  id="editor1" name="content1"></textarea>
        </div>
    </div>
    </div>
    <div class="faq-content">
      <button class="question" id="que-2"><span id="que-2-toggle">+</span><span>예산 정보</span></button>
      <div class="answer" id="ans-2">
        <div class="board_detail">
            <textarea  id="editor2" name="content2"></textarea>
        </div>
      </div>
    </div>
    <div class="faq-content">
      <button class="question" id="que-3"><span id="que-3-toggle">+</span><span>작가 본인 소개</span></button>
      <div class="answer" id="ans-3">
        <div class="board_detail">
            <textarea  id="editor3" name="content3"></textarea>
        </div>
      </div>
    </div>
</article>
</div>
    <div class="a">
        <button class="Btn" type="button">확인</button>
        <button class="Btn" type="button">취소</button>
    </div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
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
          format: 'YY-MM-DD hh a'
        }
      });
    });
    
    $(function() {
        $('input[name="exhibitiondate"]').daterangepicker({
          timePicker: true,
          startDate: moment().startOf('hour'),
          endDate: moment().startOf('hour').add(32, 'hour'),
          locale: {
            format: 'YY-MM-DD hh a'
          }
        });
      });
    
    </script>    
</body>
</html>