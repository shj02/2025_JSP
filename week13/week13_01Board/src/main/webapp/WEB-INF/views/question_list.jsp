<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>question_list</title>
</head>
<body>
	<h2>게시판 목록</h2>
	<table border="1" cellpadding="10">
		<tr>
			<td>ID</td>
			<td>제 목</td>
			<td>등록일자</td>
		</tr>
		<c:forEach var="q" items="${list }">
			<tr>
				<td>${q.id }</td>
				<td>
					<a href="/question/detail/${q.id }">${q.subject }</a>
				</td>
				<td><fmt:formatDate value="${q.createDate }" pattern="yyyy/MM/dd hh:mm" /></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<button onclick="location.href='/question/insertForm'">등록</button>
</body>
</html>