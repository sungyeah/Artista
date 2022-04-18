<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/fundingucdetail.css">
<style>
	.alam { color: white; background: black; }
	.ck.ck-editor__main>.ck-editor__editable:not(.ck-focused) {
    border: none;
    border-top: 1px solid var(--ck-color-base-border) !important;
}
</style>

<script>
	$(function() {
		
	})
</script>
<body style="overflow-x: hidden">
<%@include file ="../header.jsp" %>
    <div id="contents">
        <header class="account-header">
            <h2 class="account-header-title">${funding.projTitle}</h2>
        </header>
        <div class="image-box">
            <img class="image-thumb" src="/funding/thumbview/${funding.thumbImg}" />
        </div>
        <div class="fundingdetail">
            <div id="timealert">
            <fmt:parseDate value="${funding.startDate }" var="startDate" pattern="yyyy-MM-dd HH" />
            <fmt:formatDate value="${startDate }" pattern="M" /><span>월</span>
            <fmt:formatDate value="${startDate }" pattern="d" /><span>일</span>
            <fmt:formatDate value="${startDate }" pattern="H" /><span>시</span>
            <span>오픈 예정</span>
            </div><br>
            <div class="amountdetail">
                <button type="button" class="Btn1" id="Btn1" onclick="alarm('${funding.fundingNo}')">알림 신청 ${count}명 신청 중</button>
            </div>
            <div>
                지금 바로 알림 신청하고 미리 연락 받으세요.
            </div>
            <br><br><button class="Btn2" onclick="location.href='${pageContext.request.contextPath}/artistdetail/${funding.artistNo }'">작가 페이지 이동</button>
        </div>
   <div class="projcontent" style="width:45%;">
    		<div class="editorbox">
    			<c:if test="${funding.projIntro ne ''}">
    				<h2 class="artist">프로젝트 소개</h2>
    				<br><textarea id="content" name="content" style="width: 100%; display:block;" ></textarea>
    			</c:if>
    		</div><br><br>
    		<div class="editorbox">
    			<c:if test="${funding.projBudget  ne ''}">
    				<h2 class="artist">예산 소개</h2>
   	 				<br><textarea id="content2" name="content" style="width: 100%; display:block;" ></textarea>
    			</c:if>
    		</div><br><br>
    		<div class="editorbox">
    			<c:if test="${funding.projArtist  ne ''}">
    				<h2 class="artist">작가 소개</h2>
    				<br><textarea id="content3" name="content" style="width: 100%; display:block;" ></textarea>
    			</c:if>
    		</div><br><br>
 			<div><button class="Btn3" onclick="location.href='${pageContext.request.contextPath}/funding/fundingov'">목록</button></div>
    	</div>
    </div>
    
    
    <%@include file ="../footer.jsp" %>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>  
    <script>

    $(function() {
    	var alarm = "<c:out value='${alarm}'/>"
    	if(alarm>0) {
    		$("#Btn1").addClass('alam');
    	} else {
    		$("#Btn1").removeClass('alam');
    	}
    })
     //버튼 색이 변경이 안 됨 json 파싱, artistPageCon~~
    function alarm(fundingNo){
    	var id = '<%=(String)session.getAttribute("id")%>';
    	if(id == 'null'){
    		alert("로그인이 필요한 서비스입니다.")
			return false;
    	}
    	var color=document.getElementById("Btn1");

    	$.ajax({
    		type: "Get",
    		dataType: "text",
    		async: false,
    		url: "${pageContext.request.contextPath}/funding/alarm",
    		data:{"fundingNo": fundingNo},
    		success: function(data, textStatus){
    			var alarm = JSON.parse(data);
    			if(alarm.checkAlarm==true){
    				$("#Btn1").addClass('alam');
/*     				color.style.color="white";
    				color.style.background="black";
 */    				$('#Btn1').text("알림 신청 "+alarm.cnt+"명 신청 중");
    			} else {
    				$("#Btn1").removeClass('alam');
/*     				color.style.color="black";
    				color.style.background="white";
 */    				$('#Btn1').text("알림 신청 "+alarm.cnt+"명 신청 중");
    			}
    		},
    		error:function(data, textStatus){
    			alert("실패");
    		}
    	});
    }
    </script>
    <script src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>
    <script>   
   $(function(){
      ClassicEditor.create(document.querySelector("#content"))
       .then(editor=>{
          window.editor = editor;
           editor.isReadOnly = true;
           const toolbarElement = editor.ui.view.toolbar.element;
           toolbarElement.style.display = 'none';
           editor.setData('${funding.projIntro}');
        })
       .catch((error) => {
             console.error(error);
       });
      ClassicEditor.create(document.querySelector("#content2"))
       .then(editor=>{
          window.editor = editor;
           editor.isReadOnly = true;
           const toolbarElement = editor.ui.view.toolbar.element;
           toolbarElement.style.display = 'none';
           editor.setData('${funding.projBudget}');
        })
       .catch((error) => {
             console.error(error);
       });
      ClassicEditor.create(document.querySelector("#content3"))
       .then(editor=>{
          window.editor = editor;
           editor.isReadOnly = true;
           const toolbarElement = editor.ui.view.toolbar.element;
           toolbarElement.style.display = 'none';
           editor.setData('${funding.projArtist}');
        })
       .catch((error) => {
             console.error(error);
       });
   });
   </script>
</body>
</html>