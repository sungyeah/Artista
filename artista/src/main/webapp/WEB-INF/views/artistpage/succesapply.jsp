<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    .Btn2{
        width: 206px;
        height: 45px;
        display: block;
        background-color: black;
        color: white;
        border: 0;
        font-size: 1.3em;
    }
    .align1{
        display: flex;
        justify-content: center;
        margin-top: 300px;
        font-size: 25px;
    }
    .align2{
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }
</style>
</head>
<body>
	<%@include file ="../header.jsp" %>
    <div class="align1">신청이 완료되었습니다.</div>
    <div class="align2"><button class="Btn2">메인으로 가기</button></div>
    <%@include file ="../footer.jsp" %>
</body>
</html>