<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="member" class="week05.MemberInfo" scope="request"/>
	이름 : <jsp:getProperty property="name" name="member"/>
	(<jsp:getProperty property="id" name="member"/>)님, 안녕하세요.
	<br>
	당신의 이메일은 <jsp:getProperty property="email" name="member"/>입니다.
</body>
</html>