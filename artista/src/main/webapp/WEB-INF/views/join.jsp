<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/join.css">
<style>

</style>
</head>
<body>
    <section style="min-height: 700px;padding-top: 80px;">
		<form id="signupForm">
		<input type="hidden" value="">
		<div style="width: 100%;max-width: 1500px;margin: 0 auto;padding: 0px 20px;">
            <div class="lgBox">
                <div class="signupWrap" style="display: flex;">
                    <div class="signupLeft">
                        <h3></h3>
                    </div>
                    <div class="signup">
                        <h3>Sign Up</h3>
                        <div class="formBox">
                            <div style="position:relative;">
                            	<input type="text" class="borderform" style="width:95%;" placeholder="Id">
                            	<div style="position:absolute;top:0;right:0;height:22px;width:22px;padding:5px;background:#5085d3;background-image:url('images/w.png');background-repeat:no-repeat;background-position:center center;color:white;cursor:pointer;user-select:none;">
                            	</div>
                            </div>
                            <input type="password" class="borderform" placeholder="Password" required="" reqmsg="비밀번호">
                            <input type="password" class="borderform" placeholder="Confirm password">
                            <input type="text" class="borderform" placeholder="Your name (shown to the public)" required="" reqmsg="이름(닉네임)">
                            <div class="btn_signup">Register</div>
                        </div>
                        <span>OR</span>
                        <div class="snsLogin" title="준비중입니다...">
                            <a href="#" class="sns01" style="background: url(images/f.png) no-repeat center center #4d72b9;background-size: 24px;">Continue with Facebook</a>
                            <a href="#" class="sns02" style="background: url(images/g.png) no-repeat center center #4d72b9;background-size: 24px;">Continue with Google</a>
                        </div>
                        <div class="toLogin">
                            <span>Have an account? <a href="login.html">Login</a></span>
                        </div>
                    </div>
                </div>
                
            </div>
		</div>
		</form>
	</section>
</body>
</html>