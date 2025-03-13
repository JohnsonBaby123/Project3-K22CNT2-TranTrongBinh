package com.springmvc.controllers;

import com.springmvc.beans.TtbNguoiDung;
import com.springmvc.dao.TtbNguoiDungDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
public class TtbLoginController {

    @Autowired
    private TtbNguoiDungDao nguoiDungDao;

    @GetMapping("/login")
    public String showLoginPage() {
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam("email") String email, 
                        @RequestParam("password") String password, 
                        HttpSession session, Model model) {
        TtbNguoiDung user = nguoiDungDao.getNguoiDungByEmail(email);
        if (user != null && user.getTtb_mat_khau().equals(password)) {
            session.setAttribute("user", user);
            return "redirect:/home";
        } else {
            model.addAttribute("error", "Sai tài khoản hoặc mật khẩu!");
            return "login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}
