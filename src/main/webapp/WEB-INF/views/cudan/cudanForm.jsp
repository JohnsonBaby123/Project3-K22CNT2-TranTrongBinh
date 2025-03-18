<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>
        <c:choose>
            <c:when test="${action == 'edit'}">Chỉnh Sửa Cư Dân</c:when>
            <c:otherwise>Thêm Mới Cư Dân</c:otherwise>
        </c:choose>
    </title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            width: 40%;
            margin: auto;
            background: #fff;
            padding: 20px;
            margin-top: 50px;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0,0,0,0.1);
        }
        h2 {
            color: #333;
            text-align: center;
        }
        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #333;
        }
        input, select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .btn {
            padding: 10px 15px;
            background: #333;
            color: #fff;
            text-decoration: none;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 10px;
        }
        .btn:hover {
            background: #000;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>
            <c:choose>
                <c:when test="${action == 'edit'}">Chỉnh Sửa Cư Dân</c:when>
                <c:otherwise>Thêm Mới Cư Dân</c:otherwise>
            </c:choose>
        </h2>
        <form action="${pageContext.request.contextPath}/cudan/save" method="post">
            <c:if test="${cudan != null}">
                <input type="hidden" name="ttb_ma_cu_dan" value="${cudan.ttb_ma_cu_dan}" />
            </c:if>
            <div class="form-group">
                <label>Mã Người Dùng:</label>
                <input type="number" name="ttb_ma_nguoi_dung" value="${cudan != null ? cudan.ttb_ma_nguoi_dung : ''}" required />
            </div>
            <div class="form-group">
                <label>Mã Căn Hộ:</label>
                <input type="number" name="ttb_ma_can_ho" value="${cudan != null ? cudan.ttb_ma_can_ho : ''}" required />
            </div>
            <div class="form-group">
                <label>Quan Hệ:</label>
                <select name="ttb_quan_he" required>
                    <option value="1" ${cudan != null && cudan.ttb_quan_he == 1 ? 'selected="selected"' : ''}>Chủ hộ</option>
                    <option value="2" ${cudan != null && cudan.ttb_quan_he == 2 ? 'selected="selected"' : ''}>Người thuê</option>
                    <option value="3" ${cudan != null && cudan.ttb_quan_he == 3 ? 'selected="selected"' : ''}>Thành viên gia đình</option>
                </select>
            </div>
            <div class="form-group">
                <button type="submit" class="btn">Lưu</button>
                <a href="${pageContext.request.contextPath}/cudan" class="btn">Hủy</a>
            </div>
        </form>
    </div>
</body>
</html>
