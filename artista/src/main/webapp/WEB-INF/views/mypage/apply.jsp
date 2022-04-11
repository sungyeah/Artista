<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Artista</title>
<link rel="stylesheet" href="../css/manager.css">
<link rel="stylesheet" href="../css/mypage.css">
<link rel="stylesheet" href="../css/enroll.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<link href="https://cdnjs.cloudflare.com/ajax/libs/air-datepicker/2.2.3/css/datepicker.min.css" rel="stylesheet" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/air-datepicker/2.2.3/js/datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/air-datepicker/2.2.3/js/i18n/datepicker.en.min.js"></script>

<style>
	.artistImg {
		width:300px; height:300px; margin-top:7px; display:inline-block;
	}

	.topadd_delete {
		cursor: pointer;
		float:right; 
		padding-left:10px; 
	}
	.artistsWorld {
		width:350px;  margin-bottom:12px; 
		float:left;
		display:inline-block;
	}
	.artistsWorldImg {
		width:300px; height:300px; margin-top:7px; display:inline-block; 
	}
</style>

</head>
<body>
	 <%@include file ="../header.jsp" %>
	<div id="contents">
    	<header class="account-header">
            <h2 class="account-header-title">작가등록 신청</h2>
            <div class="account-header-description">등록할 작가정보를 입력하세요.</div>
        </header>

        <article class="enroll-body">
            <form class="enroll-modify-form" method="post" action="/mypage/artistapply" enctype="multipart/form-data">
                <div class="enroll-modify-form"></div>
                <div class="certification-container  certified">
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 프로필 사진
                        </div>
                        <div class="enroll-modify-form-row-value">
                            <img class="artistImg" id="artistThumb" />
                            <label for="artistImg">파일 선택</label>
                            <input type="file" id="artistImg" name="artistImgFile" /><br>
                        </div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 아이디
                        </div>
                        <div class="enroll-modify-form-row-value">
                            <input class="enroll-modify-form-input" type="text" value="${id}" disabled><br>
                            <input type="hidden" id="id" name="id" value="${id}" >
                        </div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 필명
                        </div>
                        <div class="enroll-modify-form-row-value">
                            <input class="enroll-modify-form-input" type="text" id="artistName" name="artistName" placeholder="필명을 입력하세요" autocomplete="off" autocapitalize="off"><br>
                        </div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 아티스트 유형
                        </div>
                        <div class="enroll-modify-form-row-value">
                            <div class="wrap">
                                <div class="select">
  									<div class="selected">
    									<div class="selected-value" >none</div>
    									<div class="arrow"></div>
  									</div>
  									<ul>
  									    <li class="option">none</li>
  									    <li class="option">화가</li>
  									    <li class="option">사진가</li>
  									    <li class="option">조각가</li>
  									    <li class="option">소묘화가</li>
  									    <li class="option">Designers</li>
  									</ul>
  								</div>
                            </div>
  						</div>
  						<input type="hidden" id="artistType" name="artistType" value="none"/>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 아티스트 소개
                        </div>
                        <div class="enroll-modify-form-row-value">
                            <textarea class="enroll-modify-form-input" id="artistIntroduce" name="artistIntroduce" style="width:750px; height: 120px; resize: none;"></textarea>
                        </div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 아티스트의 이력
                        </div>
                        <div class="enroll-modify-form-row-value">
							<table><tbody>
                    			<tr class="artiststory">
                    			<th>
                    				<div class="select wrap">
  										<div class="selected">
    										<div class="selected-value">none</div>
    										<div class="arrow"></div>
  										</div>
  										<ul>
  									    	<li class="option">수상</li>
  									    	<li class="option">전시</li>
  									    	<li class="option">논문 및 저서</li>
  										</ul>
  									</div>
                    			</th>
                        		<th><input class="enroll-modify-form-input datepicker-here recordYear" data-min-view="years" data-view="years" data-date-format="yyyy" 
                        					placeholder="연도" style="display:inline-block; width:60px;" /></th>
                        		<th><input class="enroll-modify-form-input recordText" placeholder="내용을 입력하세요" 
                        					autocomplete="off" autocapitalize="off" style="width:500px;"></th>
                        		<th><span class="plus" style="cursor: pointer;">+</span></th>
                    			</tr>
                    		</tbody></table>
                    		<input type="hidden" id="artistRecord" name="artistRecord"/>
                		</div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red"> </span> 아티스트의 작업세계 
                        </div>
                        <div class="enroll-modify-form-row-value">
                        	<span id="plusWorld" class="topadd_delete">+</span>&nbsp;&nbsp;<span id="minusWorld" class="topadd_delete">-</span><br>
                            <div class="artistsWorld">
	                        	<img class="artistsWorldImg"/>
                            	<input type="file" name="artistWorld1" class="fileselect" />
                            </div>
                        </div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 인스타그램링크
                        </div>
                        <div class="enroll-modify-form-row-value">
                            <input class="enroll-modify-form-input" id="artistInstagram" name="artistInstagram" 
                            	placeholder="아티스트 instagram 링크를 입력하세요" autocomplete="off" autocapitalize="off" style="width:500px;"><br>
                        </div>
                    </div>
                    
                	<div class="account-modify-form-border">
                    	<div style="text-align: center; margin-top:15px; margin-bottom: 15px;">
                    		<button class="yesNo-btn" id="applyartist" style="width:120px;">아티스트 신청</button>
                    		<button class="yesNo-btn" id="cancel" type="reset">취소</button>
                        </div>
                	</div>
                </div>
            </form>
        </article>
    </div>
    
     <%@include file ="../footer.jsp" %>
    
    <script>
    $("#applyartist").click(function(){
    	$("#artistType").attr("value", $(".selected-value").eq(0).text());
    	
    	var artistRecordList = new Array();
    	for(var i=0; i<record; i++){
    		var data = new Object();
    		data.type = $(".selected-value").eq(i+1).text();
    		data.year = $(".recordYear").eq(i).val();
    		data.recordText = $(".recordText").eq(i).val();
    		artistRecordList.push(data) ;
    	}
    	$("#id").attr("value", $("#id").val());
    	$("#artistRecord").attr("value", JSON.stringify(artistRecordList));
    	alert(JSON.stringify(artistRecordList));
		$("#route_write").submit();
    });
    </script>

	<script>
	// 아티스트 대표이미지 show
	$("#artistImg").change(function (event) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$("#artistThumb").attr("src", e.target.result);	
		};
		reader.readAsDataURL(event.target.files[0]);
	});
	</script>
	
	<script>
	// 아티스트 이력
	var record=1;
	$(document).on("click",".plus", function(e){
		e.preventDefault()
		$(this).html("-");
		$(this).removeClass("plus");
		$(this).addClass("minus");
        var addStaffText =     
        	'<tr class="artiststory">'+
            '    <th>'+
            '    <div class="select wrap">'+
            '        <div class="selected">'+
            '        <div class="selected-value">none</div>'+
            '        <div class="arrow"></div>'+
            '        </div>'+
            '        <ul>'+
            '            <li class="option">수상</li>'+
            '            <li class="option">전시</li>'+
            '            <li class="option">논문 및 저서</li>'+
            '        </ul>'+
            '    </div>'+
            '    </th>'+    
            '    <th><input id="datepicker" class="enroll-modify-form-input recordYear" data-min-view="years" data-view="years" data-date-format="yyyy" placeholder="연도" style="display:inline-block; width:60px;" maxlength="4"/></th>'+
            '    <th><input class="enroll-modify-form-input recordText" placeholder="내용을 입력하세요" autocomplete="off" autocapitalize="off" style="width:500px;"></th>'+
            '    <th><span class="plus" style="cursor: pointer;">+</span></th>'+
            '</tr>';
        
		//last를 사용하여 artiststory라는 명을 가진 마지막 태그 호출
        var trHtml = $( "tr[class=artiststory]:last" );
        
      	//마지막 artiststory명 뒤에 붙인다.
        trHtml.after(addStaffText);
      	$(document).find("#datepicker").addClass("datepicker-here");
      	record++;
    });
    
	$(document).on("click",".minus", function(e){
		e.preventDefault();
		var trHtml = $(this).parent().parent();
		//tr 테그 삭제
        trHtml.remove();
        record--;
	});
	</script>
	
	<script>
	//아티스트 작품세계 이미지 수
	var workNum=1;
	
	// 아티스트 작품세계 이미지 show
	$(document).on("change", '.fileselect', function(event) {
		var reader = new FileReader();
		const img = $(this).prev();
		reader.onload = function(e) {
			img.attr("src", e.target.result);	
		};
		reader.readAsDataURL(event.target.files[0]);
	});
	
	// 작품세계 이미지 추가하기
	$(document).on("click", "#plusWorld", function(){
		$('.artistsWorld:last-child').clone().insertAfter("div[class=artistsWorld]:last");
		workNum++;
		
		$(".fileselect:last").prop("name","artistWorld"+workNum);
	});
	
	$(document).on("click", "#minusWorld", function(){
		workNum--;
		if(workNum >= 1){ $('.artistsWorld:last-child').remove(); }
		else { workNum=1; }
	});	
	</script>
	
	<script>
	// selectbox 구현
	$(document).on("click", ".select", function(e){
		const selectBoxElements = document.querySelectorAll(".select");
		function toggleSelectBox(selectBox) {
			selectBox.classList.toggle("active");
		}
		function selectOption(optionElement) {
			const selectBox = optionElement.closest(".select");
		  	const selectedElement = selectBox.querySelector(".selected-value");
		  	selectedElement.textContent = optionElement.textContent;
		}
		selectBoxElements.forEach(selectBoxElement => {
			selectBoxElement.addEventListener("click", function (e) {
		    	const targetElement = e.target;
		    	const isOptionElement = targetElement.classList.contains("option");
		    	if (isOptionElement) {
		      		selectOption(targetElement);
		    	}
		    	toggleSelectBox(selectBoxElement);
		  	});
		});
	});	
    </script>

</body>
</html>