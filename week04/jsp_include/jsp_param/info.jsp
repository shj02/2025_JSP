<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" width="100%" cellpadding="10" cellspacing="10">
		<tr>
			<td>모델 번호</td>
			<td>MQ7E2KH</td>
		</tr>
		<tr>
			<td>가격</td>
			<td>1,500,000원</td>
		</tr>
	</table>
	
	<jsp:include page="infoSub.jsp">
		<jsp:param value="Gallaxy" name="type"/>
	</jsp:include>
</body>
</html>
