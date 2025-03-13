<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.springmvc.beans.TtbNguoiDung" %>
<!DOCTYPE html>
<html>
<head>
    <title><%= request.getAttribute("action").equals("edit") ? "Chỉnh Sửa" : "Thêm Mới" %> Người Dùng</title>
</head>
<body>
    <h2><%= request.getAttribute("action").equals("edit") ? "Chỉnh Sửa" : "Thêm Mới" %> Người Dùng</h2>
    <form action="saveUser" method="post">
        <input type="hidden" name="id" value="<%= request.getAttribute("user") != null ? ((TtbNguoiDung) request.getAttribute("user")).getTtb_ma_nguoi_dung() : "" %>">
        
        <label>Họ Tên:</label>
        <input type="text" name="hoTen" value="<%= request.getAttribute("user") != null ? ((TtbNguoiDung) request.getAttribute("user")).getTtb_ho_ten() : "" %>" required><br>
        
        <label>Email:</label>
        <input type="email" name="email" value="<%= request.getAttribute("user") != null ? ((TtbNguoiDung) request.getAttribute("user")).getTtb_email() : "" %>" required><br>

        <label>Mật khẩu:</label>
        <input type="password" name="password" required><br>

        <label>Vai Trò:</label>
        <select name="vaiTro">
            <option value="1" <%= request.getAttribute("user") != null && ((TtbNguoiDung) request.getAttribute("user")).getTtb_vai_tro() == 1 ? "selected" : "" %>>Admin</option>
            <option value="0" <%= request.getAttribute("user") != null && ((TtbNguoiDung) request.getAttribute("user")).getTtb_vai_tro() == 0 ? "selected" : "" %>>User</option>
        </select><br>

        <button type="submit">Lưu</button>
    </form>
    <a href="nguoidung">Quay lại danh sách</a>
</body>
</html>
