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
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		
		int add = num1 + num2;
		int sub = num1 - num2;
		int mul = num1 * num2;
		int div = num1 / num2;
	%>
	
	<h2>사칙연산 결과</h2>
	<h3>
	<%=num1 %> + <%=num2 %> = <%=add %><br>
	<%=num1 %> - <%=num2 %> = <%=sub %><br>
	<%=num1 %> * <%=num2 %> = <%=mul %><br>
	<%=num1 %> / <%=num2 %> = <%=div %>
	</h3>
</body>
</html>
