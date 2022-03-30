<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>
	.postbtn{
	padding-left: 5px;
	padding-right: 5px;
	}
    .postbtn a{
        text-decoration-line: none;
        color: black;
    }
    .flex-container{
        display: flex;
        justify-content: center;
        height: 125px;
        text-align: justify;
        -ms-text-justify: distribute-all-lines;
        text-justify: distribute-all-lines;
        min-width: 612px;
        margin-bottom: 160px;
    }
    .flex-item{
        margin: 10px;
        background-color: white;
        width: 150px;
        height: 125px;
        vertical-align: top;
        display: inline-block;
        *display: inline;
        zoom: 2;
    }
    .image-box{
        width: 150px;
        height: 80px;
        overflow: hidden;
        margin: 0 auto;
    }

    .image-thumb{
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
    .printer{
        font-size: 0.1em;
    }
    .Btn{
        width: 206px;
        height: 52px;
        margin: auto;
        display: block;
        background-color: black;
        color: white;
        border: 0;
        font-size: 1.7em;
        margin-top: 180px;
    }
</style>
<body>
	<div>
            <span class="postbtn"><a href="fundinguc">펀딩 예정</a></span>
            <span class="postbtn"><a href="fundingov">펀딩 진행</a></span>
            <span class="postbtn"><a href="fundingtm"><b>펀딩 종료</b></a></span>
	</div>
    <div class="flex-container">
        <div class="flex-item">
            <div class="image-box">
                <img class="image-thumb">
            </div>
            <span class="printer">작가</span><br>
            <span class="projname">프로젝트 이름</span>
        </div>
        <div class="flex-item">
            <div class="image-box">
                <img class="image-thumb">
            </div>
            <span class="printer">작가</span><br>
            <span class="projname">프로젝트 이름</span>
        </div>
        <div class="flex-item">
            <div class="image-box">
                <img class="image-thumb">
            </div>
            <span class="printer">작가</span><br>
            <span class="projname">프로젝트 이름</span>
        </div>
        <div class="flex-item">
            <div class="image-box">
                <img class="image-thumb">
            </div>
            <span class="printer">작가</span><br>
            <span class="projname">프로젝트 이름</span>
        </div>
    </div>

    <div class="flex-container">
        <div class="flex-item">
            <div class="image-box">
                <img class="image-thumb">
            </div>
            <span class="printer">작가</span><br>
            <span class="projname">프로젝트 이름</span>
        </div>
        <div class="flex-item">
            <div class="image-box">
                <img class="image-thumb">
            </div>
            <span class="printer">작가</span><br>
            <span class="projname">프로젝트 이름</span>
        </div>
        <div class="flex-item">
            <div class="image-box">
                <img class="image-thumb">
            </div>
            <span class="printer">작가</span><br>
            <span class="projname">프로젝트 이름</span>
        </div>
        <div class="flex-item">
            <div class="image-box">
                <img class="image-thumb">
            </div>
            <span class="printer">작가</span><br>
            <span class="projname">프로젝트 이름</span>
        </div>
    </div>

    <div class="flex-container">
        <div class="flex-item">
            <div class="image-box">
                <img class="image-thumb">
            </div>
            <span class="printer">작가</span><br>
            <span class="projname">프로젝트 이름</span>
        </div>
        <div class="flex-item">
            <div class="image-box">
                <img class="image-thumb">
            </div>
            <span class="printer">작가</span><br>
            <span class="projname">프로젝트 이름</span>
        </div>
        <div class="flex-item">
            <div class="image-box">
                <img class="image-thumb">
            </div>
            <span class="printer">작가</span><br>
            <span class="projname">프로젝트 이름</span>
        </div>
        <div class="flex-item">
            <div class="image-box">
                <img class="image-thumb">
            </div>
            <span class="printer">작가</span><br>
            <span class="projname">프로젝트 이름</span>
        </div>
    </div>
    <div class="flex-container">
        <div class="flex-item">
            <div class="image-box">
                <img class="image-thumb">
            </div>
            <span class="printer">작가</span><br>
            <span class="projname">프로젝트 이름</span>
        </div>
        <div class="flex-item">
            <div class="image-box">
                <img class="image-thumb">
            </div>
            <span class="printer">작가</span><br>
            <span class="projname">프로젝트 이름</span>
        </div>
        <div class="flex-item">
            <div class="image-box">
                <img class="image-thumb">
            </div>
            <span class="printer">작가</span><br>
            <span class="projname">프로젝트 이름</span>
        </div>
        <div class="flex-item">
            <div class="image-box">
                <img class="image-thumb">
            </div>
            <span class="printer">작가</span><br>
            <span class="projname">프로젝트 이름</span>
        </div>
    </div>
    <button class="Btn">load more</button>
</body>
</html>