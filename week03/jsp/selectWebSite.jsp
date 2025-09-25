<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- response 객체의 redirect 기능을 이용해서 웹 페이지 이동 -->
	<h3>연결할 웹 사이트를 선택하세요</h3>
	<form action="selectWeb.jsp">
		<input type="radio" name="web" value="http://www.naver.com"> 네이버<br>
		<input type="radio" name="web" value="http://www.daum.net"> 다음<br>
		<input type="radio" name="web" value="http://www.google.com"> 구글<br><br>
		<input type="submit" value="확인">
	</form>
</body>
</html>
