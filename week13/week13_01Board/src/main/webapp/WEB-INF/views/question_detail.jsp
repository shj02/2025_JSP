<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>question_detail</title>
</head>
<body>
	<h2>상세 내용</h2>
	<br>
	제 목 : ${question.subject }<br>
	내 용 : ${question.content }<br>
	등록일자 : <fmt:formatDate value="${question.createDate }" pattern="yyyy/MM/dd hh:mm" />
	<br><br>
	<button onclick="location.href='/question/updateForm/${question.id}'">수정</button>
	<button onclick="location.href='/question/deleteForm/${question.id}'">삭제</button>
	<button onclick="location.href='/question/list'">목록</button>
</body>
</html>