<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile Edit</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" 
	  rel="stylesheet" 
	  integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" 
	  crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/galmuri/dist/galmuri.css" />
<style>	
	body {
	    font-family: 'Galmuri11', sans-serif;
	    background-color: #e6e3e3;
	    min-height: 100vh;
	    margin: 0;
	    cursor: url("/image/cursorWinter.png") 0 0, auto;
	}

    /* 계절 별 커서 변경*/
    body.spring {
        cursor: url("/image/cursorSpring.png") 0 0, auto;
    }
    body.summer {
        cursor: url("/image/cursorSummer.png") 0 0, auto;
    }
    body.autumn {
        cursor: url("/image/cursorAutumn.png") 0 0, auto;
    }
    body.winter {
        cursor: url("/image/cursorWinter.png") 0 0, auto;
    }
	
	.login-container {
	    background-color: #ffffff;
	    padding: 40px 20px;
	    border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        
	    margin-top: 0;
	    margin-bottom: 0;
	    
	    min-height: 100vh;
	    display: flex;
	    flex-direction: column;
    	justify-content: center;
	}

    .form-control, .form-label, .form-text, .btn {
        font-size: 1rem;
    }
    
    .mb-3 {
    padding-bottom: 10px;
    }
</style>
</head>
<body class="${season }">
	<div class="container-fluid"> 
        <div class="row justify-content-center"> 
             <div class="col-12 col-lg-10 col-xl-9"> 
                <div class="login-container">
                    
                    <h2 class="text-center mb-5">Edit Your Profile Here!</h2>
                    
                    <form action="/user/update" method="post" style="width: 600px; margin: 0 auto;">
                        
                        <div class="mb-3">
							<label for="userIdInput" class="form-label">ID</label>
							<input type="text" class="form-control" id="userIdInput" 
                                   name="userId" 
                                   value="${user.userId}" 
                                   readonly>
						</div>
						
						<div class="mb-3">
							<label for="userPasswordInput" class="form-label">PASSWORD</label>
							<input type="text" class="form-control" id="userPasswordInput" 
                                   name="password" 
                                   value="${user.password}" 
                                   readonly>
						</div>
						
						<div class="mb-3">
							<label for="userNameInput" class="form-label">NAME</label>
							<input type="text" class="form-control" id="userNameInput" 
                                   name="name" 
                                   value="${user.name}" 
                                   readonly> 
						</div>
						
						<div class="mb-3">
							<label for="userNicknameInput" class="form-label">NICKNAME</label>
							<input type="text" class="form-control" id="userNicknameInput" 
                                   name="nickname" 
                                   value="${user.nickname}" 
                                   required>
							<div class="form-text">10자 이내의 닉네임</div>
						</div>
						
						<div class="mb-3">
							<label for="userMajorInput" class="form-label">MAJOR or INTEREST</label>
							<input type="text" class="form-control" id="userMajorInput" 
                                   name="major" 
                                   value="${user.major}" 
                                   required>
						</div>
                        <div class="d-flex gap-2 mt-4">
						    <a href="/main" class="btn btn-secondary w-50">BACK</a>
						    <button type="submit" class="btn btn-dark w-50">SAVE CHANGES</button>
						</div>
                    </form>
                </div>
            </div>
        </div>
    </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" 
		crossorigin="anonymous"></script>
</body>
</html>
