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
        return "bieumau/saveform";
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
    @GetMapping("/delete/{id}")
    public String deleteNguoiDung(@PathVariable int id, HttpSession session) {
        // Gọi phương thức xóa người dùng kèm các bản ghi liên quan
        nguoiDungDao.deleteUserAndRelated(id);
        return "redirect:/nguoidung";
    }
    @GetMapping("/views/home")
    public String showHomePage() {
        return "home";  // Spring sẽ ghép với prefix/suffix để tìm /WEB-INF/views/home.jsp
    }

    @GetMapping("/login")
    public String showLoginPage() {
        return "login";
    }
    @GetMapping("/signup")
    public String showsignupPage() {
        return "dangky";
    }
    @PostMapping("/dangky")
    public String registerUser(@RequestParam("hoTen") String hoTen,
                               @RequestParam("soDienThoai") String soDienThoai,
                               @RequestParam("email") String email,
                               @RequestParam("matKhau") String matKhau,
                               @RequestParam("vaiTro") int vaiTro,
                               Model model,
                               HttpSession session) {
        // Tạo đối tượng người dùng mới và gán các giá trị từ form
        TtbNguoiDung newUser = new TtbNguoiDung();
        newUser.setTtb_ho_ten(hoTen);
        newUser.setTtb_so_dien_thoai(soDienThoai);
        newUser.setTtb_email(email);
        newUser.setTtb_mat_khau(matKhau);
        newUser.setTtb_vai_tro(vaiTro);

        // Thực hiện đăng ký (thêm người dùng vào CSDL)
        int result = nguoiDungDao.addNguoiDung(newUser);
        if (result > 0) {
            // Đăng ký thành công, chuyển hướng đến trang đăng nhập
            return "redirect:/login";
        } else {
            // Nếu có lỗi, hiển thị lại trang đăng ký với thông báo lỗi
            model.addAttribute("error", "Đăng ký không thành công. Vui lòng thử lại!");
            return "dangky";
        }
    }
    @PostMapping("/login")
    public String login(@RequestParam("email") String email, 
                        @RequestParam("password") String password, 
                        HttpSession session, Model model) {
        TtbNguoiDung user = nguoiDungDao.getNguoiDungByEmail(email);
        if (user != null && user.getTtb_mat_khau().equals(password)) {
            session.setAttribute("user", user);
            return "redirect:/views/home";
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
