<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>개인정보 결과</h3>
	${param.name } (${param.id })님, 안녕하세요.<br>
	관심있는 스포츠 : ${paramValues.sports[0] }
				   ${paramValues.sports[1] }
				   ${paramValues.sports[2] }
				   ${paramValues.sports[3] }
</body>
</html>