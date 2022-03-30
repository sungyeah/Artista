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
		<form id="signupForm" action="join" method="post">
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
                            	<input type="text" class="borderform" style="width:95%;" placeholder="Id" id="id" name="id">
                            	<div id="memidoverlap" style="position:absolute;top:0;right:0;height:22px;width:22px;padding:5px;background:#5085d3;background-image:url('images/w.png');background-repeat:no-repeat;background-position:center center;color:white;cursor:pointer;user-select:none;">
                            	</div>
                            </div>
                            <input type="password" class="borderform" placeholder="Password" id="password" name="password" >
                            <input type="password" class="borderform" placeholder="Confirm password" id="password2" name="password2">
                            <input type="text" class="borderform" placeholder="Your name (shown to the public)" id="name" name="name">
                            <button id="submit" class="btn_signup" style="border: none;">Register</button>
                        </div>
                        <span>OR</span>
                        <div class="snsLogin" title="준비중입니다...">
                            <a href="#" class="sns01" style="background: url(images/f.png) no-repeat center center #4d72b9;background-size: 24px;">Continue with Facebook</a>
                            <a href="#" class="sns02" style="background: url(images/g.png) no-repeat center center #4d72b9;background-size: 24px;">Continue with Google</a>
                        </div>
                        <div class="toLogin">
                            <span>Have an account? <a href="login">Login</a></span>
                        </div>
                    </div>
                </div>
                
            </div>
		</div>
		</form>
	</section>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$('#signupForm').submit(function(){
		
		let password=$('#password').val();
		if(password==''){
			alert("비밀번호를 입력하세요.");
			$('#password').focus();
			return false;
		}
		let password2=$('#password2').val();
		if(password!=password2){
			alert("비밀번호 확인이 일치하지 않습니다.");
			$('#password2').focus();
			return false;
		}
		let name=$('#name').val();
		if(name==''){
			alert("이름을 입력하세요.");
			$('#name').focus();
			return false;
		}
	});
	
	$('#memidoverlap').click(function(){
		let id=$('#id').val();
		if(id==''){
			alert("아이디를 입력하세요.");
			$('#id').focus();
			$('#submit').attr("disabled", true);
			return false;
		}
		$.ajax({
			type:"post",
			dataType:"text", 
			async:false, 
			url:"http://localhost:8090/memidoverlap",
			data:{id:$('#id').val()},
			success: function(data, textStatus){
				if(data=="true"){
					alert("사용 불가능합니다.");
					$('#submit').attr("disabled", true);
				} else {
					alert("사용 가능합니다.");
					$('#submit').attr("disabled", false);
				}
			}
		});
	})
	
</script>
</body>
</html>