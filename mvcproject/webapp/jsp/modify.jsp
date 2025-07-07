<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

    body {
      font-family: 'SacheonHangGong-Regular', sans-serif;
    }
    </style>
</head>
<body class="d-flex justify-content-center align-items-center vh-100 bg-light">
  <div class="w-100 p-4 bg-white rounded shadow" style="max-width: 500px;">
    <h3 class="text-center mb-4">개인정보 수정</h3>

    <!-- 아이디 (수정 불가) -->
    <div class="input-group mb-3">
      <span class="input-group-text">아이디</span>
      <input type="text" class="form-control" placeholder="아이디 입력" value="" readonly>
    </div>

    <!-- 이름 -->
    <div class="input-group mb-3">
      <span class="input-group-text">이름</span>
      <input type="text" class="form-control" placeholder="이름 입력" value="">
    </div>

    <!-- 이메일 -->
    <div class="input-group mb-3">
      <span class="input-group-text">이메일</span>
      <input type="email" class="form-control" placeholder="이메일 입력" value="">
    </div>

    <!-- 휴대전화 -->
    <div class="input-group mb-3">
      <span class="input-group-text">전화번호</span>
      <input type="tel" class="form-control" placeholder="전화번호 입력"value="">
    </div>

    <!-- 생년월일 -->
    <div class="input-group mb-3">
      <span class="input-group-text">생년월일</span>
      <input type="date" class="form-control" placeholder="생년월일 입력"value="">
    </div>

    <!-- 성별 -->
    <div class="mb-3">
      <label class="form-label">성별</label><br>
      <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="gender" id="male" value="male" checked>
        <label class="form-check-label" for="male">남성</label>
      </div>
      <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="gender" id="female" value="female">
        <label class="form-check-label" for="female">여성</label>
      </div>
    </div>

    <!-- 비밀번호 변경 링크 -->
    <div class="mb-3 text-end">
      <a href="#" class="link-primary">비밀번호 변경</a>
    </div>

    <!-- 저장 버튼 -->
    <button class="btn btn-primary w-100">저장하기</button>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
