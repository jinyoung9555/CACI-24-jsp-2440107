<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconfig.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 게시판</title>
<style>
    body {
        font-family: Arial, sans-serif;
    }
    table {
        width: 80%;
        margin: auto;
        border-collapse: collapse;
        margin-top: 50px;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: center;
    }
    th {
        background-color: #f4f4f4;
    }
    a {
        text-decoration: none;
        color: #007BFF;
    }
    a:hover {
        text-decoration: underline;
    }
    .view-button {
        text-decoration: none;
        padding: 5px 10px;
        background-color: #007BFF;
        color: white;
        border-radius: 5px;
        font-size: 0.9rem;
    }
    .view-button:hover {
        background-color: #0056b3;
    }
    .button-container {
        text-align: center;
        margin-top: 20px;
    }
    .button-container a {
        text-decoration: none;
        padding: 10px 20px;
        background-color: #007BFF;
        color: white;
        border-radius: 5px;
        margin: 5px;
    }
    .button-container a:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
    <h1 style="text-align: center;">Q&A 게시판</h1>
    <table>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>수정 및 삭제</th>
        </tr>
        <% 
            Connection conn = (Connection) application.getAttribute("DBConnection");
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                String sql = "SELECT * FROM qna_board ORDER BY created_at DESC";
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();

                while (rs.next()) {
                    int id = rs.getInt("id");
                    String title = rs.getString("title");
                    String author = rs.getString("author");
                    String createdAt = rs.getString("created_at");
        %>
        <tr>
            <td><%= id %></td>
            <td><%= title %></td>
            <td><%= author %></td>
            <td><%= createdAt %></td>
            <td>
                <a href="view.jsp?id=<%= id %>" class="view-button">수정 및 삭제</a>
            </td>
        </tr>
        <% 
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
            }
        %>
    </table>
    <div class="button-container">
        <a href="write.jsp">게시글 작성하기</a>
        <a href="index.html">홈으로 가기</a>
    </div>
</body>
</html>
