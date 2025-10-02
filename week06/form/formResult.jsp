<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>* 데이터 입력 결과 *</h2>
	<p>
		이름 : ${ empty param.name ? "손님" : param.name }
	</p>
	<p>
		${ age = empty param.age ? 0 : param.age }
		나이 : ${ age } (${ age<20 ? "미성년자" : "성인" })
	</p>
	<p>
		이메일 : ${ empty param.email ? "unknown@localhost" : param.email }
	</p>
	<hr>
	<p>
		요청 방식 : ${ pageContext.request.method }
	</p>
	<button onclick="location.href='formData.jsp'">초기 화면</button>
</body>
</html>