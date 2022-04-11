<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" async="" src=""></script>
    <link rel="stylesheet" type="text/css" href="css/content.css">
    <link rel="stylesheet" type="text/css" href="css/global.css">
    <link rel="stylesheet" href="https://og-data.s3.amazonaws.com/CACHE/css/output.4e774f3b4c87.css" type="text/css">
    <link rel="stylesheet" href="https://og-data.s3.amazonaws.com/CACHE/css/output.75d1aa7676f8.css" type="text/css">
    <script src="https://og-data.s3.amazonaws.com/static/common/js/jquery-1.12.4.min.js"></script>
    <script src="https://og-data.s3.amazonaws.com/CACHE/js/output.bd018f02f86b.js"></script>
    <script src="https://og-data.s3.amazonaws.com/CACHE/js/output.85320f581d39.js"></script>
</head>
<body>

네이버로 로그인합니다.

<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>  -->
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <script>
    /* console.log(${check}); */
    var uid = '<%=(String)session.getAttribute("id")%>';
		console.log(uid) ;
		
 	
 		var naver_id_login = new naver_id_login("2R257h5lNLRrx1vJnLgV", "http://localhost:8090/callback");
 		 // 접근 토큰 값 출력 
 		 	/* alert(naver_id_login.oauthParams.access_token);  */
 		 // 네이버 사용자 프로필 조회 
 		 	naver_id_login.get_naver_userprofile("naverSignInCallback()"); 
 		 // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
 		 function naverSignInCallback() { 
 			 	let email = naver_id_login.getProfileData('email');
 			 	let id = naver_id_login.getProfileData('id');
 			 	let name = naver_id_login.getProfileData('name');
 			 	$.ajax({     
 					type:"post",
 					dataType:"text",
 					async:false,
 					url:"http://localhost:8090/naverlogin",
 					data:{"id":id,
 						  "name":name,
 						  "email":email},
 					success: function(data, textStatus){
 						console.log("success");
 						window.location.href="/"
 					},
 					error:function(data, textStatus){
 						alert("실패");
 						window.location.href="/login"
 					},
 					complete:function() {
 					}
 				});
 			 }

 </script>  
</body>
</html>