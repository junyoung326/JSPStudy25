<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dao.UserDAO, dto.UserDTO" %>
<%
    request.setCharacterEncoding("UTF-8");

    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String name = request.getParameter("name");
    String birth = request.getParameter("birth");
    String gender = request.getParameter("gender");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");

    UserDTO user = new UserDTO();
    user.setId(id);
    user.setPw(pw);
    user.setName(name);
    user.setBirth(birth);
    user.setGender(gender);
    user.setEmail(email);
    user.setPhone(phone);

    UserDAO dao = new UserDAO();
    int result = dao.register(user);

    if (result > 0) {
        out.println("<script>alert('회원가입이 완료되었습니다!'); location.href='login.jsp';</script>");
    } else {
        out.println("<script>alert('회원가입에 실패했습니다.'); history.back();</script>");
    }
%>
