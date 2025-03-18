<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng ký người dùng</title>
    <style>
        body { font-family: Arial, sans-serif; }
        form { width: 300px; margin: auto; }
        label { display: block; margin-top: 10px; }
        input, select { width: 100%; padding: 8px; margin-top: 5px; }
        button { margin-top: 15px; width: 100%; padding: 10px; }
    </style>
</head>
<body>
    <h2 style="text-align:center;">Đăng ký người dùng</h2>
    <form action="${pageContext.request.contextPath}/dangky" method="post">
        <label for="hoTen">Họ và tên:</label>
        <input type="text" id="hoTen" name="hoTen" required />
        
        <label for="soDienThoai">Số điện thoại:</label>
        <input type="text" id="soDienThoai" name="soDienThoai" required />
        
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required />
        
        <label for="matKhau">Mật khẩu:</label>
        <input type="password" id="matKhau" name="matKhau" required />
        
        <label for="vaiTro">Vai trò:</label>
        <select id="vaiTro" name="vaiTro" required>
            <option value="1">Ban quản lý</option>
            <option value="2">Cư dân</option>
        </select>
        
        <button type="submit">Đăng ký</button>
    </form>
    <p style="text-align:center;">Nếu bạn đã có tài khoản, vui lòng <a href="${pageContext.request.contextPath}/login">đăng nhập</a>.</p>
</body>
</html>
