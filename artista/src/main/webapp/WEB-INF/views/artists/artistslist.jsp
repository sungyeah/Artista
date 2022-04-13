<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<style>
/* 여기부터 아티스트 목록 */
.artist-list {
    position: relative;
    max-width: 1200px;
    min-height: 580px;
    margin: 0 auto 144px;
    padding: 0 15px;
}
.artist-list ul {
    overflow: hidden;
    width: 47.333333333333333%;
    column-count: 2;
}
</style>
<body>
<%@include file ="../header.jsp" %>
            <div id="container" style="padding-top: 100px;">
			
        <!-- Content -->
        <article id="content" class="vuelayer">
            <div class="artist-list">
                <ul>                   
                    <c:forEach items="${atistList }" var="artist" varStatus="status">
                    	<li><a class="list" href="artistdetail/${artist.artistNo }" data-image="../../imgupload/artistWorlds/${ImgNames[status.index] } ">${artist.artistName } </a></li>
                    </c:forEach>
                </ul>
            </div>
        </article>
        
    
</div>
<%@include file ="../footer.jsp" %>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
    $('.list').mouseenter(function(e){
    	let imagePath = e.currentTarget.dataset.image;
        var html="<figure class='landscape'><div class='portrait'><img src='/mypage/artistprofile/" + imagePath + "'></div></figure>"
        $('.artist-list').append(html);
    });
    $('.list').mouseleave(function(){
         $('.landscape').remove(); 
    });
</script>
</body>
</html>