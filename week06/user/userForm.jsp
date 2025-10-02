<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>* 개인정보 입력 *</h2>
	<form action="userResult.jsp">
		아이디 : <input type="text" name="id"><br>
		이름 : <input type="text" name="name"><br>
		<br>
		관심있는 스포츠 : <br>
		<input type="checkbox" name="sports" value="축구">축구
		<input type="checkbox" name="sports" value="농구">농구
		<input type="checkbox" name="sports" value="야구">야구
		<input type="checkbox" name="sports" value="탁구">탁구
		<br><br>
		<input type="submit" value="확인">
		<input type="reset" value="취소"> 
	</form>
</body>
</html>