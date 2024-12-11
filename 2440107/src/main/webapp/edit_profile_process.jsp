<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconfig.jsp" %>
<%
    String uid = (String) session.getAttribute("loggedInUser");
    if (uid == null) {
        response.sendRedirect("login.html");
        return;
    }

    String name = request.getParameter("name");
    String phone = request.getParameter("phone");
    String upw = request.getParameter("upw");

    Connection conn = (Connection) application.getAttribute("DBConnection");
    PreparedStatement pstmt = null;

    try {
        String sql = "UPDATE member1028 SET name = ?, phone = ?, upw = ? WHERE uid = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, name);
        pstmt.setString(2, phone);
        pstmt.setString(3, upw);
        pstmt.setString(4, uid);

        int result = pstmt.executeUpdate();

        if (result > 0) {
            out.println("<h1>회원정보가 성공적으로 수정되었습니다.</h1>");
            out.println("<a href='index.html'>홈으로 가기</a>");
        } else {
            out.println("<h1>회원정보 수정에 실패했습니다.</h1>");
            out.println("<a href='edit_profile.jsp'>다시 시도하기</a>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>오류 발생: " + e.getMessage() + "</p>");
    } finally {
        if (pstmt != null) pstmt.close();
    }
%>
