<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>* 정보 입력 *</h2>
	<form action="formResult.jsp" method="post">
		이름 <input type="text" name="name"><br>
		나이 <input type="number" name="age"><br>
		이메일 <input type="email" name="email"><br>
		<button type="submit">입력</button>
	</form>
</body>
</html>