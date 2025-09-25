<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>학번 : <%=request.getParameter("num") %></h2>
	<%
		int age = Integer.parseInt(request.getParameter("age"));
		String str = "";
		if(age >= 20) {
			str = "성인";
		} else {
			str = "미성년자";
		}
	%>
	<h2>나이 : <%=age %> (<%=str %>)</h2>
	
	<h2>선택한 과목 목록</h2>
	<ul>
		<%
			String[] values = request.getParameterValues("sub");
			if(values != null) {
				for(String v : values) {
					out.println("<li>" + v + "</li>");
				}
			} else {
				out.println("<li>선택한 과목이 없습니다. </li>");
			}
		%>
	</ul>
	
<%-- 	<%
		String[] values = request.getParameterValues("sub");
		if(values != null) {
			for(String v : values) {
				out.println("• " + v + "<br>");
			}
		}
	%> --%>	
</body>
</html>
