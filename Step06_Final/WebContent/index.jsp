<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session scope에 "id"라는 키값으로 저장된 문자열이 있는지 읽어와본다
	String id=(String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<jsp:include page="include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="include/navbar.jsp"></jsp:include>
	<div class="container">
		<%-- 만일 id가 null이 아니라면 로그인을 한 상태이다 --%>
		<%if(id!=null){ %>
			<p>
				<a href="users/private/info.jsp"><%=id %></a>님 로그인 중입니다
				<a href="users/logout.jsp">로그아웃</a>
			</p>
		<%}%>
		<h1>인덱스 페이지</h1>
		<ul>
			<li><a href="users/signup_form.jsp">회원가입</a></li>
			<li><a href="users/loginform.jsp">로그인</a></li>
			<li><a href="cafe/list.jsp">글 목록 보기</a></li>
			<li><a href="file/list.jsp">자료실 목록 보기</a></li>
			<li><a href="gallery/list.jsp">갤러리 목록 보기</a></li>
			<li><a href="file/list2">자료실 목록 보기 (MVC 패턴)</a></li>
			<li><a href="test/error_test.jsp">500번 오류나는 페이지</a></li>
		</ul>
	</div>
</body>
</html>