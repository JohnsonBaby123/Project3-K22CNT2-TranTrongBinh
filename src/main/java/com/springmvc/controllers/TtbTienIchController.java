package com.springmvc.controllers;

import com.springmvc.beans.TtbNguoiDung;
import com.springmvc.beans.TtbTienIch;
import com.springmvc.dao.TtbTienIchDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/tienich")
public class TtbTienIchController {

    @Autowired
    private TtbTienIchDao tienIchDao;

    // Hiển thị danh sách tiện ích
    @GetMapping({"", "/"})
    public String listTienIch(Model model) {
        List<TtbTienIch> list = tienIchDao.getAllTienIch();
        model.addAttribute("tienichs", list);
        return "tienich/tienIchList";  // Trỏ tới WEB-INF/views/tienich/tienIchList.jsp
    }

    // Hiển thị form thêm mới tiện ích
    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("tienich", new TtbTienIch());
        model.addAttribute("action", "add");
        return "tienich/tienIchForm";  // Trỏ tới WEB-INF/views/tienich/tienIchForm.jsp
    }

    // Xử lý lưu (thêm mới hoặc cập nhật tiện ích)
    @PostMapping("/save")
    public String saveTienIch(@ModelAttribute("tienich") TtbTienIch tienIch) {
        if (tienIch.getTtb_ma_tien_ich() == 0) {
            tienIchDao.addTienIch(tienIch);
        } else {
            tienIchDao.updateTienIch(tienIch);
        }
        return "redirect:/tienich";
    }

    // Hiển thị form chỉnh sửa tiện ích
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") int id, Model model) {
        TtbTienIch tienIch = tienIchDao.getTienIchById(id);
        if (tienIch == null) {
            return "redirect:/tienich?error=notfound";
        }
        model.addAttribute("tienich", tienIch);
        model.addAttribute("action", "edit");
        return "tienich/tienIchForm";
    }

    // Xóa tiện ích
    @GetMapping("/delete/{id}")
    public String deleteTienIch(@PathVariable("id") int id) {
        tienIchDao.deleteTienIch(id);
        return "redirect:/tienich";
    }

    @PostMapping("/dat")
    public String datTienIch(@RequestParam("ttb_ma_tien_ich") int ttb_ma_tien_ich, 
                             HttpSession session, RedirectAttributes redirectAttributes) {
        // Lấy đối tượng người dùng hiện tại từ session
        TtbNguoiDung currentUser = (TtbNguoiDung) session.getAttribute("user");
        if (currentUser == null) {
            // Nếu chưa đăng nhập, chuyển hướng đến trang đăng nhập
            return "redirect:/login";
        }

        // Lưu bản ghi đặt tiện ích
        tienIchDao.datTienIch(ttb_ma_tien_ich, currentUser.getTtb_ma_nguoi_dung());

        // Thêm thông báo thành công
        redirectAttributes.addFlashAttribute("successMessage", "Đặt tiện ích thành công!");

        return "redirect:/tienich";
    }

}
