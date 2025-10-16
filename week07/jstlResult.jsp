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
	<!-- JSTL core 태그 결과 -->
	<p>이름 : ${name }</p>
	<p>성별 : ${gender }</p>
	<p>나이 : ${age }세</p>
	<p>
										<!-- array는 EL 변수! -->
		배열 데이터 : <c:forEach var="data" items="${array }">
					${data } 
		</c:forEach>
	</p>
	<hr>
	하나씩 건너뛴 데이터 :
									<!-- 0부터 4번 인덱스까지 2씩 건너뛰어서! > 1 3 5 -->
	<c:forEach var="data" items="${array }" begin="0" end="4" step="2">
		${data }
	</c:forEach>
	<hr>
	<h2>자바빈 객체의 프로퍼티 값 읽기</h2>
	아이디 : ${m.getId() } <br>
	이름 : ${m.name } <br>
	
	<c:if test="${m.id == m.password }">
		로그인 성공~!
	</c:if>
	<c:if test="${m.id != m.password }">
		로그인 실패...
	</c:if>
</body>
</html>