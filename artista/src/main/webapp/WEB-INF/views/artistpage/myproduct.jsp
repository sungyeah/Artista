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
<link rel="stylesheet" href="../css/mypage.css">
</head>
<body>
    <div id="contents">
        <header class="account-header">
            <h2 class="account-header-title">작가 페이지</h2>
            <div class="account-header-description">고객님과 관련된 정보입니다.</div>
        </header>
        <section class="account-guide">
            <div class="account-guide-inner">
                <h3 class="account-guide-name">
                    홍성호님 반갑습니다.
                </h3>
                <a class="account-modify-btn" href="mypage/mypagemodify" onclick="gaClickAccount('account_modify');">
                    <p>작가 정보</p>
                </a>
            </div>
        </section>
        <nav class="manager-nav">
            <a class="manager-nav-btn current" href="${pageContext.request.contextPath}/artistpage/mywork">
                전체 작품
            </a>
            <a class="manager-nav-btn" href="${pageContext.request.contextPath}/artistpage/myproduct">
                판매 작품
            </a>
            <a class="manager-nav-btn" href="${pageContext.request.contextPath}/artistpage/myfunding">
                나의 펀딩
            </a>
            <a class="manager-nav-btn" href="${pageContext.request.contextPath}/artistpage/myexhibition">
                나의 전시
            </a>
        </nav>
        
        <nav class="member-nav">
            <a class="member-delete-btn" href="${pageContext.request.contextPath}/artistpage/enrollproduct" style="width:120px;">
                작품판매 신청
            </a>
        </nav>
        
		<br><br><br><br>
		<section id="discover_contents">
            <div id="discoverList" class="discoverList">
                <div class="discoverCard" data-discover-index="0" >
                    <a class="discoverCard-a" href="/artwork/A0366-0009/" data-code="A0366-0009">
                        <div class="discoverCard-imageWrap" style="padding-bottom: 50.0%; ">
                            <img class="discoverCard-image" src="https://og-data.s3.amazonaws.com/media/artworks/w_fixed/A0366/A0366-0009.jpg">
                            <div class="card-imageMask"></div>
                        </div>
                        <div class="discoverCard-textBox">
                            <h3 class="discoverCard-title">Floating Over</h3>
                            <div class="discoverCard-artist">신수진</div>
                            <div class="discoverCard-info">
                                45x90cm
                                (변형 20호)
                                
                            </div>
                        </div>
                    </a>
                    <div class="card-collectionBox " data-code="A0366-0009"></div>
                </div>
                <div class="discoverCard" data-discover-index="1">
                    <a class="discoverCard-a" href="/artwork/A1245-0119/" data-code="A1245-0119">
                        <div class="discoverCard-imageWrap" style="padding-bottom: 73.25%;">
                            <img class="discoverCard-image" src="https://og-data.s3.amazonaws.com/media/artworks/w_fixed/A1245/A1245-0119.jpg">
                            <div class="card-imageMask"></div>
                        </div>
                        <div class="discoverCard-textBox">
                            <h3 class="discoverCard-title">동 트는 아침</h3>
                            <div class="discoverCard-artist">양준모</div>
                            <div class="discoverCard-info">
                                53x73cm
                                (20호)
                                
                            </div>
                        </div>
                    </a>
                    <div class="card-collectionBox " data-code="A1245-0119"></div>
                </div>
                <div class="discoverCard" data-discover-index="2">
                    <a class="discoverCard-a" href="/artwork/A0425-0009/" data-code="A0425-0009">
                        <div class="discoverCard-imageWrap" style="padding-bottom: 71.5%;">
                            <img class="discoverCard-image" src="https://og-data.s3.amazonaws.com/media/artworks/w_fixed/A0425/A0425-0009.jpg">
                            <div class="card-imageMask"></div>
                        </div>
                        <div class="discoverCard-textBox">
                            <h3 class="discoverCard-title">내 안의 기억</h3>
                            <div class="discoverCard-artist">노채영</div>
                            <div class="discoverCard-info">
                                65x91cm
                                (30호)
                                
                            </div>
                        </div>
                    </a>
                    <div class="card-collectionBox " data-code="A0425-0009"></div>
                </div>

                <div class="discoverCard" data-discover-index="10">
                    <a class="discoverCard-a" href="/artwork/A0088-0012/" data-code="A0088-0012">
                        <div class="discoverCard-imageWrap discoverCard-imageWrap-landscape" style="padding-bottom: 28.499999999999996%; ">
                            <img class="discoverCard-image" src="https://og-data.s3.amazonaws.com/media/artworks/w_fixed/A0088/A0088-0012.jpg">
                            <div class="card-imageMask"></div>
                        </div>
                        <div class="discoverCard-textBox">
                            <h3 class="discoverCard-title">cosmos</h3>
                            <div class="discoverCard-artist">오숙진</div>
                            <div class="discoverCard-info">
                                46x159cm
                                (변형 40호)
                                
                            </div>
                        </div>
                    </a>
                    <div class="card-collectionBox " data-code="A0088-0012"></div>
                </div>
                <div class="discoverCard" data-discover-index="34" >
                    <a class="discoverCard-a" href="/artwork/A0335-0043/" data-code="A0335-0043">
                        <div class="discoverCard-imageWrap" style="padding-bottom: 125.75%;">
                            <img class="discoverCard-image" src="https://og-data.s3.amazonaws.com/media/artworks/w_fixed/A0335/A0335-0043.jpg">
                            <div class="card-imageMask"></div>
                        </div>
                        <div class="discoverCard-textBox">
                            <h3 class="discoverCard-title">U-Topos14004</h3>
                            <div class="discoverCard-artist">박제경</div>
                            <div class="discoverCard-info">
                                91x73cm
                                (30호)
                                
                            </div>
                            
                        </div>
                    </a>
                    <div class="card-collectionBox " data-code="A0335-0043"></div>
                </div>
                <div class="discoverCard" data-discover-index="32">
                        <a class="discoverCard-a" href="/artwork/A0394-0015/" data-code="A0394-0015">
                            <div class="discoverCard-imageWrap" style="padding-bottom: 74.75%; ">
                                <img class="discoverCard-image" src="https://og-data.s3.amazonaws.com/media/artworks/w_fixed/A0394/A0394-0015.jpg">
                                <div class="card-imageMask"></div>
                            </div>
                            <div class="discoverCard-textBox">
                                <h3 class="discoverCard-title">Celebration</h3>
                                <div class="discoverCard-artist">김서진</div>
                                <div class="discoverCard-info">
                                    92x122cm
                                    (50호)
                                    
                                </div>
                                
                            </div>
                        </a>
                        <div class="card-collectionBox " data-code="A0394-0015"></div>
                    </div>
            </div>
        </section>

    </div>

		
        
</body>
</html>