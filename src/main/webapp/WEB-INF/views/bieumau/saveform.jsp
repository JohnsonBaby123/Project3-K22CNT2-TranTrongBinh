<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.springmvc.beans.TtbNguoiDung" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= request.getAttribute("action").equals("edit") ? "Chỉnh Sửa" : "Thêm Mới" %> Người Dùng</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            text-align: center;
        }
        .container {
            width: 40%;
            margin: auto;
            background: white;
            padding: 20px;
            margin-top: 50px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h2 {
            color: #333;
        }
        .form-group {
            text-align: left;
            margin-bottom: 15px;
        }
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
            color: #333;
        }
        input, select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        .btn-container {
            margin-top: 20px;
            text-align: center;
        }
        .btn {
            text-decoration: none;
            padding: 10px 15px;
            background: #333;
            color: white;
            border-radius: 5px;
            margin: 5px;
            display: inline-block;
            transition: 0.3s;
            border: none;
            cursor: pointer;
        }
        .btn:hover {
            background: #000;
        }
        .btn-cancel {
            background: #777;
        }
        .btn-cancel:hover {
            background: #555;
        }
    </style>
</head>
<body>

<div class="container">
    <h2><%= request.getAttribute("action").equals("edit") ? "Chỉnh Sửa" : "Thêm Mới" %> Người Dùng</h2>
    <form action="${pageContext.request.contextPath}/saveUser" method="post">
        <input type="hidden" name="id" value="<%= request.getAttribute("user") != null ? ((TtbNguoiDung) request.getAttribute("user")).getTtb_ma_nguoi_dung() : "" %>">

        <div class="form-group">
            <label>Họ Tên:</label>
            <input type="text" name="hoTen" value="<%= request.getAttribute("user") != null ? ((TtbNguoiDung) request.getAttribute("user")).getTtb_ho_ten() : "" %>" required>
        </div>

        <div class="form-group">
            <label>Email:</label>
            <input type="email" name="email" value="<%= request.getAttribute("user") != null ? ((TtbNguoiDung) request.getAttribute("user")).getTtb_email() : "" %>" required>
        </div>

        <div class="form-group">
            <label>Mật khẩu:</label>
            <input type="password" name="password" required>
        </div>

        <div class="form-group">
            <label>Số Điện Thoại:</label>
            <input type="text" name="soDienThoai" value="<%= request.getAttribute("user") != null ? ((TtbNguoiDung) request.getAttribute("user")).getTtb_so_dien_thoai() : "" %>" required>
        </div>

        <div class="form-group">
            <label>Vai Trò:</label>
            <select name="vaiTro">
                <option value="1" <%= request.getAttribute("user") != null && ((TtbNguoiDung) request.getAttribute("user")).getTtb_vai_tro() == 1 ? "selected" : "" %>>Admin</option>
                <option value="0" <%= request.getAttribute("user") != null && ((TtbNguoiDung) request.getAttribute("user")).getTtb_vai_tro() == 0 ? "selected" : "" %>>User</option>
            </select>
        </div>

        <div class="btn-container">
            <button type="submit" class="btn">Lưu</button>
            <a href="${pageContext.request.contextPath}/nguoidung" class="btn btn-cancel">Hủy</a>
        </div>
    </form>
</div>
</body>
</html>
