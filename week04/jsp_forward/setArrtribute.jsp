<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- request 기본객체의 속성을 이용해서 데이터 전달 -->
	<%
		//					 속성이름, 속성값
		request.setAttribute("id", "admin");
		request.setAttribute("password", "1234");
		request.setAttribute("name", "홍길동");
		request.setAttribute("addr", "서울");
		request.setAttribute("email", "hgd@naver.com");
	%>
	
	<jsp:forward page="getAttribute.jsp" />
</body>
</html>