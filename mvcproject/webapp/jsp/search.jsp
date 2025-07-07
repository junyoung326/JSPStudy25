<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<title>OTT 검색</title>
<link
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
  rel="stylesheet"
  crossorigin="anonymous"
/>
<style>
  #suggestions {
    position: absolute;
    z-index: 1000;
    width: 100%;
    max-height: 150px;
    overflow-y: auto;
    border: 1px solid #ced4da;
    border-top: none;
    background: white;
  }
  #suggestions div {
    padding: 8px 12px;
    cursor: pointer;
  }
  #suggestions div:hover {
    background-color: #e9ecef;
  }
  
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

  <div class="w-100 position-relative" style="max-width: 400px;">
    <h3 class="mb-4 text-center">OTT 검색</h3>
    <div class="input-group">
      <input
        type="text"
        id="ottSearchInput"
        class="form-control"
        placeholder="검색할 OTT를 입력하세요"
        aria-label="OTT 검색"
        autocomplete="off"
      />
      <button class="btn btn-primary" id="searchBtn" type="button">검색</button>
    </div>
    <div id="suggestions"></div>
  </div>

  <script>
    const ottList = [
    	"기생충",
        "오징어 게임",
        "킹덤",
        "미드나잇 인 파리",
        "어벤져스: 엔드게임",
        "브레이킹 배드",
        "셜록",
        "라라랜드",
        "인셉션",
        "왕좌의 게임",
        "기묘한 이야기",
        "인터스텔라",
        "트윈 픽스",
        "어둠 속의 댄서",
        "해리포터와 마법사의 돌",
        "셜록 홈즈",
        "빅뱅 이론",
        "스타워즈: 새로운 희망",
        "포레스트 검프"
    ];

    const input = document.getElementById('ottSearchInput');
    const suggestions = document.getElementById('suggestions');
    const searchBtn = document.getElementById('searchBtn');

    input.addEventListener('input', () => {
      const query = input.value.trim().toLowerCase();
      suggestions.innerHTML = '';
      if (!query) return;

      const matched = ottList.filter(ott => ott.toLowerCase().includes(query));
      if (matched.length === 0) return;

      matched.forEach(item => {
        const div = document.createElement('div');
        div.textContent = item;
        div.addEventListener('click', () => {
          input.value = item;
          suggestions.innerHTML = '';
        });
        suggestions.appendChild(div);
      });
    });

    document.addEventListener('click', (e) => {
      if (e.target !== input) {
        suggestions.innerHTML = '';
      }
    });

    searchBtn.addEventListener('click', () => {
      const query = input.value.trim();
      if (!query) {
        alert('검색어를 입력해주세요.');
        return;
      }
      alert(`검색어: ${query}`);
      // 여기에 실제 검색 처리 코드를 넣으세요.
    });
  </script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"
    crossorigin="anonymous"></script>
</body>
</html>
