<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách Cư Dân</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            width: 80%;
            margin: auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0,0,0,0.1);
        }
        h2 {
            color: #333;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #333;
            color: #fff;
        }
        .btn {
            padding: 5px 10px;
            background: #333;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
        }
        .btn:hover {
            background: #000;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Danh sách Cư Dân</h2>
        <a class="btn" href="${pageContext.request.contextPath}/cudan/add">Thêm Mới Cư Dân</a>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Mã Người Dùng</th>
                    <th>Mã Căn Hộ</th>
                    <th>Quan Hệ</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="cudan" items="${listCuDan}">
                    <tr>
                        <td>${cudan.ttb_ma_cu_dan}</td>
                        <td>${cudan.ttb_ma_nguoi_dung}</td>
                        <td>${cudan.ttb_ma_can_ho}</td>
                        <td>
                            <c:choose>
                                <c:when test="${cudan.ttb_quan_he == 1}">Chủ hộ</c:when>
                                <c:when test="${cudan.ttb_quan_he == 2}">Người thuê</c:when>
                                <c:when test="${cudan.ttb_quan_he == 3}">Thành viên gia đình</c:when>
                                <c:otherwise>Không xác định</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <a class="btn" href="${pageContext.request.contextPath}/cudan/edit/${cudan.ttb_ma_cu_dan}">Sửa</a>
                            <a class="btn" href="${pageContext.request.contextPath}/cudan/delete/${cudan.ttb_ma_cu_dan}"
                               onclick="return confirm('Bạn có chắc chắn muốn xóa?');">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
