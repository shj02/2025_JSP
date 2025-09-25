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
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		
		//최종 결과 페이지로 넘길 데이터 변수 선언
		String msg;
		
		//로직 처리
		if(id.equals("admin")) {
			if(pw.equals("1234")) {
				msg = id + "님, 안녕하세요.";
			} else {
				msg = "비밀번호가 틀립니다.";
			}
		} else {
			msg = "아이디가 없습니다.";
		}
		
		//request 객체를 이용해서 데이터 전달
		request.setAttribute("msg", msg);
		%>
		
		<jsp:forward page="loginResult.jsp"></jsp:forward>
</body>
</html>
