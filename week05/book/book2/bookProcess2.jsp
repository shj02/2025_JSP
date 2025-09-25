<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
	<jsp:useBean id="book" class="week05.Book" scope="request"/>
	<jsp:setProperty property="*" name="book"/>
	<jsp:setProperty property="pubDate" name="book" value="<%= strDate %>"/>
	
	<jsp:forward page="bookResult2.jsp"></jsp:forward>
</body>
</html>