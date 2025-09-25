<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- ctrl+shift+/ 주석 생성 단축키 -->
	<!-- 이 페이지는 JSP에 의해 생성된 HTML 문서입니다. -->
	
	<%
		int result = 1;
	
		/* 1부터 10까지 곱하는 반복문 */
		/* '소스코드 보기'에서 보이지 않음! */
		for(int i=1; i<=10; i++) {
			result *= i;
		}
	%>
	
	<br>
	1부터 10까지 곱한 값 = <%-- <%=result %> --%>
	<!-- '소스코드 보기'에서 보이지 않음! -->
</body>
</html>
