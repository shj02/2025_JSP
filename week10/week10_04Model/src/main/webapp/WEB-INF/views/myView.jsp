<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>ModelAndView 객체로 데이터 전달</h2>
	<h3>name : ${name }, age : ${age }</h3>
	<h3>${lists }</h3>
	
	<h3>리스트 항목</h3>
	<ul>
		<c:forEach var="myList" items="${lists }">
			<li>${myList }</li>
		</c:forEach>
	</ul>
</body>
</html>