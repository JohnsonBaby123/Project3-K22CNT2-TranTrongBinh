package com.springmvc.dao;

import com.springmvc.beans.TtbThongBao;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class TtbThongBaoDao {

    private JdbcTemplate template;

    public JdbcTemplate getTemplate() {
        return template;
    }

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    // Thêm thông báo mới
    public int addThongBao(TtbThongBao thongBao) {
        String sql = "INSERT INTO TtbThongBao (ttb_tieu_de, ttb_noi_dung, ttb_nguoi_dang) VALUES (?, ?, ?)";
        return template.update(sql,
                thongBao.getTtb_tieu_de(),
                thongBao.getTtb_noi_dung(),
                thongBao.getTtb_nguoi_dang());
    }

    // Cập nhật thông báo
    public int updateThongBao(TtbThongBao thongBao) {
        String sql = "UPDATE TtbThongBao SET ttb_tieu_de = ?, ttb_noi_dung = ?, ttb_nguoi_dang = ? WHERE ttb_ma_thong_bao = ?";
        return template.update(sql,
                thongBao.getTtb_tieu_de(),
                thongBao.getTtb_noi_dung(),
                thongBao.getTtb_nguoi_dang(),
                thongBao.getTtb_ma_thong_bao());
    }

    // Xóa thông báo theo ID
    public int deleteThongBao(int id) {
        String sql = "DELETE FROM TtbThongBao WHERE ttb_ma_thong_bao = ?";
        return template.update(sql, id);
    }

    // Lấy thông báo theo ID
    public TtbThongBao getThongBaoById(int id) {
        String sql = "SELECT * FROM TtbThongBao WHERE ttb_ma_thong_bao = ?";
        try {
            return template.queryForObject(sql, new Object[]{id}, new ThongBaoMapper());
        } catch (Exception e) {
            return null;
        }
    }

    // Lấy danh sách tất cả thông báo
    public List<TtbThongBao> getAllThongBao() {
        String sql = "SELECT * FROM TtbThongBao";
        return template.query(sql, new ThongBaoMapper());
    }

    // Mapper ánh xạ ResultSet sang đối tượng TtbThongBao
    private static class ThongBaoMapper implements RowMapper<TtbThongBao> {
        @Override
        public TtbThongBao mapRow(ResultSet rs, int rowNum) throws SQLException {
            TtbThongBao thongBao = new TtbThongBao();
            thongBao.setTtb_ma_thong_bao(rs.getInt("ttb_ma_thong_bao"));
            thongBao.setTtb_tieu_de(rs.getString("ttb_tieu_de"));
            thongBao.setTtb_noi_dung(rs.getString("ttb_noi_dung"));
            thongBao.setTtb_nguoi_dang(rs.getInt("ttb_nguoi_dang"));
            thongBao.setTtb_ngay_dang(rs.getTimestamp("ttb_ngay_dang"));
            return thongBao;
        }
    }
}
