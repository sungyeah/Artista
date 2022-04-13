<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Artista</title>
<link rel="stylesheet" href="../css/manager.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<%@include file ="../header.jsp" %>
    <div class="contents">
        <header class="manager-header">
            <h2 class="manager-header-title">관리자 페이지</h2>
        </header>
        <section class="manager-guide">
            <div class="manager-guide-inner">
                <h3 class="manager-guide-name">
                    관리자님 반갑습니다.
                </h3>
            </div>
        </section>
        <nav class="manager-nav">
            <a class="manager-nav-btn current"  href="${pageContext.request.contextPath}/manager/paymentlist">
                작품 관리
            </a>
            <a class="manager-nav-btn" href="${pageContext.request.contextPath}/manager/fundinglist">
                펀딩 관리
            </a>
            <a class="manager-nav-btn" href="${pageContext.request.contextPath}/manager/exhibitionlist">
                전시 관리
            </a>
            <a class="manager-nav-btn" href="${pageContext.request.contextPath}/manager/memberlist" style="background-color:#222;color:white;">
                회원 관리
            </a>
        </nav>

        <nav class="member-nav">
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/manager/memberlist">
                <b>일반회원</b>
            </a>
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/manager/artistlist">
                아티스트
            </a>
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/manager/artistapplylist">
                아티스트 신청
            </a>
        </nav>
        
        <article class="member-body">
            <section class="member-list">
            	<table class="member-table">
                    <thead>
                    <tr>
                        <th scope="col">회원 아이디</th>
                        <th scope="col">회원 이름</th>
                        <th scope="col">이메일</th>
                        <th scope="col">연락처</th>
                        <th scope="col">주소</th>
                        <th scope="col">회원 유형</th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <c:choose>
                    	<c:when test="${memberlist!=null && pageInfo.listCount>0 }">
                    	<tbody>
                    		<c:forEach items="${memberlist }" var="member">
								<tr>
                            	<th scope="col" class="id">${member.id }</th>
                            	<th scope="col" class="name">${member.name }</th>
                            	<th scope="col" class="email">${member.email }</th>
                            	<th scope="col" class="contact">${member.contact }</th>       
                            	<th scope="col" class="address">${member.address } ${member.address2 }</th>    
                            	<th scope="col" class="address">${member.memberType }</th>                            
                           		<th scope="col"><input type="checkbox" name="xxx"></th>
                        		</tr>
                        		</c:forEach>
                        </tbody>
                    	</c:when>
                    </c:choose>
                </table>
                <a class="member-delete-btn" href="/account/delete/">
                    회원 탈퇴
                </a>
            </section>
        </article>
        
    </div>
    
    <%@include file ="../footer.jsp" %>
</body>
</html>