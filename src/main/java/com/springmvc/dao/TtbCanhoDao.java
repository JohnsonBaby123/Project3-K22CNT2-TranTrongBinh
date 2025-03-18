package com.springmvc.dao;

import com.springmvc.beans.TtbCanHo;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class TtbCanHoDao {

    private JdbcTemplate template;

    public JdbcTemplate getTemplate() {
        return template;
    }

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }


    // Lấy căn hộ theo ID
    public TtbCanHo getCanHoById(int id) {
        String sql = "SELECT * FROM TtbCanHo WHERE ttb_ma_can_ho = ?";
        try {
            return template.queryForObject(sql, new Object[]{id}, new CanHoMapper());
        } catch (Exception e) {
            return null;
        }
    }

    // Lấy danh sách tất cả căn hộ
    public List<TtbCanHo> getAllCanHo() {
        String sql = "SELECT * FROM TtbCanHo";
        return template.query(sql, new CanHoMapper());
    }

    // Mapper ánh xạ ResultSet sang đối tượng TtbCanHo
    private static class CanHoMapper implements RowMapper<TtbCanHo> {
        @Override
        public TtbCanHo mapRow(ResultSet rs, int rowNum) throws SQLException {
            TtbCanHo canHo = new TtbCanHo();
            canHo.setTtb_ma_can_ho(rs.getInt("ttb_ma_can_ho"));
            canHo.setTtb_so_can_ho(rs.getString("ttb_so_can_ho"));
            canHo.setTtb_tang(rs.getByte("ttb_tang"));
            canHo.setTtb_loai_can_ho(rs.getString("ttb_loai_can_ho"));
            canHo.setTtb_dien_tich(rs.getFloat("ttb_dien_tich"));
            canHo.setTtb_trang_thai(rs.getByte("ttb_trang_thai"));
            canHo.setTtb_chu_ho_id(rs.getInt("ttb_chu_ho_id"));
            return canHo;
        }
    }
}
