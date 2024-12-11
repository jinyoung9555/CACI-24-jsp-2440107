<%@ page import="java.sql.*" %>
<%@ include file="dbconfig.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");

    String uid = request.getParameter("uid");
    String upw = request.getParameter("upw");
    String name = request.getParameter("name");
    String phone = request.getParameter("phone");

    Connection conn = (Connection) application.getAttribute("DBConnection");

    if (conn == null) {
        out.println("<h1>데이터베이스 연결 실패</h1>");
        return;
    }

    PreparedStatement pstmt = null;

    try {
        String sql = "INSERT INTO member1028 (name, uid, upw, phone) VALUES (?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, name);
        pstmt.setString(2, uid);
        pstmt.setString(3, upw);
        pstmt.setString(4, phone);

        int result = pstmt.executeUpdate();

        if (result > 0) {
%>
            <!-- 회원가입 성공 메시지 -->
            <h1 style="color: green;">회원가입에 성공했습니다!</h1>
            <p>환영합니다, <strong><%= name %></strong>님!</p>
            <p>로그인 화면으로 이동합니다...</p>
            <!-- 3초 후 로그인 화면으로 리디렉션 -->
            <meta http-equiv="refresh" content="3;url=login.html">
<%
        } else {
%>
            <!-- 회원가입 실패 메시지 -->
            <h1 style="color: red;">회원가입 실패</h1>
            <p>다시 시도해주세요.</p>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>오류: " + e.getMessage() + "</p>");
    } finally {
        if (pstmt != null) pstmt.close();
    }
%>
