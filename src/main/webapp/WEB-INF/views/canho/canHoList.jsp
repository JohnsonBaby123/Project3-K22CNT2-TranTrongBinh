<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh Sách Căn Hộ</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
        th {
            background: #333;
            color: #fff;
        }
        a {
            text-decoration: none;
            color: #007bff;
        }
        a:hover {
            text-decoration: underline;
        }
        .add-link {
            display: inline-block;
            margin-top: 20px;
            padding: 8px 12px;
            background: #28a745;
            color: #fff;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <h2>Danh Sách Căn Hộ</h2>
    <table>
        <thead>
            <tr>
                <th>Mã Căn Hộ</th>
                <th>Số Căn Hộ</th>
                <th>Tầng</th>
                <th>Loại Căn Hộ</th>
                <th>Diện Tích</th>
                <th>Trạng Thái</th>
                <th>Chủ Hộ (ID)</th>
             
            </tr>
        </thead>
        <tbody>
            <c:forEach var="canho" items="${listCanHo}">
                <tr>
                    <td>${canho.ttb_ma_can_ho}</td>
                    <td>${canho.ttb_so_can_ho}</td>
                    <td>${canho.ttb_tang}</td>
                    <td>${canho.ttb_loai_can_ho}</td>
                    <td>${canho.ttb_dien_tich}</td>
                    <td>${canho.ttb_trang_thai}</td>
                    <td>${canho.ttb_chu_ho_id}</td>
                   
                </tr>
            </c:forEach>
        </tbody>
    </table>

</body>
</html>
