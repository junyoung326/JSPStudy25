<%@ page import="dao.UserDAO" %>
<%@ page import="dto.UserDTO" %>
<%
    request.setCharacterEncoding("utf-8");

    UserDTO user = (UserDTO) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    UserDAO dao = new UserDAO();
    int result = dao.delete(user.getId());

    if (result > 0) {
        session.invalidate(); // 세션 종료
        out.println("<script>alert('회원 탈퇴가 완료되었습니다.'); location.href='main.jsp';</script>");
    } else {
        out.println("<script>alert('회원 탈퇴에 실패했습니다.'); history.back();</script>");
    }
%>
