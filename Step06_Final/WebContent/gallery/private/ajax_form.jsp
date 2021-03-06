<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/gallery/private/ajax_form.jsp</title>
</head>
<body>
<div class="container">
	<form action="insert.jsp" method="post" id="insertForm">
		<input type="hidden" name="imagePath" id="imagePath"/>
		<div>
			<label for="caption">설명</label>
			<input type="text" name="caption" id="caption"/>
		</div>
	</form>
	<form action="ajax_upload.jsp" method="post" id="ajaxForm" enctype="multipart/form-data">
		<div>
			<label for="image">이미지</label>
			<input type="file" name="image" id="image" accept=".jpg, .jpge, .png, .JPG, .JPGE"/>
		</div>
	</form>
	<button id="submitBtn">등록</button>
	<div class="img-wrapper">
		<img />
	</div>
</div>
<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
<!-- jquery form 플러그인 javascript 로딩 -->
<script src="${pageContext.request.contextPath }/js/jquery.form.min.js"></script>
<script>
	//form 플러그인을 이용해서 form이 ajax 전송(페이지 전환 없이) 되도록 한다
	$("#ajaxForm").ajaxForm(function(data){
		//data는 {imagePath:"업로드 된 이미지 경로"} 형태의 object 이다
		console.log(data);
		//로딩할 이미지의 경로 구성
		let src="${pageContext.request.contextPath }"+data.imagePath;
		//img 요소의 src 속성으로 지정을 해서 이미지를 표시한다
		$(".img-wrapper img").attr("src", src); 
		<%-- 
			= document.querySelector(".img-wrapper img").setAttribute("src",src); 
			어떤 요소의 속성값을 변화시키는(jquery 방식으로)
		--%>
		//업로드 경로를 insertForm에 input type="hidden"에 value로 넣어준다
		$("#imagePath").val(data.imagePath);
	});
	
	//이미지를 선택하면 강제로 폼 전송 시키기
	$("#image").on("change", function(){
		$("#ajaxForm").submit();
	});
	
	//버튼을 누르면 insertForm 강제 제출 이미지 정보가 저장 되도록 한다
	$("#submitBtn").on("click", function(){
		$("#insertForm").submit();
	});
</script>
</body>
</html>