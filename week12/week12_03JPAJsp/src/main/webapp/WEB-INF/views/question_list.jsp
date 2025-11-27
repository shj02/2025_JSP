<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>question_list</title>
</head>
<body>
	<h2>게시판 목록</h2>
	<table border="1">
		<tr>
			<td>ID</td>
			<td>제목</td>
			<td>내용</td>
			<td>등록일자</td>
		</tr>
		<c:forEach var="q" items="${questionList }">
			<tr>
				<td>${q.id }</td>
				<td>${q.subject }</td>
				<td>${q.content }</td>
				<td>${q.createDate }</td>
			</tr>
			
		</c:forEach>
	</table>
</body>
</html>