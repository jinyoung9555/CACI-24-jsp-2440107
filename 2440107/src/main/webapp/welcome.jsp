<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그인 성공</title>
<style>
   body {
      font-family: Arial, sans-serif;
      text-align: center;
      margin-top: 50px;
   }
</style>
<script>
   // 2초 후 index.html로 리다이렉트
   setTimeout(() => {
      window.location.href = 'index.html';
   }, 2000);
</script>
</head>
<body>
   <h1>로그인에 성공하셨습니다!</h1>
   <p>메인 화면으로 이동합니다...</p>
</body>
</html>
