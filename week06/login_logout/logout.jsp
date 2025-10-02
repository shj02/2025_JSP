<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		if(confirm("정말 로그아웃하시겠습니까?")) {
			/* true(확인) */
			location.href="logoutConfirm.jsp";
		} else {
			history.back(); //= history.go(-1);
		}
	</script>
</body>
</html>