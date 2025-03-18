package com.springmvc.dao;

import com.springmvc.beans.TtbTienIch;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class TtbTienIchDao {
    private JdbcTemplate template;

    public JdbcTemplate getTemplate() {
        return template;
    }
    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    public int addTienIch(TtbTienIch tienIch) {
        String sql = "INSERT INTO TtbTienIch (ttb_ten_tien_ich, ttb_mo_ta, ttb_gio_hoat_dong) VALUES (?, ?, ?)";
        return template.update(sql, tienIch.getTtb_ten_tien_ich(), tienIch.getTtb_mo_ta(), tienIch.getTtb_gio_hoat_dong());
    }

    public int updateTienIch(TtbTienIch tienIch) {
        String sql = "UPDATE TtbTienIch SET ttb_ten_tien_ich = ?, ttb_mo_ta = ?, ttb_gio_hoat_dong = ? WHERE ttb_ma_tien_ich = ?";
        return template.update(sql, tienIch.getTtb_ten_tien_ich(), tienIch.getTtb_mo_ta(), tienIch.getTtb_gio_hoat_dong(), tienIch.getTtb_ma_tien_ich());
    }

    public int deleteTienIch(int id) {
        String sql = "DELETE FROM TtbTienIch WHERE ttb_ma_tien_ich = ?";
        return template.update(sql, id);
    }

    public TtbTienIch getTienIchById(int id) {
        String sql = "SELECT * FROM TtbTienIch WHERE ttb_ma_tien_ich = ?";
        return template.queryForObject(sql, new Object[]{id}, new TienIchMapper());
    }

    public List<TtbTienIch> getAllTienIch() {
        String sql = "SELECT * FROM TtbTienIch";
        return template.query(sql, new TienIchMapper());
    }

    // Phương thức đặt tiện ích: lưu bản ghi vào bảng TtbDatTienIch
    public int datTienIch(int ttb_ma_tien_ich, int ttb_ma_nguoi_dung) {
        String sql = "INSERT INTO TtbDatTienIch (ttb_ma_nguoi_dung, ttb_ma_tien_ich, ttb_thoi_gian_dat) VALUES (?, ?, NOW())";
        return template.update(sql, ttb_ma_nguoi_dung, ttb_ma_tien_ich);
    }

    private static class TienIchMapper implements RowMapper<TtbTienIch> {
        @Override
        public TtbTienIch mapRow(ResultSet rs, int rowNum) throws SQLException {
            return new TtbTienIch(
                rs.getInt("ttb_ma_tien_ich"), 
                rs.getString("ttb_ten_tien_ich"), 
                rs.getString("ttb_mo_ta"), 
                rs.getString("ttb_gio_hoat_dong")
            );
        }
    }
}
