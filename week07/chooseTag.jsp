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
	<h2>choose 태그 라이브러리</h2>
	<ul>
		<c:choose>
		<!-- url에서 넘어오는 parameter로 choose태그가 위에서 아래로 가기 때문에, 하나가 만족하면 전체를 벗어남 -->
		<!-- ex) age=25&name=홍길동 -> 당신의 이름은 홍길동입니다. 만 출력! -->
			<c:when test="${param.name == '홍길동' }">
				<li>당신의 이름은 ${param.name }입니다.
			</c:when>
			<c:when test="${param.age >= 20 }">
				<li>당신은 성인입니다.
			</c:when>
			<c:otherwise>
				<li>당신은 홍길동이 아니고, 미성년자입니다.
			</c:otherwise>
		</c:choose>
	</ul>
</body>
</html>