<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>
        <c:choose>
            <c:when test="${action == 'edit'}">Chỉnh Sửa Tiện Ích</c:when>
            <c:otherwise>Thêm Mới Tiện Ích</c:otherwise>
        </c:choose>
    </title>
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
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
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
            text-decoration: none;
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
            <c:when test="${action == 'edit'}">Chỉnh Sửa Tiện Ích</c:when>
            <c:otherwise>Thêm Mới Tiện Ích</c:otherwise>
        </c:choose>
    </h2>
    <form action="${pageContext.request.contextPath}/tienich/save" method="post">
        <c:if test="${tienich.ttb_ma_tien_ich != 0}">
            <input type="hidden" name="ttb_ma_tien_ich" value="${tienich.ttb_ma_tien_ich}" />
        </c:if>
        <div class="form-group">
            <label>Tên Tiện Ích:</label>
            <input type="text" name="ttb_ten_tien_ich" value="${tienich.ttb_ten_tien_ich}" required />
        </div>
        <div class="form-group">
            <label>Mô Tả:</label>
            <textarea name="ttb_mo_ta" rows="4" required>${tienich.ttb_mo_ta}</textarea>
        </div>
        <div class="form-group">
            <label>Giờ Hoạt Động:</label>
            <input type="text" name="ttb_gio_hoat_dong" value="${tienich.ttb_gio_hoat_dong}" required />
        </div>
        <div class="btn-group">
            <button type="submit" class="btn">Lưu</button>
            <a href="${pageContext.request.contextPath}/tienich" class="btn">Hủy</a>
        </div>
    </form>
</div>
</body>
</html>
