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
<link rel="stylesheet" href="../css/enroll.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<link href="https://cdnjs.cloudflare.com/ajax/libs/air-datepicker/2.2.3/css/datepicker.min.css" rel="stylesheet" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/air-datepicker/2.2.3/js/datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/air-datepicker/2.2.3/js/i18n/datepicker.en.min.js"></script>


</head>
<body>
    <div id="contents">
    	<header class="account-header">
            <h2 class="account-header-title">작가등록 신청</h2>
            <div class="account-header-description">등록할 작가정보를 입력하세요.</div>
        </header>

        <article class="enroll-body">
            <form class="enroll-modify-form" method="post" enctype="multipart/form-data">
                <div class="enroll-modify-form"></div>
                <div class="certification-container  certified">
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 프로필 사진
                        </div>
                        <div class="enroll-modify-form-row-value">
                            <img id="artistThumb" src="/artistprofile/" style="width:300px; height:300px; margin-top:7px; display:inline-block;"/>
                            <input type="file" id="artistImg" name="artistImg" /><br>
                        </div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 아이디
                        </div>
                        <div class="enroll-modify-form-row-value">
                            <input class="enroll-modify-form-input" type="text" name="id" id="id" value="강호동" disabled><br>
                        </div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 필명
                        </div>
                        <div class="enroll-modify-form-row-value">
                            <input class="enroll-modify-form-input" type="text" name="artistName" id="artistName" placeholder="필명을 입력하세요" autocomplete="off" autocapitalize="off"><br>
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
    									<div class="selected-value">none</div>
    									<div class="arrow"></div>
  									</div>
  									<ul>
  									    <li class="option">none</li>
  									    <li class="option">화가</li>
  									    <li class="option">사진가</li>
  									    <li class="option">조각가</li>
  									    <li class="option">소묘화가</li>
  									    <li class="option">Designer</li>
  									</ul>
  								</div>
                            </div>
  						</div>
  						<input type="hidden" id="artistType" name="artistType" />
                    </div>
                    
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 이메일
                        </div>
                        <div class="enroll-modify-form-row-label">
                            <input class="enroll-modify-form-input" type="text" placeholder="아티스트 이메일을 입력하세요" autocomplete="off" autocorrect="off" autocapitalize="off" style="width:500px;"><br>
                        </div>
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
                        		<th><input class="enroll-modify-form-input datepicker-here" data-min-view="years" data-view="years" data-date-format="yyyy" placeholder="연도" style="display:inline-block; width:60px;" /></th>
                        		<th><input class="enroll-modify-form-input" placeholder="내용을 입력하세요" autocomplete="off" autocapitalize="off" style="width:500px;"></th>
                        		<th><span class="plus" style="cursor: pointer;">+</span></th>
                    			</tr>
                    		</tbody></table>
                		</div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 아티스트의 작업세계 
                        </div>
                        <div class="enroll-modify-form-row-value">
                            <a class="yesNo-btn" href="/account/delete/">
                                사진선택
                            </a>
                        </div>
                    </div>
                    <div class="enroll-modify-form-row">
                        <div class="enroll-modify-form-row-label">
                            <span class="red">*</span> 인스타그램링크
                        </div>
                        <div class="enroll-modify-form-row-value">
                            <input class="enroll-modify-form-input" id="artistInstagram" name="artistInstagram" placeholder="아티스트 instagram 링크를 입력하세요" autocomplete="off" autocapitalize="off" style="width:500px;"><br>
                        </div>
                    </div>
                    
                	<div class="account-modify-form-border">
                    	<div style="text-align: center; margin-top:15px; margin-bottom: 15px;">
                        	<a class="yesNo-btn" id="workenroll" style="width:120px;">아티스트 신청</a>                    
                        	<a class="yesNo-btn" id="cancel">취소</a>      
                    	</div>
                	</div>
                </div>
            </form>
           
        </article>
    </div>

	<script>
	$("#artistImg").change(function (event) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$("#artistThumb").attr("src", e.target.result);	
		};
		reader.readAsDataURL(event.target.files[0]);
	});
	</script>
	
	<script>
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
            '    <th><input class="enroll-modify-form-input datepicker-here year" data-min-view="years" data-view="years" data-date-format="yyyy" placeholder="연도" style="display:inline-block; width:60px;" /></th>'+
            '    <th><input class="enroll-modify-form-input" placeholder="내용을 입력하세요" autocomplete="off" autocapitalize="off" style="width:500px;"></th>'+
            '    <th><span class="plus" style="cursor: pointer;">+</span></th>'+
            '</tr>';
            
		//last를 사용하여 artiststory라는 명을 가진 마지막 태그 호출
        var trHtml = $( "tr[class=artiststory]:last" );
        
      	//마지막 artiststory명 뒤에 붙인다.
        trHtml.after(addStaffText);
    });
    
	$(document).on("click",".minus", function(e){
		e.preventDefault();
		var trHtml = $(this).parent().parent();
		//tr 테그 삭제
        trHtml.remove();
	});
	
	$(document).on("click",".year", function(e){
		e.preventDefault()
		///$(this).html("-");
		//$(this).removeClass("plus");
		//$(this).addClass("minus");
		
		$(this).addClass("datepicker-here");
		$(this).attr("data-language","en");
		$(this).attr("data-min-view","years");
		$(this).attr("data-view","years");
		$(this).attr("data-date-format","yyyy");
		
		
		/*
		data-language='en';
		data-min-view="years";
		data-view="years";
		data-date-format="yyyy";*/
    });
	
	$(document).on("click",".selected", function(e){
		e.preventDefault()
		const selectNum = $(".selected").index(this);
		console.log(selectNum);
		
		//$("요소 선택:nth-child(숫자)")
		//$("li:nth-child(3)")
		const selectBoxElements = document.querySelectorAll(".selected:nth-child("+selectNum+"");
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
	
	function toggleSelectBox(selectBox) {
		selectBox.classList.toggle("active");
	}
	function selectOption(optionElement) {
		const selectBox = optionElement.closest(".select");
		const selectedElement = selectBox.querySelector(".selected-value");
		selectedElement.textContent = optionElement.textContent;
	}
	
	</script>
	
	<script>
	
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

	$(document).on("click",".select", function(e){
		e.preventDefault();
		const targetElement = e.target;
		const selectNum = $(".select").index(this);
		console.log(selectNum);
		
		 //$('.right-div span').eq(indexNo).toggleClass('hide');
		 
		const isSelect = targetElement.classList.contains("select") || targetElement.closest(".select");
		if (isSelect) {
			return;
		}
		
		const allSelectBoxElements = document.querySelectorAll(".select").eq(selectNum);
		
		const selectBoxElements = document.querySelectorAll(".select").eq(selectNum);
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
		
		allSelectBoxElements.forEach(boxElement => {
		    boxElement.classList.remove("active");
		});
	});
	
	document.addEventListener("click", function (e) {
	  const targetElement = e.target;
	  const isSelect = targetElement.classList.contains("select") || targetElement.closest(".select");

	  if (isSelect) {
	    return;
	  }

	  const allSelectBoxElements = document.querySelectorAll(".select");

	  allSelectBoxElements.forEach(boxElement => {
	    boxElement.classList.remove("active");
	  });
	});
    </script>

</body>
</html>