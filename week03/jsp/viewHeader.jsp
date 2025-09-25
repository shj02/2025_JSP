<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>request 객체의 Header 정보</h2>
	<%
		Enumeration hEnum = request.getHeaderNames();
		while(hEnum.hasMoreElements()) { //읽을 게 있으면
			String hName = (String)hEnum.nextElement(); //헤더 이름을 읽자
			String hValue = request.getHeader(hName); //해당 헤더의 정보 가져오기
			out.println(hName + " = " + hValue + "<br>");
		}
	%>
</body>
</html>
