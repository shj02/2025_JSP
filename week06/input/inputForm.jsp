<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>두 수를 입력하세요</h2>
	<!-- 작은 수부터 큰 수까지의 합 구하기 -->
	<form action="inputProcess.jsp">
		작은 수 : <input type="number" name="num1" size="10">
		큰 수 : <input type="number" name="num2" size="10">
		<br><br>
		<input type="submit" value="결과 보기">
	</form>
</body>
</html>