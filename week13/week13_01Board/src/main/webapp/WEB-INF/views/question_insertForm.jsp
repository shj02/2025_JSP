<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>question_insertForm</title>
</head>
<body>
	<h2>게시판 등록</h2>
	<form action="/question/insert">
		제 목 : <input type="text" name="subject"><br>
		내 용 : <br>
				<textarea rows="5" cols="40" name="content"></textarea>
		<br><br>
		<input type="submit" value="등록">
	</form>
	<br>
	<button onclick="location.href='/'">초기화면</button> <!-- root로! -->
</body>
</html>