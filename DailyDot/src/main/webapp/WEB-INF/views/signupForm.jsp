<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp</title>
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
	    background-color: white;
	    padding: 40px;
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
</style>
</head>
<script>
	function validateForm() {
		const pw = document.getElementById('passwordInput').value;
		const pwCheck = document.getElementById('passwordCheckInput').value;
		
		if (pw !== pwCheck) {
			alert('비밀번호가 일치하지 않습니다!');
			document.getElementById('passwordCheckInput').focus();
			return false;
		}
		return true;
	}
</script>
<body class="${season }">
	<div class="container-fluid"> 
        <div class="row justify-content-center"> 
             <div class="col-12 col-lg-10 col-xl-9"> 
                <div class="login-container">
                    
                    <h2 class="text-center mb-5">DailyDot SignUp</h2>
                    
                    <form action="/user/join" method="post" onsubmit="return validateForm()" style="width: 600px; margin: 0 auto;">
                        
                        <div class="mb-3">
							<label for="userIdInput" class="form-label">ID</label>
							<input type="text" class="form-control" id="userIdInput" name="userId" placeholder="dailyDot" required> 
						</div>
						
						<div class="mb-3">
							<label for="userNameInput" class="form-label">NAME</label>
							<input type="text" class="form-control" id="userNameInput" name="name" placeholder="홍길동" required> 
						</div>
						
						<div class="mb-3">
							<label for="userNicknameInput" class="form-label">NICKNAME</label>
							<input type="text" class="form-control" id="userNicknameInput" name="nickname" placeholder="DOT" required>
							<div class="form-text">10자 이내의 닉네임을 적어주세요!</div>
						</div>
						
						<div class="mb-3">
							<label for="userMajorInput" class="form-label">MAJOR or INTEREST</label>
							<input type="text" class="form-control" id="userMajorInput" name="major" placeholder="컴퓨터정보공학과" required>
							<div class="form-text">전공 또는 관심 분야를 적어주세요!</div>
						</div>
                        
						<div class="mb-3">
                            <label for="passwordInput" class="form-label">PASSWORD</label>
                            <input type="password" id="passwordInput" name="password" class="form-control" required>
						</div>
						
						<div class="mb-3">
                            <label for="passwordCheckInput" class="form-label">CHECK PASSWORD</label>
                            <input type="password" id="passwordCheckInput" name="checkPassword" class="form-control" required>
						</div>
                        
                        <button type="submit" class="btn btn-dark w-100 mt-4">CREATE ACCOUNT</button>
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
