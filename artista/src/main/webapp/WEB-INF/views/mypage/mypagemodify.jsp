<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/mypageupdate.css">
<style>
   

</style>
</head>
<body>
<%-- <%@include file ="../header.jsp" %> --%>
    <div id="contents">
        
        <header class="account-header">
            <h2 class="account-header-title">회원 정보</h2>
            <div class="account-header-description">고객님과 관련된 정보입니다.</div>
        </header>
        <article class="account-body">
            <form class="account-modify-form" method="post">
                <input type="hidden" name="csrfmiddlewaretoken" value="dcplUxcJYAooMhenqOslHXteUyEiaCKfCaBaxao4yzsOS1mxKp697vPpt2Yzn2yl">
                <div class="account-modify-form-border"></div>
                <div class="account-modify-form-row">
                    <div class="account-modify-form-row-label">
                        <span class="white">*</span> 아이디
                    </div>
                    <div class="account-modify-form-row-value">
                        ${mem.id }
                    </div>
                </div>
                <div class="account-modify-form-row">
                    <div class="account-modify-form-row-label">
                        <span class="white">*</span> 이메일
                    </div>
                     <div class="account-modify-form-row-value">
                         ${mem.email } 
                    </div> 
                   <!--  <input class="account-modify-form-input" type="email" name="email" placeholder="이메일" maxlength="20" autocomplete="off" autocorrect="off" autocapitalize="off"><br> -->
                </div>
                <div class="account-modify-form-row">
                    <div class="account-modify-form-row-label">
                        <span class="red">*</span> 비밀번호
                    </div>
                    <div class="account-modify-form-row-value">
                        
                            <input class="account-modify-form-input" type="password" name="password" id="password" placeholder="기존 비밀번호" maxlength="20" autocomplete="off" autocorrect="off" autocapitalize="off"><br>
                            <input class="account-modify-form-input" type="password" name="new_password1" id="password1" placeholder="새 비밀번호" maxlength="20" autocomplete="off" autocorrect="off" autocapitalize="off"><br>
                            <input class="account-modify-form-input" type="password" name="new_password2" id="password2" placeholder="새 비밀번호 확인" maxlength="20" autocomplete="off" autocorrect="off" autocapitalize="off">
                            <input class="change-password-btn" type="button" id="update" value="변경" data-mode="change">
                        
                    </div>
                </div>
                <div class="certification-container  certified">
                    <div class="account-modify-form-row">
                        <div class="account-modify-form-row-label">
                            <span class="white">*</span> 이름
                        </div>
                        <div class="account-modify-form-row-value">
                            <div class="certification-value">
                                <span class="certified_name">${mem.name }</span>
                            </div>
                        </div>
                    </div>
                    <div class="account-modify-form-row">
                        <div class="account-modify-form-row-label">
                            <span class="red">*</span> 휴대폰
                        </div>
                        <div class="account-modify-form-row-value">
                            <div class="certification-value">
                                <input class="account-modify-form-input" type="text" name="phone" placeholder="휴대폰" maxlength="20" autocomplete="off" autocorrect="off" autocapitalize="off"><br>
                                <!-- <input class="recertify-btn" type="button" value="변경"> -->
                            </div>
                        </div>
                    </div>
                    <div class="account-modify-form-row">
                        <div class="account-modify-form-row-label">
                            <span class="red">*</span> 주소
                        </div>
                        <div class="account-modify-form-row-value">
                            
                                <input class="account-modify-form-input" type="password" name="password" placeholder="주소" maxlength="20" autocomplete="off" autocorrect="off" autocapitalize="off">
                                <input class="change-password-btn" type="button" value="검색" data-mode="change"><br>
                                <input class="account-modify-form-input" type="password" name="new_password1" placeholder="상세주소" maxlength="20" autocomplete="off" autocorrect="off" autocapitalize="off" style="width: 284px;"><br>
                            
                        </div>
                    </div>
                    
                </div>
                <div class="account-modify-form-border"></div>
                <!-- <a class="account-delete-btn" href="/account/delete/">
                    회원 탈퇴
                </a> -->
                <!-- <input class="account-modify-form-submit-btn" type="submit" value="저장" onclick="gaClickAccount('account_modify_completed');"> -->
                <input class="account-modify-form-submit-btn" type="button" value="저장" onClick="location.href='/mypage'">
            </form>
        </article>
    </div>
<%-- <%@include file ="../footer.jsp" %> --%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	
	$('#update').click(function(){
		let password1 = $('#password1').val();
		let password2 = $('#password2').val();
		if(password1==password2){
			$.ajax({     
				type:"post",
				dataType:"text",
				async:false,
				url:"http://localhost:8090/mypage/pwcheck",
				data:{"password":$('#password').val(),
					  "password2":$('#password2').val()},
				success: function(data, textStatus){
					if(data=='true'){
						alert("비밀번호가 변경되었습니다.");
						$('#password').val("");
						$('#password1').val("");
						$('#password2').val("");
					}else{
						alert("기존 비밀번호가 일치하지 않습니다.");
					}
				},
				error:function(data, textStatus){
					alert("실패");
				}
			});
		}else{
			alert("비밀번호 확인이 일치하지 않습니다.");
			return false;
		}
	});
</script>
</body>
</html>