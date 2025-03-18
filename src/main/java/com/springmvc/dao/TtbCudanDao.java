package com.springmvc.dao;

import com.springmvc.beans.TtbCuDan;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class TtbCuDanDAO {

    private JdbcTemplate template;

    // Getter và Setter cho JdbcTemplate
    public JdbcTemplate getTemplate() {
        return template;
    }

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    // Thêm mới cư dân
    public int addCuDan(TtbCuDan cuDan) {
        String sql = "INSERT INTO TtbCuDan (ttb_ma_nguoi_dung, ttb_ma_can_ho, ttb_quan_he) VALUES (?, ?, ?)";
        return template.update(sql, 
                cuDan.getTtb_ma_nguoi_dung(), 
                cuDan.getTtb_ma_can_ho(), 
                cuDan.getTtb_quan_he());
    }
 
    // Cập nhật cư dân
    public int updateCuDan(TtbCuDan cuDan) {
        String sql = "UPDATE TtbCuDan SET ttb_ma_nguoi_dung = ?, ttb_ma_can_ho = ?, ttb_quan_he = ? WHERE ttb_ma_cu_dan = ?";
        return template.update(sql, 
                cuDan.getTtb_ma_nguoi_dung(), 
                cuDan.getTtb_ma_can_ho(), 
                cuDan.getTtb_quan_he(), 
                cuDan.getTtb_ma_cu_dan());
    }

    // Xóa cư dân theo ID
    public int deleteCuDan(int id) {
        String sql = "DELETE FROM TtbCuDan WHERE ttb_ma_cu_dan = ?";
        return template.update(sql, id);
    }

    // Lấy thông tin cư dân theo ID
    public TtbCuDan getCuDanById(int id) {
        String sql = "SELECT * FROM TtbCuDan WHERE ttb_ma_cu_dan = ?";
        try {
            return template.queryForObject(sql, new Object[]{id}, new CuDanMapper());
        } catch (Exception e) {
            return null;
        }
    }

    // Lấy danh sách tất cả cư dân
    public List<TtbCuDan> getAllCuDan() {
        String sql = "SELECT * FROM TtbCuDan";
        return template.query(sql, new CuDanMapper());
    }

    // RowMapper để ánh xạ ResultSet thành đối tượng TtbCuDan
    private static class CuDanMapper implements RowMapper<TtbCuDan> {
        @Override
        public TtbCuDan mapRow(ResultSet rs, int rowNum) throws SQLException {
            TtbCuDan cuDan = new TtbCuDan();
            cuDan.setTtb_ma_cu_dan(rs.getInt("ttb_ma_cu_dan"));
            cuDan.setTtb_ma_nguoi_dung(rs.getInt("ttb_ma_nguoi_dung"));
            cuDan.setTtb_ma_can_ho(rs.getInt("ttb_ma_can_ho"));
            cuDan.setTtb_quan_he(rs.getByte("ttb_quan_he"));
            return cuDan;
        }
    }
}
