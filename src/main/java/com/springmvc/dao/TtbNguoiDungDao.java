package com.springmvc.dao;

import com.springmvc.beans.TtbNguoiDung;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class TtbNguoiDungDao {
    private final JdbcTemplate jdbcTemplate;

    public TtbNguoiDungDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    // Thêm người dùng mới
    public int addNguoiDung(TtbNguoiDung user) {
        String sql = "INSERT INTO TtbNguoiDung (ttb_ho_ten, ttb_so_dien_thoai, ttb_email, ttb_mat_khau, ttb_vai_tro, ttb_ngay_tao) VALUES (?, ?, ?, ?, ?, NOW())";
        return jdbcTemplate.update(sql, 
            user.getTtb_ho_ten(), 
            user.getTtb_so_dien_thoai(), 
            user.getTtb_email(), 
            user.getTtb_mat_khau(), 
            user.getTtb_vai_tro());
    }

    // Cập nhật thông tin người dùng
    public int updateNguoiDung(TtbNguoiDung user) {
        String sql = "UPDATE TtbNguoiDung SET ttb_ho_ten=?, ttb_so_dien_thoai=?, ttb_email=?, ttb_mat_khau=?, ttb_vai_tro=?, ttb_ngay_tao=? WHERE ttb_ma_nguoi_dung=?";
        return jdbcTemplate.update(sql, 
            user.getTtb_ho_ten(), 
            user.getTtb_so_dien_thoai(), 
            user.getTtb_email(), 
            user.getTtb_mat_khau(), 
            user.getTtb_vai_tro(),
            user.getTtb_ngay_tao(),
            user.getTtb_ma_nguoi_dung());
    }

    // Xóa người dùng theo ID
    public int deleteNguoiDung(int id) {
        String sql = "DELETE FROM TtbNguoiDung WHERE ttb_ma_nguoi_dung=?";
        return jdbcTemplate.update(sql, id);
    }

    // Lấy thông tin người dùng theo ID
    public TtbNguoiDung getNguoiDungById(int id) {
        String sql = "SELECT * FROM TtbNguoiDung WHERE ttb_ma_nguoi_dung=?";
        try {
            return jdbcTemplate.queryForObject(sql, new Object[]{id}, new UserMapper());
        } catch (Exception e) {
            return null;  
        }
    }

    // Lấy danh sách tất cả người dùng
    public List<TtbNguoiDung> getAllNguoiDung() {
        String sql = "SELECT * FROM TtbNguoiDung";
        return jdbcTemplate.query(sql, new UserMapper());
    }

    // Lấy thông tin người dùng theo email
    public TtbNguoiDung getNguoiDungByEmail(String email) {
        String sql = "SELECT * FROM TtbNguoiDung WHERE ttb_email=?";
        try {
            return jdbcTemplate.queryForObject(sql, new Object[]{email}, new UserMapper());
        } catch (Exception e) {
            return null;
        }
    }
    
    
    
    // Mapper để ánh xạ ResultSet vào đối tượng TtbNguoiDung
    private static class UserMapper implements RowMapper<TtbNguoiDung> {
        @Override
        public TtbNguoiDung mapRow(ResultSet rs, int rowNum) throws SQLException {
            TtbNguoiDung user = new TtbNguoiDung();
            user.setTtb_ma_nguoi_dung(rs.getInt("ttb_ma_nguoi_dung"));
            user.setTtb_ho_ten(rs.getString("ttb_ho_ten"));
            user.setTtb_so_dien_thoai(rs.getString("ttb_so_dien_thoai"));
            user.setTtb_email(rs.getString("ttb_email"));
            user.setTtb_mat_khau(rs.getString("ttb_mat_khau"));
            user.setTtb_vai_tro(rs.getInt("ttb_vai_tro"));
            user.setTtb_ngay_tao(rs.getDate("ttb_ngay_tao"));
            return user;
        }
    }
}
