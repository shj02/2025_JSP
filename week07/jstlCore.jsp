<%@page import="week07.MemberInfo"%>
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
	<!-- core태그 라이브러리 : 변수를 설정하거나 논리적인 처리를 할 때 사용 -->
	<!-- 가장 많이 쓰이는 경우는 반복 처리 -->
	<c:set var="name" value="홍길동" scope="request"/> <!-- request : 다음 페이지로 넘기기 -->
	<c:set var="gender" value="남자" scope="request"/>
	<c:set var="age" value="25" scope="request"/>
	<c:set var="array" value="<%=new int[] {1,2,3,4,5} %>" scope="request"/>
	
	<!-- 자바빈 객체의 프로퍼티 값을 설정할 수도 있음 -->
	<%
		MemberInfo member = new MemberInfo();
	%>
	<c:set var="m" value="<%=member %>" scope="request"/>
	<c:set target="${m }" property="id" value="admin"/>
	<c:set target="${m }" property="password" value="admin"/>
	<c:set target="${m }" property="name" value="홍길동"/>
	
	<jsp:forward page="jstlResult.jsp"/>
</body>
</html>