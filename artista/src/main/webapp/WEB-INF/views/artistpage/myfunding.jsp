<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Artista</title>
<link rel="stylesheet" href="../css/manager.css">
<link rel="stylesheet" href="../css/mypage.css">
<link rel="stylesheet" href="../css/applymodal.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script	src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>
</head>
<body>
	<%@include file="../header.jsp"%>
	
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
	<div id="contents">
		<header class="account-header">
			<h2 class="account-header-title">작가 페이지</h2>
			<div class="account-header-description">고객님과 관련된 정보입니다.</div>
		</header>
		<section class="account-guide">
			<div class="account-guide-inner">
				<h3 class="account-guide-name">
                    ${artistName }님 반갑습니다.
                </h3>
                <a class="account-modify-btn1" href="${pageContext.request.contextPath}/artistdetail/${artistNo }" style="right:120px;">
                    <p>미리보기</p>
                </a>
                <a class="account-modify-btn" href="${pageContext.request.contextPath}/artistpage/artistModify" >
                    <p>정보 수정</p>
                </a>
			</div>
		</section>
		<nav class="manager-nav">
			<a class="manager-nav-btn current"
				href="${pageContext.request.contextPath}/artistpage/mywork"> 전체
				작품 </a> <a class="manager-nav-btn"
				href="${pageContext.request.contextPath}/artistpage/myproduct">
				판매 작품 </a> <a class="manager-nav-btn" style="background-color: black;color: white;"
				href="${pageContext.request.contextPath}/artistpage/myfunding">
				나의 펀딩 </a> <a class="manager-nav-btn"
				href="${pageContext.request.contextPath}/artistpage/myexhibition">
				나의 전시 </a>
		</nav>


		<nav class="member-nav">
			<a class="member-nav-btn" href="${pageContext.request.contextPath}/artistpage/myfunding">
                <b>나의 리스트</b>
            </a>
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/artistpage/appmyfunding">
                신청 내역
            </a>
			<a class="member-delete-btn"
				href="${pageContext.request.contextPath}/artistpage/applyfunding">
				펀딩 신청 </a>
		</nav>

		<article class="member-body">
            <section class="member-list">
                <table class="member-table">
                    <thead>
                    <tr>
                        <th scope="col">펀딩 번호</th>
                        <th scope="col">대표이미지</th>
                        <th scope="col">펀딩제목</th>
                        <th scope="col">현재 상태</th>
                       	<th scope="col">일정</th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <c:choose>
                    	<c:when test="${list!=null }">
                    	<tbody>
                    		<c:forEach items="${list }" var="funding">
								<tr>
                            	<th scope="col">${funding.fundingNo }</th>
                            	<th scope="col">
                            		<img src="/funding/thumbview/${funding.thumbImg}" style="width:100px; height:100px;">	
                            	</th>
                            	<th scope="col"">${funding.projTitle }</th>            
                            	<th scope="col">
                            		<c:choose>
									<c:when test="${funding.fundingState==1}">예정</c:when>
									<c:when test="${funding.fundingState==2}">진행</c:when>
									<c:otherwise>종료</c:otherwise>
									</c:choose>
                            	</th>
                            	<th scope="col"">${funding.fundingDate }</th>    
                            	<th scope="col" colspan="1">
                            		<a class="artist-detail-btn" href="${pageContext.request.contextPath}/funding/fundingtmdetail?fundingNo=${funding.fundingNo }">페이지 보기</a>
                            		<c:if test="${funding.fundingState==1}">
                            			<br><br><a class="artist-detail-btn" href="${pageContext.request.contextPath}/artistpage/modifyfunding?fundingNo=${funding.fundingNo }">수정요청</a>
                            		</c:if>
                            	</th>                  
                           		<th scope="col" colspan="1">
                           			<c:if test="${funding.fundingState!=1 or funding.fundingState!=0}">
                           			<a class="artist-detail-btn" onclick="showSpon('${funding.fundingNo }')">스폰서 보기</a>
                           			</c:if>
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
	<script>
	
	//modal창
    const applyfunding = document.getElementById("applyfunding");
    const refuseapply = document.getElementById("refuseapply");
    const exhibition = document.getElementById("exhibition");
    
    $(function(){
		$(document).on('click', '.close-area', function(e){
			exhibition.style.display = "none";
			applyfunding.style.display = "none";
		});
		
	});

	function showSpon(fundingNo){
		exhibition.style.display = "flex";
		
		$.ajax({
			type:"post",
			async: false,
			url:"${pageContext.request.contextPath}/manager/sponList",
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
    	$(document).on('click', '.artist-detail-btn', function(e){
    		applyfunding.style.display = "flex";
    	});
    	$(document).on('click', '#apply_close', function(e){
    		applyfunding.style.display = "none";
    	});
    });
    $(function(){
    	$(document).on('click', '#refusemodal', function(e){
    		refuseapply.style.display = "flex";
    	});
    	$(document).on('click', '#refuse_close', function(e){
    		refuseapply.style.display = "none";
    	});
    	$(document).on('click', '#cancel', function(e){
    		refuseapply.style.display = "none";
    	});
    });
    
    function fundingDetail(fundingNo){
    	applyfunding.style.display = "flex";
		$.ajax({
			type:"post",
			dataType:"text",
			async: false,
			url:"${pageContext.request.contextPath}/artistpage/fundingdetail",
			data:{"fundingNo":fundingNo},
			success: function(data, textStatus){ 
			 	var fundingData = JSON.parse(data);
			 	$("#id").attr("value", fundingData.fundingapply.id);
			 	$('#artistName').attr("value", fundingData.artist.artistName);
			 	$('#email').attr("value", fundingData.email);
 			 	$("#targetFunding").attr("value", fundingData.fundingapply.targetFunding);
 			 	$("#Date").attr("value", fundingData.fundingapply.fundingDate);
 			 	$("#place").attr("value", fundingData.fundingapply.getplace + " " + fundingData.fundingapply.getplace2);
 			 	$("#projTitle").attr("value", fundingData.fundingapply.projTitle);
 			 	$("#fundingNo").attr("value", fundingData.fundingapply.fundingNo);
 			 	
 			 	ClassicEditor.create(document.querySelector("#projectIntro"))
 		    	.then(editor=>{
 		    		window.editor = editor;
 		    	    editor.isReadOnly = true;
 		    	    const toolbarElement = editor.ui.view.toolbar.element;
 		    	    toolbarElement.style.display = 'none';
 		        	editor.setData(fundingData.fundingapply.projIntro);
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
 		        	editor.setData(fundingData.fundingapply.projBudget);
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
 		        	editor.setData(fundingData.fundingapply.projArtist);
 		        })
 			    .catch((error) => {
 		    	   	console.error(error);
 			    });
 			 	
 			 	//$('#email').attr("src", "/artistpage/posterImg/"+exhibitData.exhibitPoster);
 			 	//$("#reserveLink").attr("value", exhibitData.reserveLink);
			},
			error:function(data, textStatus){
				alert("실패");
				alert(applyNo);
			}
		});
	}
	</script>

</body>
</html>