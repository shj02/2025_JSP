<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>

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
        cursor: url("/image/cursor_black.png") 4 4, auto;
    }

    .main-container {
        background-color: #ffffff;
        padding: 40px 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        min-height: 100vh; /* 흰배경 위아래 꽉차게 */
    }
</style>
</head>
<body>
    <div class="container-fluid">
        <div class="row justify-content-center" style="min-height: 100vh;">

            <div class="col-12 col-lg-10 col-xl-9">
                <div class="main-container">
                    <div class="row gx-0">
                        <div class="col-md-2 border-end px-0">
                            <jsp:include page="profile.jsp" />
                        </div>

                        <div class="col-md-6 px-0">
                            <jsp:include page="centerPanel.jsp" />
                        </div>

                        <div class="col-md-4 border-start px-0">
                            <jsp:include page="rightPanel.jsp" />
                        </div>
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
