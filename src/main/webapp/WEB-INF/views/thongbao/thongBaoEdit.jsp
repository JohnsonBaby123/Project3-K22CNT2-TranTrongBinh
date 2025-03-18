<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chỉnh Sửa Thông Báo</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            width: 50%;
            margin: auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"], textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        textarea {
            resize: vertical;
        }
        .btn-group {
            text-align: center;
            margin-top: 20px;
        }
        .btn {
            padding: 10px 15px;
            background: #333;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            margin-right: 10px;
        }
        .btn:hover {
            background: #000;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Chỉnh Sửa Thông Báo</h2>
    <form action="${pageContext.request.contextPath}/thongbao/save" method="post">
        <input type="hidden" name="ttb_ma_thong_bao" value="${thongbao.ttb_ma_thong_bao}" />
        <div class="form-group">
            <label>Tiêu Đề:</label>
            <input type="text" name="ttb_tieu_de" value="${thongbao.ttb_tieu_de}" required />
        </div>
        <div class="form-group">
            <label>Nội Dung:</label>
            <textarea name="ttb_noi_dung" rows="5" required>${thongbao.ttb_noi_dung}</textarea>
        </div>
        <div class="form-group">
            <label>Người Đăng (ID):</label>
            <input type="text" name="ttb_nguoi_dang" value="${thongbao.ttb_nguoi_dang}" required />
        </div>
        <div class="btn-group">
            <button type="submit" class="btn">Lưu</button>
            <a href="${pageContext.request.contextPath}/thongbao" class="btn">Hủy</a>
        </div>
    </form>
</div>
</body>
</html>
