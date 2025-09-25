<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>클라이언트 및 서버 정보</h2>
	클라이언트 IP = <%=request.getRemoteAddr() %><br>
	요청 정보 인코딩 = <%=request.getCharacterEncoding() %><br>
	요청 정보 프로토콜 = <%=request.getProtocol() %><br>
	요청 정보 전송방식 = <%=request.getMethod() %><br>
	요청 URL = <%=request.getRequestURL() %><br>
	서버 이름 = <%=request.getServerName() %><br>
	서버 포트 = <%=request.getServerPort() %><br>
</body>
</html>
