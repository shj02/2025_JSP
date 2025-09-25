<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = sdf.format(date);
	%>
	<jsp:useBean id="member" class="week05.MemberInfo" scope="request"/>
	<jsp:setProperty property="*" name="member"/>
	<jsp:setProperty property="registerDate" name="member" value="<%= strDate %>"/>
	
	<jsp:forward page="memberResult.jsp">
</body>
</html>