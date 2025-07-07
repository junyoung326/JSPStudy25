<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원가입</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    @font-face {
      font-family: 'SacheonHangGong-Regular';
      src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2506-1@1.0/SacheonHangGong-Regular.woff2') format('woff2');
    }

    * {
      font-family: 'SacheonHangGong-Regular', sans-serif;
    }

    body {
      font-family: 'SacheonHangGong-Regular', sans-serif;
    }
  </style>
</head>
<body class="d-flex justify-content-center align-items-center vh-100 bg-light">
  <div class="w-100 p-4 bg-white rounded shadow" style="max-width: 500px;">
    <h2 class="mb-4 text-center">회원가입</h2>

    <form id="registerForm" method="post" action="registerCheck.jsp">

      <!-- 아이디 -->
      <div class="mb-3">
        <label for="userId" class="form-label">아이디</label>
        <input type="text" class="form-control" id="userId" name="id" required placeholder="아이디 입력">
      </div>

      <!-- 비밀번호 -->
      <div class="mb-3">
        <label for="password" class="form-label">비밀번호</label>
        <input type="password" class="form-control" id="password" name="pw" required placeholder="비밀번호 입력">
      </div>

      <!-- 비밀번호 재확인 -->
      <div class="mb-3">
        <label for="confirmPassword" class="form-label">비밀번호 재확인</label>
        <input type="password" class="form-control" id="confirmPassword" required placeholder="비밀번호 재입력">
      </div>

      <!-- 이름 -->
      <div class="mb-3">
        <label for="fullName" class="form-label">이름</label>
        <input type="text" class="form-control" id="fullName" name="name" required placeholder="이름 입력">
      </div>

      <!-- 생년월일 -->
      <div class="mb-3">
        <label for="birthDate" class="form-label">생년월일</label>
        <input type="date" class="form-control" id="birthDate" name="birth" required>
      </div>

      <!-- 성별 -->
      <div class="mb-3">
        <label class="form-label">성별</label>
        <div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="gender" id="male" value="남성" required>
            <label class="form-check-label" for="male">남성</label>
          </div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="gender" id="female" value="여성">
            <label class="form-check-label" for="female">여성</label>
          </div>
        </div>
      </div>

      <!-- 이메일 -->
      <div class="mb-3">
        <label for="email" class="form-label">이메일</label>
        <input type="email" class="form-control" id="email" name="email" required placeholder="example@email.com">
      </div>

      <!-- 휴대전화 -->
      <div class="mb-3">
        <label for="phone" class="form-label">휴대전화</label>
        <input type="tel" class="form-control" id="phone" name="phone" required placeholder="010-0000-0000">
      </div>

      <!-- 제출 버튼 -->
      <button id="submitBtn" type="submit" class="btn btn-primary w-100">회원가입</button>
    </form>
  </div>

  <script>
    document.getElementById('registerForm').addEventListener('submit', function(event) {
      const password = document.getElementById('password').value;
      const confirmPassword = document.getElementById('confirmPassword').value;

      const hasUppercase = /[A-Z]/.test(password);
      const hasSpecialChar = /[!@#$%^&*(),.?":{}|<>]/.test(password);

      if (!hasUppercase) {
        alert('비밀번호에는 대문자 하나 이상이 포함되어야 합니다.');
        event.preventDefault();
        return;
      }

      if (!hasSpecialChar) {
        alert('비밀번호에는 특수기호가 하나 이상 포함되어야 합니다.');
        event.preventDefault();
        return;
      }

      if (password !== confirmPassword) {
        alert('비밀번호와 비밀번호 재확인이 일치하지 않습니다.');
        event.preventDefault();
        return;
      }
    });
  </script>
</body>
</html>
