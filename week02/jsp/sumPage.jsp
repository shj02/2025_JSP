<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 1~100까지의 합을 구한 뒤 화면에 출력하기 -->
	<% 
		/* 스크립틀릿 영역 - 자바 소스 코드 입력 */
		int total = 0;
		for(int i=1; i<=100; i++) {
			total += i;
		}
	%>
	
	<%!
		/* 선언부 : 메소드 정의 혹은 전역변수 설정 */
		public int sum(int x, int y) {
		return x+y;
	}
	%>
	<h3>
	<!-- 자바 변수 값을 화면에 표현할 때 : 표현식 -->
		1부터 100까지의 합 = <%= total %>
	</h3>
	<h2>
		두 수의 합 구하기 : 13 + 29 = <%= sum(13, 29) %>
	</h2>
</body>
</html>
