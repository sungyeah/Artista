<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/content.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/global.css">
    
    
</head>
<style>
    /* 네비바 */
    #header2{
    --vh: 980px;
    -webkit-text-size-adjust: 100%;
    font-weight: bold;
    font-family: 'AvenirLTStd', 'Noto Sans KR', sans-serif;
    font-size: 1em;
    position: fixed;
    top: 0;
    left: 0;
    z-index: 200;
    width: 100%;
    background-color: #fff;
    transition: top 0.5s;
    }
    header {
    display: block;
}
.menu1{
    display:inline-block;
    margin-right: 300px;

}
.menu2{
    display:inline-block;
    
}

</style>
<body>
<div id="wrap2">
    <header id="header2">
        <div class="inner">
            <a href="main"><img src="${pageContext.request.contextPath}/images/로고.png" style="height: 150px; width: auto;"></a>
<nav id="gnb">
<ul class="menu1">
    <li class="navi"><a href="${pageContext.request.contextPath}/exhibitionview">Exhibition </a></li>
    <li class="navi"><a href="${pageContext.request.contextPath}/artistslist">Artists</a></li>
    <li class="navi"><a href="${pageContext.request.contextPath}/storelist">Store</a></li>
    <li class="navi"><a href="">Funding</a></li>
 </ul>

<c:choose>
<c:when test="${empty id}">
 <ul class="menu2">
    <img src="${pageContext.request.contextPath}/images/장바구니.png" style="height: 30px; width: auto; position: absolute; top: 48px; right: 300px;">
    <li class="navi2"><a href="login">Login</a></li>
    <li class="navi2"><a href="join">SignUp</a></li>
</ul>
</c:when>

<c:when test="${membertype eq 'manager'}">
 <ul class="menu2">
    <li class="navi2"><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
    <li class="navi2"><a href="${pageContext.request.contextPath}/manager">mypage</a></li>
    
</ul>
</c:when>
<c:otherwise>
 <ul class="menu2">
     <img src="${pageContext.request.contextPath}/images/장바구니.png" style="height: 30px; width: auto; position: absolute; top: 48px; right: 300px;">
    <li class="navi2"><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
    <li class="navi2"><a href="${pageContext.request.contextPath}/mypage">mypage</a></li>
</ul>
</c:otherwise>
</c:choose>
</nav>
        </div>
    </header>

    
</div>
<script>
var uid = '<%=(String)session.getAttribute("membertype")%>';
	console.log(uid)

</script>
</body>
</html>