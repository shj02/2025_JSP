<%@page import="week05.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		MemberInfo member = (MemberInfo)request.getAttribute("member");
	%>
	
	이름 : <%= member.getName() %> (<%= member.getId() %>)님 안녕하세요.
	<br>
	당신의 이메일은 <%= member.getEmail() %>입니다.
</body>
</html>