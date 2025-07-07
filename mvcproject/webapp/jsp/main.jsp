<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"
	session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ page import="dto.UserDTO"%>

<%
    UserDTO user = (UserDTO) session.getAttribute("user");
%> --%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>MBC OTT</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="style.css">
<style>
@font-face {
	font-family: 'SacheonHangGong-Regular';
	src:
		url('https://fastly.jsdelivr.net/gh/projectnoonnu/2506-1@1.0/SacheonHangGong-Regular.woff2')
		format('woff2');
}

* {
	font-family: 'SacheonHangGong-Regular', sans-serif;
}

body {
	font-family: 'SacheonHangGong-Regular', sans-serif;
}
</style>
</head>
<body>

	<div class="container py-3">
		<!-- 헤더 -->
		<header>
			<div
				class="d-flex flex-column flex-md-row align-items-center pb-3 mb-4 border-bottom">
				<a href="main.jsp"
					class="d-flex align-items-center link-body-emphasis text-decoration-none">
					<img class="me-2" src="../img/mbclogo.png" alt="MBC 로고" width="60"
					height="25"> <span class="fs-4"
					style="color: #0d6efd; font-weight: bold;">MBC OTT</span>
				</a>

				<nav class="d-inline-flex mt-2 mt-md-0 ms-md-auto">
					<a class="me-3 py-2 link-body-emphasis text-decoration-none"
						href="search.jsp">검색</a>

					<c:choose>
						<c:when test="${not empty user}">
							<span class="me-3 py-2">${user.name}님</span>
							<a class="me-3 py-2 link-body-emphasis text-decoration-none"
								href="/ProductListAction.do?pageNum=1">영화목록</a>
							<a class="me-3 py-2 link-body-emphasis text-decoration-none"
								href="logout.jsp">로그아웃</a>
							<a
								class="me-3 py-2 link-body-emphasis text-decoration-none text-danger"
								href="delete.jsp" onclick="return confirm('정말 회원 탈퇴하시겠습니까?');">회원탈퇴</a>

						</c:when>
						<c:otherwise>
							<a class="me-3 py-2 link-body-emphasis text-decoration-none"
								href="${pageContext.request.contextPath}/ProductListAction.do?pageNum=1">
								영화목록 </a>
							<a class="me-3 py-2 link-body-emphasis text-decoration-none"
								href="login.jsp"> 로그인 </a>
							<a class="me-3 py-2 link-body-emphasis text-decoration-none"
								href="register.jsp"> 회원가입 </a>
						</c:otherwise>
					</c:choose>

					<a class="py-2 link-body-emphasis text-decoration-none" href="#">설정</a>
				</nav>
			</div>

			<!-- 배너 -->
			<div class="pricing-header p-3 pb-md-4 mx-auto text-center">
				<img src="../img/OTT.jpg" alt="OTT 배너" class="img-fluid mb-4"
					width="100%" height="500">
				<h1 class="display-4 fw-normal text-body-emphasis">영화, TV 프로그램
					무제한 서비스</h1>
				<p class="fs-5 text-body-secondary">다양한 디바이스에서 시청하세요. 언제든지 해지하실
					수 있습니다.</p>
			</div>
		</header>

		<!-- 요금제 카드 -->
		<main>
			<div class="row row-cols-1 row-cols-md-3 mb-3 text-center">
				<div class="col">
					<div class="card mb-4 rounded-3 shadow-sm">
						<div class="card-header py-3">
							<h4 class="my-0 fw-normal">베이직</h4>
						</div>
						<div class="card-body">
							<h1 class="card-title pricing-card-title">
								0원<small class="text-body-secondary fw-light">/월</small>
							</h1>
							<ul class="list-unstyled mt-3 mb-4">
								<li>최대 2명까지 지원 가능</li>
								<li>3GB 저장공간 제공</li>
							</ul>
							<button type="button"
								class="w-100 btn btn-lg btn-outline-primary">구독</button>
						</div>
					</div>
				</div>

				<div class="col">
					<div class="card mb-4 rounded-3 shadow-sm">
						<div class="card-header py-3">
							<h4 class="my-0 fw-normal">스탠다드</h4>
						</div>
						<div class="card-body">
							<h1 class="card-title pricing-card-title">
								5,000원<small class="text-body-secondary fw-light">/월</small>
							</h1>
							<ul class="list-unstyled mt-3 mb-4">
								<li>최대 5명까지 지원 가능</li>
								<li>10GB 저장공간 제공</li>
							</ul>
							<button type="button" class="w-100 btn btn-lg btn-primary">구독</button>
						</div>
					</div>
				</div>

				<div class="col">
					<div class="card mb-4 rounded-3 shadow-sm border-primary">
						<div class="card-header py-3 text-bg-primary border-primary">
							<h4 class="my-0 fw-normal">프리미엄</h4>
						</div>
						<div class="card-body">
							<h1 class="card-title pricing-card-title">
								10,000원<small class="text-body-secondary fw-light">/월</small>
							</h1>
							<ul class="list-unstyled mt-3 mb-4">
								<li>최대 10명까지 지원 가능</li>
								<li>20GB 저장공간 제공</li>
							</ul>
							<button type="button" class="w-100 btn btn-lg btn-primary">구독</button>
						</div>
					</div>
				</div>
			</div>

			<!-- 요금제 테이블 -->
			<h2 class="display-6 text-center mb-4">요금제 비교</h2>
			<div class="table-responsive">
				<table class="table text-center">
					<thead>
						<tr>
							<th></th>
							<th>베이직</th>
							<th>스탠다드</th>
							<th>프리미엄</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row" class="text-start">동시 시청 가능</th>
							<td>✔</td>
							<td>✔</td>
							<td>✔</td>
						</tr>
						<tr>
							<th scope="row" class="text-start">광고 없음</th>
							<td></td>
							<td>✔</td>
							<td>✔</td>
						</tr>
						<tr>
							<th scope="row" class="text-start">오프라인 저장</th>
							<td>✔</td>
							<td>✔</td>
							<td>✔</td>
						</tr>
						<tr>
							<th scope="row" class="text-start">HD 화질 지원</th>
							<td></td>
							<td>✔</td>
							<td>✔</td>
						</tr>
						<tr>
							<th scope="row" class="text-start">다국어 자막 지원</th>
							<td></td>
							<td>✔</td>
							<td>✔</td>
						</tr>
						<tr>
							<th scope="row" class="text-start">자녀 보호 기능</th>
							<td></td>
							<td></td>
							<td>✔</td>
						</tr>
					</tbody>
				</table>
			</div>
		</main>

		<!-- 푸터 -->
		<footer class="pt-4 my-md-5 pt-md-5 border-top">
			<div class="row">
				<div class="col-12 col-md">
					<img class="mb-2" src="../img/mbclogo.png" alt="" width="60"
						height="25"> <small class="d-block mb-3 text-muted">&copy;
						2025</small>
				</div>
				<div class="col-6 col-md">
					<h5>문의</h5>
					<ul class="list-unstyled text-small">
						<li class="nav-item"><a
							href="<c:url value ='/BoardListAction.do?pageNum=1'/>"
							class="link-secondary text-decoration-none">고객 센터</a></li>
						<li><a class="link-secondary text-decoration-none" href="#">자주
								묻는 질문</a></li>
						<li><a class="link-secondary text-decoration-none" href="#">문의하기</a></li>
					</ul>
				</div>
				<div class="col-6 col-md">
					<h5>계정</h5>
					<ul class="list-unstyled text-small">
						<li><a class="link-secondary text-decoration-none"
							href="update.jsp">개인정보 수정</a></li>
						<li><a class="link-secondary text-decoration-none" href="#">마이페이지</a></li>
						<li><a class="link-secondary text-decoration-none" href="#">구독
								변경</a></li>
					</ul>
				</div>
				<div class="col-6 col-md">
					<h5>회사</h5>
					<ul class="list-unstyled text-small">
						<li><a class="link-secondary text-decoration-none" href="#">회사
								정보</a></li>
						<li><a class="link-secondary text-decoration-none" href="#">입사
								정보</a></li>
						<li><a class="link-secondary text-decoration-none" href="#">투자
								정보</a></li>
					</ul>
				</div>
			</div>
		</footer>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
