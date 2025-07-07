<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="auto">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>로그인</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        @font-face {
            font-family: 'SacheonHangGong-Regular';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2506-1@1.0/SacheonHangGong-Regular.woff2') format('woff2');
        }
        * {
            font-family: 'SacheonHangGong-Regular', sans-serif;
        }
    </style>
</head>
<body class="d-flex align-items-center justify-content-center py-4 bg-body-tertiary">

<main class="form-signin m-auto" style="max-width: 330px; width: 100%;">
    <form action="loginCheck.jsp" method="post">
        <img class="mb-4" src="../img/OTT.jpg" alt="" width="325" height="200">
        <h1 class="h3 mb-3 fw-normal">로그인</h1>

        <div class="form-floating">
            <input type="text" class="form-control" name="id" id="floatingInput"
                   placeholder="아이디" required>
            <label for="floatingInput">아이디</label>
        </div>
        <div class="form-floating">
            <input type="password" class="form-control" name="pw" id="floatingPassword"
                   placeholder="비밀번호" required>
            <label for="floatingPassword">비밀번호</label>
        </div>

        <div class="form-check text-start my-3">
            <input class="form-check-input" type="checkbox" value="remember-me" id="checkDefault">
            <label class="form-check-label" for="checkDefault">로그인 정보 저장</label>
        </div>

        <!-- 로그인 실패 메시지 출력 -->
        <c:if test="${not empty param.error}">
            <div class="alert alert-danger">❌ 아이디 또는 비밀번호가 잘못되었습니다.</div>
        </c:if>

        <button class="btn btn-primary w-100 py-2" type="submit">로그인</button>
        <p class="mt-5 mb-3 text-body-secondary">&copy; 2025</p>
    </form>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>