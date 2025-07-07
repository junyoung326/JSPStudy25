<%@ page import="dao.UserDAO"%>
<%@ page import="dto.UserDTO"%>
<%
try {
    request.setCharacterEncoding("UTF-8");

    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String birth = request.getParameter("birth");
    String gender = request.getParameter("gender");
    String phone = request.getParameter("phone");

    UserDAO dao = new UserDAO();

    // 기존 회원 정보 불러와서 pw 유지
    UserDTO original = dao.getUser(id);
    String pw = original.getPw();

    UserDTO user = new UserDTO();
    user.setId(id);
    user.setPw(pw);
    user.setName(name);
    user.setEmail(email);
    user.setBirth(birth);
    user.setGender(gender);
    user.setPhone(phone);

    int result = dao.update(user);

    if (result > 0) {
        out.println("<script>alert('정보 수정 완료'); location.href='main.jsp';</script>");
    } else {
        out.println("<script>alert('수정 실패'); history.back();</script>");
    }

} catch (Exception e) {
    e.printStackTrace();
    out.println("<script>alert('오류 발생'); history.back();</script>");
}
%>

