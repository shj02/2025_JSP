<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>contactForm.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<body>
<div class="container text-center">
	<h2 class="display-2" style="text-align: center; padding-top: 30px; height: 150px; background-color: #effaca;">
	연락처 등록 프로그램</h2>
	<p class="h3" style="text-align: left; padding-top: 20px; padding-left: 20px; height: 70px; background-color: #f0b669;">
	연락처 정보 입력
	</p>
</div>
<form action="/contactResult">
	<div class="container">
		<div class="mb-3">
		<label class="form-lable">이름</label>
		<input type="text" class="form-control" name="name">
		</div>
		<div class="mb-3">
		<label class="form-lable">아이디</label>
		<input type="text" class="form-control" name="id">
		</div>
		<div class="mb-3">
		<label class="form-lable">연락처</label>
		<input type="text" class="form-control" name="phone">
		</div>
		<div class="mb-3">
		<label class="form-lable">주소</label>
		<input type="text" class="form-control" name="address">
		</div>
		<div class="mb-3">
		<label class="form-lable">이메일</label>
		<input type="email" class="form-control" name="email">
		</div>
		<div class="mb-3">
		<input type="submit" class="btn btn-primary" value="등록">
		</div>					
	</div>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>