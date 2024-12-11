<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconfig.jsp" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));

    Connection conn = (Connection) application.getAttribute("DBConnection");
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String title = "";
    String content = "";

    try {
        String sql = "SELECT * FROM qna_board WHERE id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, id);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            title = rs.getString("title");
            content = rs.getString("content");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정하기</title>
<style>
    body {
        font-family: Arial, sans-serif;
    }
    .container {
        width: 80%;
        margin: auto;
        margin-top: 50px;
    }
    input, textarea, button {
        display: block;
        width: 100%;
        margin-bottom: 10px;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    button {
        background-color: #007BFF;
        color: white;
        border: none;
        cursor: pointer;
    }
    button:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>글 수정하기</h1>
        <form action="edit_process.jsp" method="post">
            <input type="hidden" name="id" value="<%= id %>">
            <input type="text" name="title" value="<%= title %>" required>
            <textarea name="content" rows="10" required><%= content %></textarea>
            <button type="submit">수정 완료</button>
        </form>
    </div>
</body>
</html>
