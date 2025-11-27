<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginForm.jsp</title>
</head>
<body>
	<h2>개인 정보 입력</h2>
	<form action="/inputResult">
		아이디 : <input type="text" name="id"><br>
		비밀번호 : <input type="password" name="pw"><br>
		이름 : <input type="text" name="name">
		<br><br>
		<input type="submit" value="확인">
	</form>
</body>
</html>