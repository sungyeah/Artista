<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Artista</title>
<link rel="stylesheet" href="../css/manager.css">
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
            <a class="manager-nav-btn" href="${pageContext.request.contextPath}/manager/memberlist">
                회원 관리
            </a>
        </nav>

        <nav class="member-nav">
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/manager/fundingapplylist">
                펀딩 신청 목록
            </a>
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/manager/fundingupcoming">
                펀딩 예정
            </a>
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/manager/fundingproceeding">
                진행중인 펀딩
            </a>
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/manager/fundingended">
                종료된 펀딩
            </a>
        </nav>
        <div class="mypage-project bg">
            <div class="project-list">
                <div id="projectCardList" class="card-list pt50">
                    <ul>
                        <li class="reward">
                            <div class="visibility-control">
                                <button type="button" class="btn-more"><i class="wadizicon wa-more-vert"></i></button>
                                <button type="button" class="btn-control" onclick="deletePrjt(143877)">삭제</button>
                            </div>
                            <div class="project-card-wrap">
                                <div class="project-card">
                                    <div class="card-img-section">
                                        <em class="project-img">
                                            <div class="default">
                                                <p>대표이미지 등록 필요</p>
                                            </div>
                                        </em>
                                        <em class="project-type reward">펀딩</em>
                                    </div>
                                    <div class="card-info-section making-project">
                                        <h4>제목을 입력해주세요. </h4>
                                        <h5>러닝메이트</h5>
                                        <p class="status confirm"><i></i>펀딩 준비 작성 중</p>
                                        <p></p>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="reward">
                            <div class="visibility-control">
                                <button type="button" class="btn-more"><i class="wadizicon wa-more-vert"></i></button>
                                <button type="button" class="btn-control" onclick="deletePrjt(143877)">삭제</button>
                            </div>
                            <div class="project-card-wrap">
                                <div class="project-card">
                                    <div class="card-img-section">
                                        <em class="project-img">
                                            <div class="default">
                                                <p>대표이미지 등록 필요</p>
                                            </div>
                                        </em>
                                        <em class="project-type reward">펀딩</em>
                                    </div>
                                    <div class="card-info-section making-project">
                                        <h4>제목을 입력해주세요. </h4>
                                        <h5>러닝메이트</h5>
                                        <p class="status confirm"><i></i>펀딩 준비 작성 중</p>
                                        <p></p>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="reward">
                            <div class="visibility-control">
                                <button type="button" class="btn-more"><i class="wadizicon wa-more-vert"></i></button>
                                <button type="button" class="btn-control" onclick="deletePrjt(143877)">삭제</button>
                            </div>
                            <div class="project-card-wrap">
                                <div class="project-card">
                                    <div class="card-img-section">
                                        <em class="project-img">
                                            <div class="default">
                                                <p>대표이미지 등록 필요</p>
                                            </div>
                                        </em>
                                        <em class="project-type reward">펀딩</em>
                                    </div>
                                    <div class="card-info-section making-project">
                                        <h4>제목을 입력해주세요. </h4>
                                        <h5>러닝메이트</h5>
                                        <p class="status confirm"><i></i>펀딩 준비 작성 중</p>
                                        <p></p>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>



</body>
</html>