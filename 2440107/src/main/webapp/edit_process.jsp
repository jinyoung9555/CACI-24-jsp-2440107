<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconfig.jsp" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    Connection conn = (Connection) application.getAttribute("DBConnection");
    PreparedStatement pstmt = null;

    try {
        String sql = "UPDATE qna_board SET title = ?, content = ? WHERE id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, title);
        pstmt.setString(2, content);
        pstmt.setInt(3, id);

        int result = pstmt.executeUpdate();

        if (result > 0) {
            response.sendRedirect("view.jsp?id=" + id);
        } else {
            out.println("<h1>수정 실패</h1>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>오류 발생: " + e.getMessage() + "</p>");
    } finally {
        if (pstmt != null) pstmt.close();
    }
%>
