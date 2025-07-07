<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.ProductDTO"%>
<%@ page import="java.net.URLEncoder"%>

<%
List<ProductDTO> ProductList = (List<ProductDTO>) request.getAttribute("Productlist");
if (ProductList == null) ProductList = new ArrayList<>();

int total_record = (request.getAttribute("total_record") != null)
		? ((Integer) request.getAttribute("total_record")).intValue()
		: 0;
int pageNum = (request.getAttribute("pageNum") != null) 
		? ((Integer) request.getAttribute("pageNum")).intValue()
		: 1;
int total_page = (request.getAttribute("total_page") != null)
		? ((Integer) request.getAttribute("total_page")).intValue()
		: 1;

String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>MBC OTT - 영화목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<body>
<div class="container py-4">

	<div class="p-5 mb-4 bg-body-tertiary rounded-3">
		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold">영화목록</h1>
			<p class="col-md-8 fs-4">List</p>
		</div>
	</div>

	<div class="row row-cols-1 row-cols-md-4 g-4 text-center">
		<%
		for (ProductDTO product : ProductList) {
			String imageFile = product.getImage(); // 예: 인셉션.jpg
			String imagePath = contextPath + "/img/" + imageFile;
			String encodedTitle = URLEncoder.encode(product.getTitle(), "UTF-8");
		%>
		<div class="col">
			<div class="card h-100">
				<img src="<%=imagePath%>" class="card-img-top" alt="<%=product.getTitle()%>"
					style="height: 250px; object-fit: cover;">
				<div class="card-body">
					<h5 class="card-title"><%=product.getTitle()%></h5>
					<p class="card-text">출연: <%=product.getCast()%></p>
					<a href="<%=contextPath%>/ProductViewAction.do?p_title=<%=encodedTitle%>" class="btn btn-primary btn-sm mt-3">
						상세보기
					</a>
				</div>
			</div>
		</div>
		<% } %>
	</div>

	<!-- 페이지네이션 -->
	<div class="mt-4 text-center">
		<c:set var="pageNum" value="<%=pageNum%>" />
		<c:forEach var="i" begin="1" end="${total_page}">
			<a href="<c:url value='/ProductListAction.do?pageNum=${i}' />">
				<c:choose>
					<c:when test="${i == pageNum}">
						<font color='4C5317'><b>[${i}]</b></font>
					</c:when>
					<c:otherwise>
						<font color='4C5317'>[${i}]</font>
					</c:otherwise>
				</c:choose>
			</a>
		</c:forEach>
	</div>

	<!-- 푸터 -->
	<footer class="pt-4 my-md-5 pt-md-5 border-top">
		<div class="row">
			<div class="col-12 col-md">
				<img class="mb-2" src="<%=contextPath%>/img/mbclogo.png" alt="mbclogo" width="60" height="25"> 
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
