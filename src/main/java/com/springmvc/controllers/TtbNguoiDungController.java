package com.springmvc.controllers;

import com.springmvc.beans.TtbNguoiDung;
import com.springmvc.dao.TtbNguoiDungDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class TtbNguoiDungController {

    @Autowired
    private TtbNguoiDungDao nguoiDungDao;

    @GetMapping("/nguoidung")
    public String listNguoiDung(Model model, HttpSession session) {
        if (session.getAttribute("user") == null) {
            return "redirect:/login";
        }
        List<TtbNguoiDung> list = nguoiDungDao.getAllNguoiDung();
        model.addAttribute("nguoiDungs", list);
        return "nguoidung";
    }

    @GetMapping("/view/{id}")
    public String viewNguoiDung(@PathVariable int id, Model model) {
        TtbNguoiDung user = nguoiDungDao.getNguoiDungById(id);
        if (user == null) {
            return "redirect:/nguoidung?error=notfound";
        }
        model.addAttribute("user", user);
        return "viewform";
    }

    @GetMapping("/edit/{id}")
    public String editNguoiDung(@PathVariable int id, Model model) {
        TtbNguoiDung user = nguoiDungDao.getNguoiDungById(id);
        if (user == null) {
            return "redirect:/nguoidung?error=notfound";
        }
        model.addAttribute("user", user);
        model.addAttribute("action", "edit");
        return "saveform";
    }

    @GetMapping("/add")
    public String addNguoiDung(Model model) {
        model.addAttribute("action", "add");
        return "saveform";
    }

    @PostMapping("/saveUser")
    public String saveNguoiDung(@RequestParam(value = "id", required = false) Integer id,
                                @RequestParam("hoTen") String hoTen,
                                @RequestParam("soDienThoai") String soDienThoai,
                                @RequestParam("email") String email,
                                @RequestParam("password") String password,
                                @RequestParam("vaiTro") int vaiTro) {
        TtbNguoiDung user = new TtbNguoiDung();
        user.setTtb_ho_ten(hoTen);
        user.setTtb_so_dien_thoai(soDienThoai);
        user.setTtb_email(email);
        user.setTtb_mat_khau(password);
        user.setTtb_vai_tro(vaiTro);

        if (id == null || id == 0) {
            nguoiDungDao.addNguoiDung(user);
        } else {
            user.setTtb_ma_nguoi_dung(id);
            nguoiDungDao.updateNguoiDung(user);
        }
        return "redirect:/nguoidung";
    }
}
