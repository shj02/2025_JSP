<%@page import="week05.Book"%>
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
		Book book = (Book)request.getAttribute("book");	
	%>
	<h2>* 도서 등록 결과 *</h2>
	<table border="1">
		<tr>
			<td>코드</td>
			<td>제목</td>
			<td>저자</td>
			<td>출판일</td>
		</tr>
		<tr>
			<td><%= book.getCode() %></td>
			<td><%= book.getTitle() %></td>
			<td><%= book.getWriter() %></td>
			<td><%= book.getPubDate() %></td>
		</tr>
	</table>
</body>
</html>