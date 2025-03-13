<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.springmvc.beans.TtbNguoiDung" %>
<!DOCTYPE html>
<html>
<head>
    <title>Trang Chủ</title>
</head>
<body>
    <h2>Chào mừng <%= ((TtbNguoiDung) session.getAttribute("user")).getTtb_ho_ten() %>!</h2>
    <a href="nguoidung">Quản lý người dùng</a> | <a href="logout">Đăng xuất</a>
</body>
</html>
