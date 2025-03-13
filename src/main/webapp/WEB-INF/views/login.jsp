<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng Nhập</title>
</head>
<body>
    <h2>Đăng Nhập</h2>
    <% if (request.getAttribute("error") != null) { %>
        <p style="color: red;"><%= request.getAttribute("error") %></p>
    <% } %>
    <form action="login" method="post">
        <label>Email:</label>
        <input type="text" name="email" required><br>
        <label>Mật khẩu:</label>
        <input type="password" name="password" required><br>
        <button type="submit">Đăng nhập</button>
    </form>
</body>
</html>
