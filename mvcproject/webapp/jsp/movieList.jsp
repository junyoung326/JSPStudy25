<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.MovieDAO" %>
<%@ page import="dto.MovieDTO" %>
<%
    MovieDAO dao = new MovieDAO();
    List<MovieDTO> movies = dao.getAllMovies();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>영화 목록</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
  <div class="container py-5">
    <h2 class="mb-4">영화 목록</h2>
    <div class="row row-cols-1 row-cols-md-3 g-4">
      <% for (MovieDTO movie : movies) { %>
        <div class="col">
          <div class="card h-100">
            <img src="<%= movie.getImagePath() %>" class="card-img-top" alt="<%= movie.getTitle() %>" style="height: 300px; object-fit: cover;">
            <div class="card-body">
              <h5 class="card-title"><%= movie.getTitle() %></h5>
              <p class="card-text"><%= movie.getDescription() %></p>
            </div>
            <div class="card-footer d-flex justify-content-between flex-wrap gap-1">
              <a href="movieDetail.jsp?id=<%= movie.getId() %>" class="btn btn-sm btn-outline-secondary">상세보기</a>
              <a href="buyMovie.jsp?id=<%= movie.getId() %>" class="btn btn-sm btn-outline-success">소장하기</a>
              <a href="watchMovie.jsp?id=<%= movie.getId() %>" class="btn btn-sm btn-outline-primary">바로시청</a>
              <a href="cart.jsp?action=add&id=<%= movie.getId() %>" class="btn btn-sm btn-outline-warning">장바구니</a>
            </div>
          </div>
        </div>
      <% } %>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
