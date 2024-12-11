<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconfig.jsp" %>
<%
    // 로그인된 사용자 아이디 가져오기
    String uid = (String) session.getAttribute("loggedInUser"); // 세션에서 로그인 사용자 아이디 확인
    if (uid == null) {
        response.sendRedirect("login.html"); // 로그인 안 된 상태면 로그인 페이지로 리다이렉트
        return;
    }

    Connection conn = (Connection) application.getAttribute("DBConnection");
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String name = "";
    String phone = "";

    try {
        String sql = "SELECT * FROM member1028 WHERE uid = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, uid);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            name = rs.getString("name");
            phone = rs.getString("phone");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보 수정</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        label {
            font-size: 0.9rem;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="password"] {
            padding: 10px;
            font-size: 1rem;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 15px;
            font-size: 1rem;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        .home-link {
            text-align: center;
            margin-top: 20px;
        }

        .home-link a {
            color: #007bff;
            text-decoration: none;
        }

        .home-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>회원정보 수정</h1>
        <form action="edit_profile_process.jsp" method="post">
            <label for="name">이름</label>
            <input type="text" id="name" name="name" value="<%= name %>" required>

            <label for="phone">전화번호</label>
            <input type="text" id="phone" name="phone" value="<%= phone %>" required>

            <label for="upw">새 비밀번호</label>
            <input type="password" id="upw" name="upw" placeholder="새 비밀번호를 입력하세요" required>

            <button type="submit">수정 완료</button>
        </form>

        <div class="home-link">
            <a href="index.html">홈으로 가기</a>
        </div>
    </div>
</body>
</html>
