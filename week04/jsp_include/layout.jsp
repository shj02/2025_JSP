<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" width="400" cellpadding="10" cellspacing="10">
		<tr>
			<td colspan="2">
				<jsp:include page="top.jsp"></jsp:include>
			</td>
		</tr>
		<tr>
			<td width="100" valign="top">
				<jsp:include page="left.jsp"></jsp:include>
			</td>
			<td width="300" valign="top">
				레이아웃 내용<br><br>
				<jsp:include page="info.jsp" /> <!-- /를 안에 넣어서 뒤를 생략 -->
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<jsp:include page="bottom.jsp"></jsp:include>
			</td>
		</tr>
	</table>
</body>
</html>
