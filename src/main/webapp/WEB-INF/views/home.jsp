<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.springmvc.beans.TtbNguoiDung" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hệ Thống Quản Lý Chung Cư An Bình</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            text-align: center;
            background-color: #f4f4f4;
        }
        .header {
            background: #007bff;
            color: white;
            padding: 15px;
            position: relative;
        }
        .auth {
            position: absolute;
            top: 15px;
            right: 20px;
        }
        .auth a {
            text-decoration: none;
            padding: 8px 12px;
            background: #dc3545;
            color: white;
            border-radius: 5px;
            margin-left: 5px;
            display: inline-block;
        }
        .auth a:hover {
            opacity: 0.8;
        }
        .nav {
            background: #17a2b8;
            padding: 10px;
            margin: 0;
        }
        .nav a {
            text-decoration: none;
            padding: 10px 15px;
            background: #17a2b8;
            color: white;
            border-radius: 5px;
            margin: 5px;
            display: inline-block;
            transition: background 0.3s;
        }
        .nav a:hover {
            background: #138496;
        }
        .content {
            margin: 20px;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            min-height: 200px;
        }
        .footer {
            background: #333;
            color: white;
            padding: 10px;
            text-align: center;
            position: relative;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Hệ Thống Quản Lý Chung Cư An Bình</h1>
        <div class="auth">
            <% 
                com.springmvc.beans.TtbNguoiDung user = (com.springmvc.beans.TtbNguoiDung) session.getAttribute("user");
                String username = (user != null) ? user.getTtb_ho_ten() : "Khách";
            %>
            <span>Xin chào, <strong><%= username %></strong></span>
            <a href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
        </div>
    </div>

    <div class="nav">
        <a href="${pageContext.request.contextPath}/nguoidung">Danh Sách Người Thuê</a>
        <a href="${pageContext.request.contextPath}/cudan">Danh sách cư dân</a>
        <a href="${pageContext.request.contextPath}/canho">Danh sách căn hộ</a>
        <a href="${pageContext.request.contextPath}/tienich">Các dịch vụ tiện ích</a>
        <a href="${pageContext.request.contextPath}/thongbao">Thông báo</a>
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
