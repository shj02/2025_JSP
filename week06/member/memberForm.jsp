<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>* 회원가입 *</h2>
	<form action="memberProcess.jsp">
		아이디 : <input type="text" name="id" required="required"><br>
		비밀번호 : <input type="text" name="password" required="required"><br>
		이름 : <input type="text" name="name" required="required"><br>
		나이 : <input type="number" name="age" required="required"><br>
		연락처 : <input type="text" name="phone" required="required"><br>
		이메일 : <input type="text" name="email" required="required"><br>
		<br>
		<input type="submit" value="회원가입">
	</form>
</body>
</html>