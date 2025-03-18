<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách Tiện Ích</title>
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
    <h2>Danh sách Tiện Ích</h2>
    <div class="add-btn">
        <a class="btn" href="${pageContext.request.contextPath}/tienich/add">Thêm Mới Tiện Ích</a>
    </div>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Tên Tiện Ích</th>
                <th>Mô Tả</th>
                <th>Giờ Hoạt Động</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
        <% String successMessage = (String) request.getAttribute("successMessage"); %>
<% if (successMessage != null) { %>
    <div class="alert alert-success">
        <%= successMessage %>
    </div>
<% } %>
            <c:forEach var="tienich" items="${tienichs}">
    <!-- hiển thị thông tin tiện ích -->
    <tr>
        <td>${tienich.ttb_ma_tien_ich}</td>
        <td>${tienich.ttb_ten_tien_ich}</td>
        <td>${tienich.ttb_mo_ta}</td>
        <td>${tienich.ttb_gio_hoat_dong}</td>
        <td>
            <a href="edit/${tienich.ttb_ma_tien_ich}">Sửa</a> |
            <a href="delete/${tienich.ttb_ma_tien_ich}" onclick="return confirm('Bạn có chắc chắn muốn xóa?');">Xóa</a> |
            <!-- Nút đặt tiện ích -->
            <form action="${pageContext.request.contextPath}/tienich/dat" method="post" style="display:inline;">\n
                <input type="hidden" name="ttb_ma_tien_ich" value="${tienich.ttb_ma_tien_ich}" />\n
                <button type="submit">Đặt tiện ích</button>\n
            </form>\n
        </td>
    </tr>
</c:forEach>
	
        </tbody>
    </table>
</div>
</body>
</html>
