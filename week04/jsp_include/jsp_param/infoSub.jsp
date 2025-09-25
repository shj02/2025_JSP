<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String type = request.getParameter("type");
	%>
	<table border="1" width="100%" cellpadding="10" cellspacing="10">
		<tr>
			<td>타입</td>
			<td><%= type %></td>
		</tr>
		<tr>
			<td>특징</td>
			<td>
				<%
					if(type.equals("iPhone")) {
						out.println("수려한 디자인");
					} else if(type.equals("Gallaxy")) {
						out.println("뛰어난 활용성");
					}
				%>
			</td>
		</tr>
	</table>
</body>
</html>
