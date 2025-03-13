<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.springmvc.beans.TtbNguoiDung" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thông Tin Người Dùng</title>
</head>
<body>
    <h2>Thông Tin Người Dùng</h2>
    <%
        TtbNguoiDung user = (TtbNguoiDung) request.getAttribute("user");
    %>
    <p><strong>ID:</strong> <%= user.getTtb_ma_nguoi_dung() %></p>
    <p><strong>Họ Tên:</strong> <%= user.getTtb_ho_ten() %></p>
    <p><strong>Email:</strong> <%= user.getTtb_email() %></p>
    <p><strong>Vai Trò:</strong> <%= user.getTtb_vai_tro() == 1 ? "Admin" : "User" %></p>
    <a href="nguoidung">Quay lại danh sách</a>
</body>
</html>
