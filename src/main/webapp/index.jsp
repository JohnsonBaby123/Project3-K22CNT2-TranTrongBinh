<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang Quản Lý Người Dùng</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            text-align: center;
        }
        .header {
            background: #007bff;
            color: white;
            padding: 15px;
            position: relative;
        }
        .auth-buttons {
            position: absolute;
            top: 15px;
            right: 20px;
        }
        .auth-buttons a {
            text-decoration: none;
            padding: 8px 12px;
            background: #28a745;
            color: white;
            border-radius: 5px;
            margin: 5px;
            display: inline-block;
        }
        .auth-buttons a.register {
            background: #ffc107;
            color: black;
        }
        .auth-buttons a:hover {
            opacity: 0.8;
        }
        .nav {
            margin: 15px;
        }
        .nav a {
            text-decoration: none;
            padding: 10px 15px;
            background: #17a2b8;
            color: white;
            border-radius: 5px;
            margin: 5px;
            display: inline-block;
        }
        .nav a:hover {
            background: #138496;
        }
        .content {
            margin: 20px;
        }
        .footer {
            background: #333;
            color: white;
            padding: 10px;
            position: absolute;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>

<div class="header">
    <h1>Hệ Thống Quản Lý Chung Cư An Bình</h1>
    <div class="auth-buttons">
        <a href="login.jsp">Đăng nhập</a>
    </div>
</div>

<div class="nav">
    <a href="nguoidung">Danh sách căn hộ</a>
    <a href="add">Danh sách cư dân</a>
    <a href="view/1">Các dịch vụ tiện ích</a>
    <a href="edit/1">Thông báo</a>
</div>

<div class="content">
    <%
        String message = "Chào mừng bạn đến với hệ thống!";
        out.print("<p>" + message + "</p>");
    %>
</div>

<div class="footer">
    <p>&copy; 2024 Hệ Thống Quản Lý Chung Cư An Bình</p>  
</div>

</body>
</html>
