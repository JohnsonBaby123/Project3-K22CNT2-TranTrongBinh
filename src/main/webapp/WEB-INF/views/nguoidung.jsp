<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List, com.springmvc.beans.TtbNguoiDung" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quản Lý Người Dùng</title>
    <style>
        /* Cài đặt cơ bản cho trang */
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 20px;
            color: #000000; /* Màu chữ đen */
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
        }
        
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }
        
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #dee2e6;
        }
        
        th {
            background-color: #e9ecef;
        }
        
        tr:hover {
            background-color: #f1f3f5;
        }
        
        a {
            text-decoration: none;
            color: #000000;
            font-weight: bold;
        }
        
        a:hover {
            color: #007bff;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Danh Sách Người Thuê</h2>
        <table>
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
                    <a href="${pageContext.request.contextPath}/edit/<%= user.getTtb_ma_nguoi_dung() %>">Sửa</a> |
                    <a href="${pageContext.request.contextPath}/delete/<%= user.getTtb_ma_nguoi_dung() %>">Xóa</a>
                </td>
            </tr>
            <% } %>
        </table>
    </div>
</body>
</html>
