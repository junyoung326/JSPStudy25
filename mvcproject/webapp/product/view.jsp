<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="mvc.model.ProductDTO" %>

<%
    ProductDTO product = (ProductDTO) request.getAttribute("product");
%>


<!DOCTYPE html>
<html lang="ko">
<head>

  <meta charset="UTF-8">
  <title>MBC OTT - 영화 상세보기</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    @font-face {
      font-family: 'SacheonHangGong-Regular';
      src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2506-1@1.0/SacheonHangGong-Regular.woff2') format('woff2');
    }
    * { font-family: 'SacheonHangGong-Regular', sans-serif; }
    .card img {
      max-width: 100%;
      height: auto;
    }
  </style>
</head>
<body>

<div class="container py-4">
  <div class="p-5 mb-4 bg-body-tertiary rounded-3">
    <div class="container-fluid py-5">
      <h1 class="display-5 fw-bold">영화 상세보기</h1>
      <p class="col-md-8 fs-4">Detail</p>
    </div>
  </div>

  <% if (product != null) { %>
  <div class="card mb-4">
    <div class="row g-0">
      <div class="col-md-4">
        <img src="<%= request.getContextPath() + "/img/" + product.getImage() %>" alt="<%= product.getTitle() %> 이미지" class="img-fluid rounded-start">
      </div>
      <div class="col-md-8">
        <div class="card-body">
          <h5 class="card-title"><%= product.getTitle() %></h5>
          <p class="card-text"><strong>출시연도:</strong> <%= product.getYear() %></p>
          <p class="card-text"><strong>조회수:</strong> <%= product.getView() %></p>
          <p class="card-text"><strong>상세정보:</strong> <%= product.getDetail() %></p>
          <p class="card-text"><strong>출연진:</strong> <%= product.getCast() %></p>
          <p class="card-text"><strong>순위:</strong> <%= product.getRank() %></p>
          <p class="card-text"><strong>크리에이터:</strong> <%= product.getCreator() %></p>
          <p class="card-text"><strong>관람등급:</strong> <%= product.getAge() %></p>
          <p class="card-text"><strong>장르:</strong> <%= product.getGenre() %></p>
        </div>
      </div>
    </div>
  </div>
  <% } else { %>
    <div class="alert alert-danger" role="alert">
      영화 정보를 불러올 수 없습니다.
    </div>
  <% } %>

  <footer class="pt-4 my-md-5 pt-md-5 border-top">
    <div class="row">
      <div class="col-12 col-md">
        <img class="mb-2" src="../img/mbclogo.png" alt="MBC 로고" width="60" height="25">
        <small class="d-block mb-3 text-muted">&copy; 2025</small>
      </div>
      <div class="col-6 col-md">
        <h5>문의</h5>
        <ul class="list-unstyled text-small">
          <li><a class="link-secondary text-decoration-none" href="#">고객 센터</a></li>
          <li><a class="link-secondary text-decoration-none" href="#">자주 묻는 질문</a></li>
          <li><a class="link-secondary text-decoration-none" href="#">문의하기</a></li>
        </ul>
      </div>
      <div class="col-6 col-md">
        <h5>계정</h5>
        <ul class="list-unstyled text-small">
          <li><a class="link-secondary text-decoration-none" href="update.jsp">개인정보 수정</a></li>
          <li><a class="link-secondary text-decoration-none" href="#">마이페이지</a></li>
          <li><a class="link-secondary text-decoration-none" href="#">구독 변경</a></li>
        </ul>
      </div>
      <div class="col-6 col-md">
        <h5>회사</h5>
        <ul class="list-unstyled text-small">
          <li><a class="link-secondary text-decoration-none" href="#">회사 정보</a></li>
          <li><a class="link-secondary text-decoration-none" href="#">입사 정보</a></li>
          <li><a class="link-secondary text-decoration-none" href="#">투자 정보</a></li>
        </ul>
      </div>
    </div>
  </footer>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
