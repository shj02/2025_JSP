<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
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
<body>
	<div class="container-fluid"> 
        <div class="row justify-content-center"> 
             <div class="col-md-8"> 
                <div class="login-container">
                    
                    <h2 class="text-center mb-5">Welcome to DailyDot!</h2>
                    
                    <form action="/user/loginProcess" method="post">
                        
                        <div class="mb-3">
							<label for="userIdInput" class="form-label">ID</label>
							<input type="text" class="form-control" id="userIdInput" name="userId" placeholder="dailyDot" required> 
						</div>
                        
						<div class="mb-3">
                            <label for="passwordInput" class="form-label">PASSWORD</label>
                            <input type="password" id="passwordInput" name="password" class="form-control" required>
						</div>
                        
                        <button type="submit" class="btn btn-dark w-100 mt-4">LOGIN</button>
                    </form>
                    <div class="text-center mt-4">
                        <a href="/user/signup">JOIN</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" 
		crossorigin="anonymous"></script>
</body>
</html>
