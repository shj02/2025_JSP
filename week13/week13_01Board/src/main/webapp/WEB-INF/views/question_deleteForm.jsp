<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>question_deleteForm</title>
</head>
<body>
	<script type="text/javascript">
		if(confirm("정말 삭제하겠습니까?")) {
			location.href = "/question/delete/${id}";
		} else {
			history.go(-1); //1개 이전 페이지로 넘어가자!
		}
	</script>
</body>
</html>