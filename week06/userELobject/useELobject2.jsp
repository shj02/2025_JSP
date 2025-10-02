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
		/* pageContext.setAttribute("name", "page-홍길동"); */
		request.setAttribute("name", "request-홍길동");
		session.setAttribute("name", "session-홍길동");
		application.setAttribute("name", "application-홍길동");
	%>
	<h3>
		<!-- page -> request -->
		pageContext 객체의 name 속성 값 = ${name }<br>
		request 객체의 name 속성 값 = ${name }<br>
		session 객체의 name 속성 값 = ${name }<br>
		application 객체의 name 속성 값 = ${name }<br>
		cookie 객체의 session id 값 = ${cookie.JSESSIONID.value }<br>
		<!-- 링크부분 끝에 ?code=202444040 입력하면 202444040 나옴 -->
		요청 파라미터 읽기 : code = ${param.code }
	</h3>
</body>
</html>