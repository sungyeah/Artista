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
<link rel="stylesheet" href="../css/applymodal.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<%@include file ="../header.jsp" %>
	<div id="exhibitiondetail" class="modal-overlay">
        <div class="modal-window">
            <header class="modal-header">
            	<div class="close-area close-area1">X</div>
                <h2 class="modal-header-title">전시 상세보기</h2>
            </header>
            <article class="modal-body">
                   	<div class="modal-modify-form-border"></div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 전시포스터
                        </div>
                        <div class="modal-modify-form-row-value">
                            <img style="width:300px; height:300px;" id="exhibitPoster"/>
                        </div>
                    </div>
                    
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 펀딩번호
                        </div>
                        <div class="modal-modify-form-row-value">
                        	<input class="modal-modify-form-input" id="fundingNo" type="text" disabled />
                        </div>
                    </div>    
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 전시명
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" id="exhibitTitle" type="text" disabled />
                        </div>
                    </div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 전시작가
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" id="exhibitArtist" type="text" disabled />
                        </div>
                    </div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 전시일정
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" id="exhibitDate" style="width:250px;" disabled />
                        </div>
                    </div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 전시장소
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" id="exhibitPlace" type="text" disabled />
                        </div>
                    </div>
                    <div class="modal-modify-form-row">
                        <div class="modal-modify-form-row-label">
                            <span class="red">*</span> 예매링크
                        </div>
                        <div class="modal-modify-form-row-value">
                            <input class="modal-modify-form-input" id="reserveLink" type="text" disabled />
                        </div>
                    </div>
                    <input type="hidden" id="exhibitapplyNo" disabled/>
                    <div class="modal-modify-form-border">
                        <div style="text-align: center; margin-top:15px; margin-bottom: 15px;">
                            <button class="yesNo-btn close-area1">닫기</button>
                        </div>
                    </div>
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
            <a class="manager-nav-btn" href="${pageContext.request.contextPath}/manager/exhibitionlist" style="background-color:#222;color:white;">
                전시 관리
            </a>
            <a class="manager-nav-btn" href="${pageContext.request.contextPath}/manager/memberlist">
                회원 관리
            </a>
        </nav>

        <nav class="member-nav">
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/manager/exhibitionlist">
                <b>전시 목록 관리</b>
            </a>
            <a class="member-nav-btn" href="${pageContext.request.contextPath}/manager/exhibitionapplylist">
                전시 등록 신청
            </a>
            <a class="member-delete-btn" href="${pageContext.request.contextPath}/manager/enrollexhibition">
       		 	전시등록
        	</a>
        </nav>
        <article class="member-body">
            <section class="member-list">
                <table class="member-table">
                    <thead>
                    <tr>
                        <th scope="col">전시신청번호</th>
                        <th scope="col">전시 제목</th>
                        <th scope="col">아티스트 이름</th>
                        <th scope="col">전시시작일</th>
                        <th scope="col">전시종료일</th>
                        <th scope="col">대관장소</th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                   	<c:choose>
                    	<c:when test="${exhibitlist!=null }">
                    	<tbody>
                    		<c:forEach items="${exhibitlist }" var="exhibitlist">
								<tr>
                            	<th scope="col">${exhibitlist.exhibitNo }</th>
                            	<th scope="col">${exhibitlist.exhibitTitle }</th>
                            	<th scope="col">${exhibitlist.exhibitArtist }</th>
                            	<th scope="col">${exhibitlist.startDate }</th>
                            	<th scope="col">${exhibitlist.endDate }</th>
                            	<th scope="col">${exhibitlist.exhibitPlace }</th>                       
                           		<th scope="col"><a class="artist-detail-btn" onclick="exhibitDetail('${exhibitlist.exhibitNo }')">신청 상세보기</a></th>
                        		<th scope="col"><input name="check" type="checkbox" id="${exhibitlist.exhibitNo }" value="${exhibitlist.exhibitNo }" ></th>
                        		</tr>
                        	</c:forEach>
                        </tbody>
                    	</c:when>
                    </c:choose>
                </table>
                <button id="delete" class="member-delete-btn">전시 삭제</button>
            </section>
        </article>
    </div>
    
	<%@include file ="../footer.jsp" %>
	
	<script>
	//modal창
    const exhibitiondetail = document.getElementById("exhibitiondetail");
    
    $(function(){
    	$(document).on('click', '.artist-detail-btn', function(e){
    		exhibitiondetail.style.display = "flex";
    	});
    	$(document).on('click', '.close-area1', function(e){
    		exhibitiondetail.style.display = "none";
    	});
    	
    	$(document).on('click', '#delete', function(e){
			var result = confirm("삭제하시겠습니까?");
			if(!result){
			   return;
			}
			var checkarray = new Array(); 
			$('input:checkbox[name=check]:checked').each(function() { 
				checkarray.push(this.value); 
			});
			$.ajax({     
				type:"post",
				dataType:"text",
				async:false,
				url:"http://localhost:8090/manager/exhibitionDelete",
				data:{"checkarray": checkarray},
				success: function(data, textStatus){
					alert("삭제가 완료되었습니다.")
					location.reload();
				},
				error:function(data, textStatus){
					alert("실패");
				}
			});
		});
    });
    
    function exhibitDetail(exhibitNo){
    	exhibitiondetail.style.display = "flex";
		$.ajax({
			type:"post",
			dataType:"text",
			async: false,
			url:"http://localhost:8090/manager/exhibitdetail",
			data:{"exhibitNo":exhibitNo},
			success: function(data, textStatus){ 
			 	var exhibitData = JSON.parse(data);
			 	$("#exhibitapplyNo").attr("value", exhibitData.exhibitNo);
			 	$('#fundingNo').attr("value", exhibitData.fundingNo);
 			 	$('#exhibitPoster').attr("src", "/artistpage/posterImg/"+exhibitData.exhibitPoster);
 			 	$("#exhibitTitle").attr("value", exhibitData.exhibitTitle);
 			 	$("#exhibitArtist").attr("value", exhibitData.exhibitArtist);
 			 	$("#exhibitDate").attr("value", exhibitData.startDate + " ~ " + exhibitData.endDate);
 			 	$("#exhibitPlace").attr("value", exhibitData.exhibitPlace);
 			 	$("#reserveLink").attr("value", exhibitData.reserveLink);
			},
			error:function(data, textStatus){
				alert("실패");
			}
		});
    }
    </script>

</body>
</html>