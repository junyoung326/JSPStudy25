<%@ page import="dao.UserDAO" %>
<%@ page import="dto.UserDTO" %>
<%
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");

    UserDAO dao = new UserDAO();
    UserDTO user = dao.login(id, pw);

    if (user != null) {
        session.setAttribute("user", user); // ✔ 세션에 저장
        response.sendRedirect("main.jsp");
    } else {
%>
    <script>
        alert('로그인 실패: 아이디 또는 비밀번호를 확인하세요');
        history.back();
    </script>
<%
    }
%>
