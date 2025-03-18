package com.springmvc.controllers;

import com.springmvc.beans.TtbThongBao;
import com.springmvc.dao.TtbThongBaoDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/thongbao")
public class TtbThongBaoController {

    @Autowired
    private TtbThongBaoDao thongBaoDao;

    // Hiển thị danh sách thông báo
    @GetMapping({"", "/"})
    public String listThongBao(Model model) {
        List<TtbThongBao> list = thongBaoDao.getAllThongBao();
        model.addAttribute("listThongBao", list);
        return "thongbao/thongBaoList";  // Trỏ tới WEB-INF/views/thongbao/thongBaoList.jsp
    }

    // Hiển thị form thêm mới thông báo (file riêng)
    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("thongbao", new TtbThongBao());
        return "thongbao/thongBaoAdd";  // Trỏ tới WEB-INF/views/thongbao/thongBaoAdd.jsp
    }

    // Hiển thị form chỉnh sửa thông báo (file riêng)
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") int id, Model model) {
        TtbThongBao thongBao = thongBaoDao.getThongBaoById(id);
        if (thongBao == null) {
            return "redirect:/thongbao?error=notfound";
        }
        model.addAttribute("thongbao", thongBao);
        return "thongbao/thongBaoEdit";  // Trỏ tới WEB-INF/views/thongbao/thongBaoEdit.jsp
    }

    // Xử lý lưu (thêm mới hoặc cập nhật thông báo)
    @PostMapping("/save")
    public String saveThongBao(@ModelAttribute("thongbao") TtbThongBao thongBao) {
        if (thongBao.getTtb_ma_thong_bao() == 0) {
            thongBaoDao.addThongBao(thongBao);
        } else {
            thongBaoDao.updateThongBao(thongBao);
        }
        return "redirect:/thongbao";
    }

    // Xóa thông báo
    @GetMapping("/delete/{id}")
    public String deleteThongBao(@PathVariable("id") int id) {
        thongBaoDao.deleteThongBao(id);
        return "redirect:/thongbao";
    }
}
