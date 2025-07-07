<%
    session.invalidate(); // 세션 초기화
    response.sendRedirect("main.jsp");
%>
