<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/login.css">
<style>
   
</style>
</head>
<body>
    <section style="min-height: 700px; padding-top: 80px;">
        <form>
            <div style="width: 100%;max-width: 1500px;margin: 0 auto;padding: 0px 20px;">
                <div style="max-width: 800px;margin: 70px auto 0;width: 100%;box-shadow: 0 0 30px 0px rgb(0 0 0 / 7%);">
                    <div style="display: flex;">
                        <div class="signupLeft" style="width: 55%;background: url(images/login.jpg) no-repeat center center;background-size: cover;text-align: center;">

                        </div>
                        <div class="signup" style="width: 45%;max-width: 380px;margin: 0 auto;padding: 30px 10px;">
                            <h3 style="font-size: 24px;text-align: center;margin-bottom: 10px;">Log In</h3>
                            <div class="formbox" style="width: 93%;margin: 0 auto;display: flex; flex-direction: column;">
                                <input type="text" style="border: solid 1px #ddd;padding: 5px; font-size: 13px;line-height: 20px;margin-bottom: 10px;" placeholder="Id">
                                <input type="password" style="border: solid 1px #ddd;padding: 5px; font-size: 13px;line-height: 20px;margin-bottom: 10px;" placeholder="Password">
                                <div style="background: #222222; color: #fff;font-weight: bold;padding: 10px;margin: 10px 0px 20px;text-align: center;cursor: pointer; user-select: none;">
                                    Log In
                                </div>
                            </div>
                            <span style="display: block;text-align: center;font-size: 13px;">OR</span>
                            <div class="snsLogin" style="width: 80%;margin: 10px auto 20px;display: flex;max-width: 300px;justify-content: center;align-items: center;flex-direction: row;">
                                <a href="#" style="background: url(images/f.png) no-repeat center center #4d72b9;background-size: 24px;" >Continue with Facebook</a>
                                <a href="#" style="background: url(images/g.png) no-repeat center center #4d72b9;background-size: 20px;" >Continue with Google</a>
                            </div>
                            <div class="toLogin">
                                <span style="display: block;text-align: center;font-size: 13px;">Have no account?<a href="join.html">Sign Up</a></span><br>
                                <span><a href="#">Forgot password</a></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </section>
</body>
</html>