package com.springmvc.controllers;

import com.springmvc.beans.TtbCuDan;
import com.springmvc.dao.TtbCuDanDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
@RequestMapping("/cudan")
public class TtbCuDanController {

    @Autowired
    private TtbCuDanDAO cuDanDAO;

    // Hiển thị danh sách cư dân
    @GetMapping({"", "/"})
    public String listCuDan(Model model) {
        List<TtbCuDan> list = cuDanDAO.getAllCuDan();
        model.addAttribute("listCuDan", list);
        return "cudan/cudanList";  // Trỏ tới WEB-INF/views/cudan/cudanList.jsp
    }

    // Hiển thị form thêm mới cư dân
    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("cudan", new TtbCuDan());
        model.addAttribute("action", "add");
        return "cudan/cudanForm";  // Trỏ tới WEB-INF/views/cudan/cudanForm.jsp
    }

    // Xử lý lưu (thêm mới hoặc cập nhật cư dân)
    @PostMapping("/save")
    public String saveCuDan(@ModelAttribute("cudan") TtbCuDan cuDan) {
        if (cuDan.getTtb_ma_cu_dan() == 0) {
            cuDanDAO.addCuDan(cuDan);
        } else {
            cuDanDAO.updateCuDan(cuDan);
        }
        return "redirect:/cudan";
    }

    // Hiển thị form chỉnh sửa cư dân
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") int id, Model model) {
        TtbCuDan cuDan = cuDanDAO.getCuDanById(id);
        model.addAttribute("cudan", cuDan);
        model.addAttribute("action", "edit");
        return "cudan/cudanForm";
    }

    // Xóa cư dân
    @GetMapping("/delete/{id}")
    public String deleteCuDan(@PathVariable("id") int id) {
        cuDanDAO.deleteCuDan(id);
        return "redirect:/cudan";
    }
}
