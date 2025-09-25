<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>이 페이지는 getAttrubute.jsp에서 생성한 페이지입니다.</h3>
	
	<h2>request 기본객체의 속성을 이용한 값 전달 결과</h2>
	<%
		String id = (String)request.getAttribute("id");
	%>
	
	<ul>
		<li>아이디 - <%=id %></li>
		<li>비밀번호 - <%=request.getAttribute("password") %></li>
		<li>이름 - <%=request.getAttribute("name") %></li>
		<li>주소 - <%=request.getAttribute("addr") %></li>
		<li>이메일 - <%=request.getAttribute("email") %></li>
	</ul>
</body>
</html>
