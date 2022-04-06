<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="container">
		<!-- Content -->
		<article id="content">
			<div class="entry-content">
				<figure class="full" style="text-align: center;">
					<img src="/artistpage/workImg/${work.workImg }" style="width: 1300px; height: 700px;">
				</figure>
				<div class="hgroup">
					<h1>${work.artistName} : ${work.workName}</h1>
					<p>${work.workType}</p>
					<p>${work.workTech}</p>
					<p>${work.workSize}</p>
				</div>

				<blockquote>
					<p>${work.workIntro}</p>
				</blockquote>
			</div>
			</article>
	</div>
</body>
</html>