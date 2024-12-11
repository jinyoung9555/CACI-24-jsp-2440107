<%@ page import="java.sql.*" %>
<%
    // 데이터베이스 접속 정보
    String dbURL = "jdbc:mysql://localhost:3306/jsp?useUnicode=true&characterEncoding=UTF-8";
    String dbUser = "root";  // 사용자 이름
    String dbPassword = "tiger123";  // 비밀번호

    try {
        // MySQL 드라이버 로드
        Class.forName("com.mysql.cj.jdbc.Driver");

        // 데이터베이스 연결
        Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        // 연결 객체를 애플리케이션에 저장
        application.setAttribute("DBConnection", conn);
    } catch (Exception e) {
        e.printStackTrace();
        out.println("데이터베이스 연결 실패: " + e.getMessage());
    }
%>
