<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconfig.jsp" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));

    Connection conn = (Connection) application.getAttribute("DBConnection");
    PreparedStatement pstmt = null;

    try {
        String sql = "DELETE FROM qna_board WHERE id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, id);

        int result = pstmt.executeUpdate();

        if (result > 0) {
            response.sendRedirect("list.jsp");
        } else {
            out.println("<h1>삭제 실패</h1>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>오류 발생: " + e.getMessage() + "</p>");
    } finally {
        if (pstmt != null) pstmt.close();
    }
%>
