<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logoutForm.jsp</title>
</head>
<body>
	<script type="text/javascript">
		if(confirm("정말 로그아웃하겠습니까?")) {
			//확인 > true
			location.href = "/";
		}
	</script>
</body>
</html>