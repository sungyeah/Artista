<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/fundingtmdetail.css">
<style>
.ck.ck-editor__main>.ck-editor__editable:not(.ck-focused) {
    border: none;
    border-top: 1px solid var(--ck-color-base-border) !important;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>  
<script>
$(function() {
	var raminAmount = 0;
	if('${funding.targetFunding}' > '${funding.sumAmount}'){
		raminAmount = '${funding.targetFunding}' - '${funding.sumAmount}';
		$("#remainAmount").text(raminAmount.toLocaleString());
		$("#remainName").text("남은 금액");
	} else {
		raminAmount = +'${funding.sumAmount}';
		$("#remainAmount").text(raminAmount.toLocaleString());
		$("#remainName").text("모인 금액");
	}
	var rate = '${funding.sumAmount}'/'${funding.targetFunding}'*100;
	$("#rate").text(rate);
	$("#pro").val(rate);
})
</script>
<body style="overflow-x: hidden">
	 <%@include file ="../header.jsp" %>
    <div id="contents">
        <header class="account-header">
            <h2 class="account-header-title">${funding.projTitle }</h2>
        </header>
        <div class="image-box">
            <img class="image-thumb" src="/funding/thumbview/${funding.thumbImg}" />
        </div>
        <div class="fundingdetail">
            <div id="name">펀딩 종료</div><br>
            <div class="menu">
            <div id="amount"><fmt:formatNumber type="number" maxFractionDigits="3" value="${funding.targetFunding}" /> 목표 금액</div><br>
            <div id="amount"><span id="remainAmount"></span>
            <span id="remainName"></span></div><br>
            <div id="amount">${count} 서포터</div><br>
            <div id="promain">
                <span id="rate"></span><span>%</span><br>
                <progress id="pro" value="30" max="100" style="width: 68%; height:7px;" ></progress>
            </div>
            </div><br>
            <button class="Btn2" onclick="location.href='${pageContext.request.contextPath}/artistdetail/${funding.artistNo }'">작가 페이지 이동</button>
            <!-- <div class="amountdetail">
                <button class="Btn1">전시 정보 보기</button>
            </div> -->
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
</body>
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
</html>