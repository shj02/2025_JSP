<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- core태그 사용 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int[] list = {1,2,3,4,5,6,7,8,9,10};
	%>
	
	<c:if test="<%=list.length > 0 %>"> <!-- test="조건", list는 java변수이므로 표현식 사용 -->
		<c:forEach var="data" items="<%=list %>"> <!-- list에서 하나씩 읽어서 data에 저장 -->
			${data }
		</c:forEach>
	</c:if>
	<c:if test="<%=list.length == 0 %>"> <!-- else 부분 -->
		배열에 데이터가 없습니다.
	</c:if>
</body>
</html>