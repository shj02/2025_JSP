<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String[] sports = request.getParameterValues("sports");
		String result = "";
		if(sports != null) {
			result = String.join(", ", sports);
		}
	%>
	<h2><개인정보 입력 결과></h2>
	<table style="border: 1px solid white; text-align: center">
		<tr style="height: 30px;">
			<td width="120" style="background-color:#283563; color:white">구분</td><td width="150" style="text-align:center; background-color:#283563; color:white">내용</td>			
		</tr>
		<tr style="height: 30px;">
			<td style="background-color:#c9c9c9">이름</td><td style="background-color:#c9c9c9"><%=request.getParameter("name") %></td>			
		</tr>
		<tr style="height: 30px;">
			<td style="background-color:#e8e8e8">나이</td><td style="background-color:#e8e8e8"><%=request.getParameter("age") %>세</td>			
		</tr>
		<tr style="height: 30px;">
			<td style="background-color:#c9c9c9">성별</td><td style="background-color:#c9c9c9"><%=request.getParameter("gender") %></td>			
		</tr>
		<tr style="height: 30px;">
			<td style="background-color:#e8e8e8">주소</td><td style="background-color:#e8e8e8"><%=request.getParameter("addr") %></td>			
		</tr>
		<tr style="height: 30px;">
			<td style="background-color:#c9c9c9">좋아하는 운동</td><td style="background-color:#c9c9c9"><%=result %></td>			
		</tr>
	</table>
</body>
</html>