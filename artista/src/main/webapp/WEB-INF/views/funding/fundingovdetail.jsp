<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/fundingovdetail.css">
<script src="../js/fundingovdetail"></script>
<style>
.ck.ck-editor__main>.ck-editor__editable:not(.ck-focused) {
    border: none;
    border-top: 1px solid var(--ck-color-base-border) !important;
}
</style>
<script   src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>
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
   
   $(function(){
      var endDate = new Date('${funding.endDate}').getTime();
      var currDate = new Date().getTime();
      var remainTime = (endDate-currDate)/1000;
      var remain_day=Math.floor(remainTime/(60*60*24));
      $("#remain_day").text(remain_day);
      remainTime=remainTime%(60*60*24);
      var remain_hour=Math.floor(remainTime/(60*60));
      $("#remain_hour").text(remain_hour);
      remainTime=remainTime%(60*60);
      var remain_minute=Math.floor(remainTime/60);
      $("#remain_minute").text(remain_minute);
   })


</script>   
<body style="overflow-x: hidden">
    <%@include file ="../header.jsp" %>
    <div id="contents">
        <header class="account-header">
            <h2 class="account-header-title" id="projTitle">${funding.projTitle }</h2>
        </header>
        <div class="image-box">
            <img class="image-thumb" src="/funding/thumbview/${funding.thumbImg}" />
        </div>
        <div class="fundingdetail">
            <div id="time">
         <jsp:useBean id="toDate" class="java.util.Date" />
         <span id="remain_day"></span><span style="font-size:15px;">일</span>
         <span id="remain_hour"></span><span style="font-size:15px;">시간</span>
         <span id="remain_minute"></span><span style="font-size:15px;">분 남음</span>
  
            </div><br>
            <div class="menu">
            <div id="amount"><fmt:formatNumber type="number" maxFractionDigits="3" value="${funding.targetFunding}" /> 목표 금액</div><br>
            <div id="amount"><span id="remainAmount"></span>
            <span id="remainName"></span></div><br>
            <div id="amount">${count} 서포터</div><br>
            <div id="promain">
                <span id="rate"></span><span>%</span><br>
                <progress id="pro" value="30" max="100" style="width: 68%; height:7px;"></progress>
            </div>
            </div>
            <br>
            <div class="amountdetail">
            <form action="fundingpay" name="fundingpay" id="fundingpay" method="post">
                <input class="account-modify-form-input" type="text" name="sponsorAmount" maxlength="20" id="sponsorAmount" placeholder="최소 금액">
                <input type="hidden" id="fundingNo" name="fundingNo" value="${funding.fundingNo }">
                <input class="Btn1" type="button" id="sponsor" onclick="CheckForm();" value="후원하기">
                
            </form>
            <br>
            <button class="Btn2" onclick="location.href='${pageContext.request.contextPath}/artistdetail/${funding.artistNo }'">작가 페이지 이동</button>
            </div>
           
        </div>
       <br><br><br><br><br><br>
    
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
    
    <script type="text/javascript">
       function CheckForm() {
           var sponsorAmount = document.getElementById("sponsorAmount");
           var id = '<%=(String)session.getAttribute("id")%>';
           if(id=='null'){
   			alert("로그인이 필요한 서비스입니다.")
   			return false;
   			}
           if (sponsorAmount.value == "") {
               alert("값을 입력해 주세요.");
               sponsorAmount.focus();
           } else{
              document.fundingpay.action = "fundingpay";
              document.fundingpay.submit();
           }   
       }

    </script>

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