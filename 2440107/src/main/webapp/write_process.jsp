<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconfig.jsp" %>
<%
    request.setCharacterEncoding("UTF-8");

    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String author = request.getParameter("author");

    Connection conn = (Connection) application.getAttribute("DBConnection");

    if (conn == null) {
        out.println("<h1>데이터베이스 연결 실패</h1>");
        return;
    }

    PreparedStatement pstmt = null;

    try {
        String sql = "INSERT INTO qna_board (title, content, author) VALUES (?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, title);
        pstmt.setString(2, content);
        pstmt.setString(3, author);

        int result = pstmt.executeUpdate();

        if (result > 0) {
            response.sendRedirect("list.jsp");
        } else {
            out.println("<h1>게시글 작성 실패</h1>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>오류 발생: " + e.getMessage() + "</p>");
    } finally {
        if (pstmt != null) pstmt.close();
    }
%>
