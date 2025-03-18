<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách Thông Báo</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            width: 90%;
            margin: auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }
        h2 {
            color: #333;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background: #333;
            color: #fff;
        }
        a.btn {
            display: inline-block;
            padding: 5px 10px;
            background: #333;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
            margin-right: 5px;
        }
        a.btn:hover {
            background: #000;
        }
        .add-btn {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Danh sách Thông Báo</h2>
    <div class="add-btn">
        <a class="btn" href="${pageContext.request.contextPath}/thongbao/add">Thêm Mới Thông Báo</a>
    </div>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Tiêu Đề</th>
                <th>Nội Dung</th>
                <th>Người Đăng</th>
                <th>Ngày Đăng</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="tb" items="${listThongBao}">
                <tr>
                    <td>${tb.ttb_ma_thong_bao}</td>
                    <td>${tb.ttb_tieu_de}</td>
                    <td>${tb.ttb_noi_dung}</td>
                    <td>${tb.ttb_nguoi_dang}</td>
                    <td>${tb.ttb_ngay_dang}</td>
                    <td>
                        <a class="btn" href="${pageContext.request.contextPath}/thongbao/edit/${tb.ttb_ma_thong_bao}">Sửa</a>
                        <a class="btn" href="${pageContext.request.contextPath}/thongbao/delete/${tb.ttb_ma_thong_bao}" onclick="return confirm('Bạn có chắc chắn muốn xóa?');">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
