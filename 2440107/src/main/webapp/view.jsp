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
    String author = "";
    String createdAt = "";

    try {
        String sql = "SELECT * FROM qna_board WHERE id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, id);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            title = rs.getString("title");
            content = rs.getString("content");
            author = rs.getString("author");
            createdAt = rs.getString("created_at");
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
<title>Q&A 게시글 상세보기</title>
<style>
    body {
        font-family: Arial, sans-serif;
    }
    .container {
        width: 80%;
        margin: auto;
        margin-top: 50px;
    }
    .button-container {
        text-align: center;
        margin-top: 20px;
    }
    .button-container a, .button-container form {
        display: inline-block;
        margin: 5px;
    }
    .button-container a, .button-container button {
        text-decoration: none;
        padding: 10px 20px;
        background-color: #007BFF;
        color: white;
        border-radius: 5px;
        border: none;
        cursor: pointer;
    }
    .button-container a:hover, .button-container button:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
    <div class="container">
        <h1><%= title %></h1>
        <p><b>작성자:</b> <%= author %></p>
        <p><b>작성일:</b> <%= createdAt %></p>
        <hr>
        <p><%= content %></p>
        <div class="button-container">
            <a href="edit.jsp?id=<%= id %>">글 수정하기</a>
            <form action="delete_process.jsp" method="post" style="display:inline;">
                <input type="hidden" name="id" value="<%= id %>">
                <button type="submit">글 삭제하기</button>
            </form>
            <a href="list.jsp">목록으로 돌아가기</a>
        </div>
    </div>
</body>
</html>
