CREATE DATABASE K22CNT2_TranTrongBinh_2210900004_project3;
USE K22CNT2_TranTrongBinh_2210900004_project3;

CREATE TABLE TtbNguoiDung (
    ttb_ma_nguoi_dung INT PRIMARY KEY AUTO_INCREMENT,
    ttb_ho_ten VARCHAR(100) NOT NULL,
    ttb_so_dien_thoai VARCHAR(15) UNIQUE NOT NULL,
    ttb_email VARCHAR(100) UNIQUE NOT NULL,
    ttb_mat_khau VARCHAR(255) NOT NULL,
    ttb_vai_tro TINYINT NOT NULL COMMENT '1 = Ban quản lý, 2 = Cư dân',
    ttb_ngay_tao DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE TtbCanHo (
    ttb_ma_can_ho INT PRIMARY KEY AUTO_INCREMENT,
    ttb_so_can_ho VARCHAR(10) UNIQUE NOT NULL,
    ttb_tang TINYINT NOT NULL,
    ttb_loai_can_ho VARCHAR(10) NOT NULL COMMENT '1PN, 2PN, 3PN',
    ttb_dien_tich FLOAT NOT NULL,
    ttb_trang_thai TINYINT NOT NULL COMMENT '1 = Có người ở, 2 = Trống, 3 = Đang thuê',
    ttb_chu_ho_id INT,
    FOREIGN KEY (ttb_chu_ho_id) REFERENCES TtbNguoiDung(ttb_ma_nguoi_dung)
);

CREATE TABLE TtbCuDan (
    ttb_ma_cu_dan INT PRIMARY KEY AUTO_INCREMENT,
    ttb_ma_nguoi_dung INT,
    ttb_ma_can_ho INT,
    ttb_quan_he TINYINT NOT NULL COMMENT '1 = Chủ hộ, 2 = Người thuê, 3 = Thành viên gia đình',
    FOREIGN KEY (ttb_ma_nguoi_dung) REFERENCES TtbNguoiDung(ttb_ma_nguoi_dung),
    FOREIGN KEY (ttb_ma_can_ho) REFERENCES TtbCanHo(ttb_ma_can_ho)
);

CREATE TABLE TtbThongBao (
    ttb_ma_thong_bao INT PRIMARY KEY AUTO_INCREMENT,
    ttb_tieu_de VARCHAR(255) NOT NULL,
    ttb_noi_dung TEXT NOT NULL,
    ttb_nguoi_dang INT,
    ttb_ngay_dang DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ttb_nguoi_dang) REFERENCES TtbNguoiDung(ttb_ma_nguoi_dung)
);

CREATE TABLE TtbTienIch (
    ttb_ma_tien_ich INT PRIMARY KEY AUTO_INCREMENT,
    ttb_ten_tien_ich VARCHAR(100) NOT NULL,
    ttb_mo_ta TEXT NOT NULL,
    ttb_gio_hoat_dong VARCHAR(50) NOT NULL
);

CREATE TABLE TtbDatTienIch (
    ttb_ma_dat_lich INT PRIMARY KEY AUTO_INCREMENT,
    ttb_ma_nguoi_dung INT,
    ttb_ma_tien_ich INT,
    ttb_thoi_gian_dat DATETIME NOT NULL,
    ttb_trang_thai TINYINT NOT NULL COMMENT '1 = Chờ duyệt, 2 = Đã duyệt, 3 = Bị từ chối',
    FOREIGN KEY (ttb_ma_nguoi_dung) REFERENCES TtbNguoiDung(ttb_ma_nguoi_dung),
    FOREIGN KEY (ttb_ma_tien_ich) REFERENCES TtbTienIch(ttb_ma_tien_ich)
);
select * from TtbNguoidung
select * from TtbCanho
select * from TtbCuDan
select * from TtbThongBao
select * from TtbTienIch
select * from TtbDatTienIch

INSERT INTO TtbNguoiDung (ttb_ho_ten, ttb_so_dien_thoai, ttb_email, ttb_mat_khau, ttb_vai_tro, ttb_ngay_tao) VALUES
('Nguyen Van Anh', '0912345678', 'nva@gmail.com', 'hashed_password1', 1, NOW()),
('Tran Thi Binh', '0923456789', 'ttb@gmail.com', 'hashed_password2', 2, NOW()),
('Le Van Cuong', '0934567890', 'lvc@gmail.com', 'hashed_password3', 2, NOW());

INSERT INTO TtbCanHo (ttb_so_can_ho, ttb_tang, ttb_loai_can_ho, ttb_dien_tich, ttb_trang_thai, ttb_chu_ho_id) VALUES
('101', 1, '1PN', 45.5, 1, 1),
('102', 1, '2PN', 65.0, 2, 2),
('201', 2, '3PN', 85.0, 3, 3);

INSERT INTO TtbCuDan (ttb_ma_nguoi_dung, ttb_ma_can_ho, ttb_quan_he) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

INSERT INTO TtbThongBao (ttb_tieu_de, ttb_noi_dung, ttb_nguoi_dang, ttb_ngay_dang) VALUES
('Thông báo họp cư dân', 'Cuộc họp cư dân sẽ diễn ra vào 10h sáng Chủ Nhật.', 1, NOW()),
('Bảo trì thang máy', 'Thang máy sẽ được bảo trì vào ngày 15.', 1, NOW());

INSERT INTO TtbTienIch (ttb_ten_tien_ich, ttb_mo_ta, ttb_gio_hoat_dong) VALUES
('Hồ bơi', 'Hồ bơi ngoài trời mở cửa 6h-22h.', '06:00 - 22:00'),
('Phòng gym', 'Phòng gym đầy đủ thiết bị, mở cửa 5h-23h.', '05:00 - 23:00');

INSERT INTO TtbDatTienIch (ttb_ma_nguoi_dung, ttb_ma_tien_ich, ttb_thoi_gian_dat, ttb_trang_thai) VALUES
(2, 1, '2025-03-01 07:00:00', 1),
(3, 2, '2025-03-02 18:00:00', 2);
 
