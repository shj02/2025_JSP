<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>question_updateForm</title>
</head>
<body>
	<h2>게시판 수정</h2>
	<form action="/question/update/${question.id}">
		제 목 : <input type="text" name="subject" value=${question.subject }><br>
		내 용 : <br> 
			<textarea rows="5" cols="40" name="content">${question.content }</textarea>
			
			<br><br>
			<input type="submit" value="수정">
	</form>
	<br>
	<button onclick="location.href='/question/list'">목록</button>
</body>
</html>