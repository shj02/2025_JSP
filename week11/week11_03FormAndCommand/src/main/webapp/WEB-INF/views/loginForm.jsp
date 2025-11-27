<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginForm.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
<div class="container-fluid">
  <a class="navbar-brand" href="#">Inha</a>
  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
      <li class="nav-item">
        <a class="nav-link active" aria-current="page" href="/">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/login">Login</a>
      </li>
    </ul>
  </div>
</div>
</nav>
<div class="container text-center">
	<h2 class="display-2" style="text-align: center; padding-top: 20px; height: 150px; background-color: #effaca;">
	LOGIN</h2>
	<p class="h3" style="text-align: left; padding-top: 20px; padding-left: 20px; height: 70px; background-color: #f0b669;">
	개인 정보 입력
	</p>
</div>
<form action="/inputResult">
	<div class="container">
		<div class="mb-3">
		<label class="form-lable">아이디</label>
		<input type="text" class="form-control" name="id">
		</div>
		<div class="mb-3">
		<label class="form-lable">비밀번호</label>
		<input type="password" class="form-control" name="password">
		</div>
		<div class="mb-3">
		<label class="form-lable">이름</label>
		<input type="text" class="form-control" name="name">
		</div>
		<div class="mb-3">
		<input type="submit" class="btn btn-primary" value="로그인">
		</div>					
	</div>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>