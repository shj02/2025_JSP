<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertForm</title>
</head>
<body>
	<h2>게시판 등록</h2>
	<br>
	<form action="/question/insertResult">
		제 목 : <input type="text" name="subject"><br>
		내 용 : <br>
				<textarea rows="5" cols="30" name="content"></textarea>
		<br>
		<input type="submit" value="등록">
	</form>
</body>
</html>