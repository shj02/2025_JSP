<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>요청 파라미터 출력</h2>
	<h3 style="color:red">request.getParameter()로 읽기</h3>
	name 파라미터 = <%=request.getParameter("name") %><br>
	addr 파라미터 = <%=request.getParameter("addr") %><br>
	
	<h3 style="color:blue">request.getParameterValues()로 읽기</h3>
	<%
		String[] values = request.getParameterValues("pet");
		if(values != null) {
			for(String s : values) {
				out.println(s);
				/* exResult) dog cat */
			}
		}
	%>
	
	<br>
	<h3 style="color:green">request.getParameterNames()로 읽기</h3>
	<%
		//파라미터 목록 읽기
		Enumeration pNames = request.getParameterNames();
		/* 있으면 읽고 없으면 안 읽음(배열과 다름) */
		
		while(pNames.hasMoreElements()) { //읽을 요소가 있으면 읽기(true/false)
			String pName = (String)pNames.nextElement();
			out.println(pName);
			/* exResult) name addr pet */
		}
	%>
	
	<br>
	<h3 style="color:orange">request.getParameterMap()로 읽기</h3>
	<%
		Map map = request.getParameterMap();
		String[] value = (String[])map.get("name");
		out.println("Map 형식 : (name," + value[0] + ")");
	%>
</body>
</html>
