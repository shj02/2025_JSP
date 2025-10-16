<%@page import="java.util.HashMap"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Map"%>
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
	<!-- 반복처리에 사용(배열, 컬렉션(리스트, 맵)) -->
	<%
		Map<String, Object> mapData = new HashMap<>();
		//Map 데이터 : <키, 값>의 쌍으로 구성
		mapData.put("id", "admin");
		mapData.put("today", new Date());
		mapData.put("age", 25);
	%>
	
	<c:set var="map" value="<%=mapData %>"/>
	<c:forEach var="m" items="${map }">
		${m.key } = ${m.value }<br>
	</c:forEach>
	<hr>
	<h2>구구단 7단</h2>
	<ul>
		<c:forEach var="num" begin="1" end="9">
			<li> 7 x ${num } = ${7*num }
		</c:forEach>
	</ul>
	
	<hr>
	<h2>forTokens 태그</h2>
	콤마와 점을 구분자로 사용 : <br>
	<c:forTokens items="빨강,주황.노랑.초록,파랑,남색.보라" delims=",." var="token">
		${token }
	</c:forTokens>
</body>
</html>