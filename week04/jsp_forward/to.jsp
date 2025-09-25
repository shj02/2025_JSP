<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>이 페이지는 to.jsp에서 생성한 페이지입니다.</h2>
	
	<%
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		String email = request.getParameter("email");
	%>
	
	<h2>jsp:param 액션태그 결과</h2>
	<ul>
		<li>아이디 - <%=id %></li>
		<li>비밀번호 - <%=password %></li>
		<li>이름 - <%=name %></li>
		<li>주소 - <%=addr %></li>
		<li>이메일 - <%=email %></li>
	</ul>
</body>
</html>