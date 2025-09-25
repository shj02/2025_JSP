<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>* 로그인 화면 *</h1>
	<h2><%=request.getAttribute("msg") %></h2>
	<br><br>
	<form action="loginProcess.jsp">
		<input type="submit" value="초기화면">
	</form>
	
	<%-- <%
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		
		if(id.equals("admin")) {
			if(pw.equals("1234")) {
				out.println(id + "님, 안녕하세요.");
			} else {
				out.println("비밀번호가 틀립니다.");
			}
		} else {
			out.println("아이디가 틀립니다.");
		}
	%> --%>
</body>
</html>