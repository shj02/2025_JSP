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
		int total = 0;
		for(int i=1; i<=100; i++) {
			if(i%2==0) {
				total += i;
			}
		}
	%>
	
	<h3>
		1부터 100까지의 숫자 중 모든 짝수의 합 = <%= total %>
	</h3>
</body>
</html>
