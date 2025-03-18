package com.springmvc.controllers;

import com.springmvc.beans.TtbCanHo;
import com.springmvc.dao.TtbCanHoDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
@RequestMapping("/canho")
public class TtbCanHoController {

    @Autowired
    private TtbCanHoDao canHoDao;

    // Hiển thị danh sách căn hộ
    @GetMapping({"", "/"})
    public String listCanHo(Model model) {
        List<TtbCanHo> list = canHoDao.getAllCanHo();
        model.addAttribute("listCanHo", list);
        return "canho/canHoList";  // Trỏ tới WEB-INF/views/canho/canHoList.jsp
    }


}
