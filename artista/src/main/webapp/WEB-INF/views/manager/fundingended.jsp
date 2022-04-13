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
<link rel="stylesheet" href="../css/applymodal.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script	src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>
</head>
<body>
	<%@include file ="../header.jsp" %>
	<div id="exhibition" class="modal-overlay">
        <div class="modal-window">
            <header class="modal-header">
            	<div id="apply_close" class="close-area">X</div>
                <h2 class="modal-header-title">스폰서 목록</h2>
            </header>
            <article class="modal-body">
            	<table class="spon-table">
            		<thead>
            			<tr>
            				<th>스폰서 번호</th>
            				<th>아이디</th>
            				<th>이름</th>
            				<th>연락처</th>
            				<th>이메일</th>
            				<th>후원 금액</th>
            			</tr>
            		</thead>
            		<tbody id="sponsorTbody">
            			
            		</tbody>
            	</table>
            </article>  
        </div>
    </div>
	<div id="fundingdetail" class="modal-overlay">
        <div class="modal-window">
            <header class="modal-header">
            	<div id="apply_close" class="close-area">X</div>
                <h2 class="modal-header-title">펀딩 내용</h2>
            </header>
            <article class="modal-body">
                <form class="modal-modify-form" method="post">
                    <input type="hidden" name="csrfmiddlewaretoken" value="8OgojRYOprkIqojoq6rJDIRZ5GySLqG97ZObqNAuZ7hU3OWjqtvuReHD9X6DBckA">
                    <div class="modal-modify-form-border"></div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 아이디
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" type="text" disabled />
                        </div>
                    </div>
                    
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 아티스트 이름
                        </div>
                        <div class="modal-modify-form-row-value">
                        	<input class="modal-modify-form-input" type="text" disabled />
                        </div>
                    </div>    
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 이메일
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" type="text" disabled />
                        </div>
                    </div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 목표 금액
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" type="text" disabled />
                        </div>
                    </div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 펀딩 일정
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" style="width:140px;" type="text" disabled /> - <input class="modal-modify-form-input" style="width:140px;" type="text" disabled />
                        </div>
                    </div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 대관장소
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" type="text" disabled />
                        </div>
                    </div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 프로젝트 제목
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" type="text" disabled />
                        </div>
                    </div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 프로젝트 소개
                        </div>
                        <div class="modal-modify-form-row-value">
                        	<!-- ckeditor -->
                            <textarea id="projectIntro" style="width: 250px;;"></textarea>
                        </div>
                    </div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 예산정보
                        </div>
                        <div class="modal-modify-form-row-value">
                        	<!-- ckeditor -->
                            <textarea id="projectBudgetInfo" style="width: 250px;;"></textarea>
                        </div>
                    </div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 작가소개
                        </div>
                        <div class="modal-modify-form-row-value">
                        	<!-- ckeditor -->
                            <textarea id="projectArtistInfo" style="width: 250px;;"></textarea>
                        </div>
                    </div>        
                    <div class="modal-modify-form-border">
                        <div style="text-align: center; margin-top:15px; margin-bottom: 15px;">
                            <a class="yesNo-btn" id="close">닫기</a>      
                        </div>
                    </div>
                    </form>
            </article>  
        </div>
    </div>
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
        <article class="member-body">
            <section class="member-list">
                <table class="member-table">
                    <thead>
                    <tr>
                        <th scope="col">펀딩번호</th>
                        <th scope="col">대표이미지</th>
                        <th scope="col">프로젝트 제목</th>
                        <th scope="col">목표금액</th>
                        <th scope="col">달성률</th>
                        <th scope="col">펀딩결과</th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <!-- 환불 아임포트-->
                    <c:choose>
                    	<c:when test="${fundingEndedList!=null }">
                    	<tbody>
                    		<c:forEach items="${fundingEndedList }" var="funding">
								<tr>
                            	<th scope="col"><a onclick="fundingDetail('${funding.fundingNo }')">${funding.fundingNo }</a></th>
                            	<th scope="col">
                            		<img src="/funding/thumbview/${funding.thumbImg}" style="width:100px; height:100px;">	
                            	</th>
                            	<th scope="col"">${funding.projTitle }</th>   
                            	<th scope="col"">${funding.targetFunding }</th>    
                            	<th scope="col"">${funding.sumAmount/funding.targetFunding }</th>  
                            	<th scope="col" class="applyState">
                            		<c:if test="${funding.fundingState eq 4}">펀딩 성공</c:if>
                            		<c:if test="${funding.fundingState eq 5}">펀딩 실패</c:if>
                            		<c:if test="${funding.fundingState eq 6}">환불 완료</c:if>
                            	</th>
                            	<th scope="col" colspan="1">
                            		<a class="artist-detail-btn" onclick="showSpon('${funding.fundingNo }')">스폰서 보기</a>
                            	</th>                  
                           		<th scope="col" colspan="1">
                            		<c:if test="${funding.fundingState eq 5}"><a class="artist-detail-btn" onclick="showDetail('${worklist.workapplyNo }')">환불처리 완료</a></c:if>
                            	</th>
                        		</tr>
                        		</c:forEach>
                        </tbody>
                    	</c:when>
                    </c:choose>
                </table>
            </section>
        </article>
        
    </div>
    <%@include file ="../footer.jsp" %>
    
    <script>
    $(function(){
    	$(document).on('click', '.refund', function(e){
    		alert("환불 완료 처리되었습니다.");
    	});
    });
    </script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
	//modal창
    const fundingdetail = document.getElementById("fundingdetail");
    const exhibition = document.getElementById("exhibition");
    
    $(function(){
		$(document).on('click', '.close-area', function(e){
			exhibition.style.display = "none";
		});
		
	});
	
	function showSpon(fundingNo){
		exhibition.style.display = "flex";
		$.ajax({
			type:"post",
			async: false,
			url:"http://localhost:8090/manager/sponList",
			dataType:"text",
			/* contentType:"application/json;charset=UTF-8", */
			data:{"fundingNo":fundingNo},
			success: function(data, textStatus){ 
			 	var fundingData = JSON.parse(data);
			 	var accEle = "";
  				for(var i in fundingData) {
  					accEle += '<tr class="aa">'
					accEle += '<td>'+ (+i + 1) +'</td>'
  					accEle += '<td>'+ fundingData[i].id +'</td>'
  					accEle += '<td>'+ fundingData[i].name +'</td>'
  					accEle += '<td>'+ fundingData[i].contact +'</td>'
  					accEle += '<td>'+ fundingData[i].email +'</td>'
  					accEle += '<td>'+ fundingData[i].sponAmount +'</td>'
  					accEle += '</tr>'
  				}
  				$('.aa').detach();
  				$('#sponsorTbody').append(accEle);
			},
			error:function(data, textStatus){
				alert("실패");
			}
		});
	}
	
    $(function(){
    	$(document).on('click', '.detail', function(e){
    		fundingdetail.style.display = "flex";
    	});
    	$(document).on('click', '#apply_close', function(e){
    		fundingdetail.style.display = "none";
    	});
    	$(document).on('click', '#close', function(e){
    		fundingdetail.style.display = "none";
    	});
    });
    
    //ckeditor
    $(function(){
    	ClassicEditor.create(document.querySelector("#projectIntro"))
    	.then(editor=>{
    		window.editor = editor;
    	    editor.isReadOnly = true;
    	    const toolbarElement = editor.ui.view.toolbar.element;
    	    toolbarElement.style.display = 'none';
        	editor.setData();
        })
	    .catch((error) => {
    	   	console.error(error);
	    });
    	ClassicEditor.create(document.querySelector("#projectBudgetInfo"))
    	.then(editor=>{
    		window.editor = editor;
    	    editor.isReadOnly = true;
    	    const toolbarElement = editor.ui.view.toolbar.element;
    	    toolbarElement.style.display = 'none';
        	editor.setData();
        })
	    .catch((error) => {
    	   	console.error(error);
	    });
    	ClassicEditor.create(document.querySelector("#projectArtistInfo"))
    	.then(editor=>{
    		window.editor = editor;
    	    editor.isReadOnly = true;
    	    const toolbarElement = editor.ui.view.toolbar.element;
    	    toolbarElement.style.display = 'none';
        	editor.setData();
        })
	    .catch((error) => {
    	   	console.error(error);
	    });
    });
    
    
    </script>
</body>
</html>