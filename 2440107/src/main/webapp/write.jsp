<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 게시글 작성</title>
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
        <h1>Q&A 게시글 작성</h1>
        <form action="write_process.jsp" method="post">
            <input type="text" name="title" placeholder="제목" required>
            <textarea name="content" rows="10" placeholder="내용" required></textarea>
            <input type="text" name="author" placeholder="작성자" required>
            <button type="submit">게시글 작성</button>
        </form>
    </div>
</body>
</html>
