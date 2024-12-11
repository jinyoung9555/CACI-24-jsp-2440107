<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconfig.jsp" %>
<%
    request.setCharacterEncoding("UTF-8");

    String uid = request.getParameter("uid");
    String upw = request.getParameter("upw");

    Connection conn = (Connection) application.getAttribute("DBConnection");

    if (conn == null) {
        out.println("<h1>데이터베이스 연결 실패</h1>");
        return;
    }

    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        String sql = "SELECT * FROM member1028 WHERE uid = ? AND upw = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, uid);
        pstmt.setString(2, upw);

        rs = pstmt.executeQuery();

        if (rs.next()) {
            // 로그인 성공 시 세션에 사용자 정보 저장
            session.setAttribute("user", uid);
            response.sendRedirect("welcome.jsp"); // 성공 화면으로 이동
        } else {
            // 로그인 실패
            out.println("<h1>로그인 실패</h1>");
            out.println("<p>아이디와 비밀번호를 다시 확인해주세요.</p>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>오류 발생: " + e.getMessage() + "</p>");
    } finally {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
    }
%>
