<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List, com.springmvc.beans.TtbNguoiDung" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quản Lý Người Dùng</title>
</head>
<body>
    <h2>Danh Sách Người Dùng</h2>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Họ Tên</th>
            <th>Email</th>
            <th>Vai Trò</th>
            <th>Hành Động</th>
        </tr>
        <%
            List<TtbNguoiDung> users = (List<TtbNguoiDung>) request.getAttribute("nguoiDungs");
            for (TtbNguoiDung user : users) {
        %>
        <tr>
            <td><%= user.getTtb_ma_nguoi_dung() %></td>
            <td><%= user.getTtb_ho_ten() %></td>
            <td><%= user.getTtb_email() %></td>
            <td><%= user.getTtb_vai_tro() == 1 ? "Admin" : "User" %></td>
            <td>
                <a href="edit/<%= user.getTtb_ma_nguoi_dung() %>">Sửa</a> | 
                <a href="delete/<%= user.getTtb_ma_nguoi_dung() %>">Xóa</a>
            </td>
        </tr>
        <% } %>
    </table>
</body>
</html>
