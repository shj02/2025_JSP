<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
		//선언부
		int factorial(int n) {
			int result = 1;
		 	for(int i=n; i>1; i--) {
				result *= i;
		 	}
		 	return result;
		}
	%>
	
	<h2>팩토리얼 계산하기</h2>
	<h3>5! = <%= factorial(5) %></h3>
</body>
</html>
