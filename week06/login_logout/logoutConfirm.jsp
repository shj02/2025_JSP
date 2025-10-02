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
		/* session 안에 저장된 값들을 지움 */
		session.invalidate();
	%>
	
	<jsp:forward page="loginForm.jsp"/>
</body>
</html>