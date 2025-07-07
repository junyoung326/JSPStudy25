<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="dto.UserDTO" %>

<%
    // 세션에서 user 꺼내기
    UserDTO user = (UserDTO) session.getAttribute("user");

    // user가 null이면 로그인 페이지로 이동
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>개인정보 수정</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    @font-face {
      font-family: 'SacheonHangGong-Regular';
      src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2506-1@1.0/SacheonHangGong-Regular.woff2') format('woff2');
      font-weight: normal;
      font-style: normal;
    }
    * {
      font-family: 'SacheonHangGong-Regular', sans-serif;
    }
  </style>
</head>
<body class="d-flex justify-content-center align-items-center vh-100 bg-light">
  <div class="w-100 p-4 bg-white rounded shadow" style="max-width: 500px;">
    <h3 class="text-center mb-4">개인정보 수정</h3>

    <form action="updateCheck.jsp" method="post">
      <!-- 아이디 (수정 불가) -->
      <div class="input-group mb-3">
        <span class="input-group-text">아이디</span>
        <input type="text" class="form-control" name="id" value="<%= user.getId() %>" readonly>
      </div>

      <!-- 이름 -->
      <div class="input-group mb-3">
        <span class="input-group-text">이름</span>
        <input type="text" class="form-control" name="name" value="<%= user.getName() %>">
      </div>

      <!-- 이메일 -->
      <div class="input-group mb-3">
        <span class="input-group-text">이메일</span>
        <input type="email" class="form-control" name="email" value="<%= user.getEmail() %>">
      </div>

      <!-- 전화번호 -->
      <div class="input-group mb-3">
        <span class="input-group-text">전화번호</span>
        <input type="tel" class="form-control" name="phone" value="<%= user.getPhone() %>">
      </div>

      <!-- 생년월일 -->
      <div class="input-group mb-3">
        <span class="input-group-text">생년월일</span>
        <input type="date" class="form-control" name="birth" value="<%= user.getBirth() %>">
      </div>

      <!-- 성별 -->
      <div class="mb-3">
        <label class="form-label">성별</label><br>
        <div class="form-check form-check-inline">
          <input class="form-check-input" type="radio" name="gender" value="남성" <%= "남성".equals(user.getGender()) ? "checked" : "" %>>
          <label class="form-check-label">남성</label>
        </div>
        <div class="form-check form-check-inline">
          <input class="form-check-input" type="radio" name="gender" value="여성" <%= "여성".equals(user.getGender()) ? "checked" : "" %>>
          <label class="form-check-label">여성</label>
        </div>
      </div>

      <!-- 저장 버튼 -->
      <button type="submit" class="btn btn-primary w-100">저장하기</button>
    </form>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
