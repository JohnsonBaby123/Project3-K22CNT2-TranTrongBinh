package com.springmvc.beans;

import java.util.Date;

public class TtbNguoiDung {
    private int ttb_ma_nguoi_dung;
    private String ttb_ho_ten;
    private String ttb_so_dien_thoai;
    private String ttb_email;
    private String ttb_mat_khau;
    private int ttb_vai_tro;
    private Date ttb_ngay_tao;

    // Constructors
    public TtbNguoiDung() {
    }

    public TtbNguoiDung(int ttb_ma_nguoi_dung, String ttb_ho_ten, String ttb_so_dien_thoai, String ttb_email, String ttb_mat_khau, int ttb_vai_tro, Date ttb_ngay_tao) {
        this.ttb_ma_nguoi_dung = ttb_ma_nguoi_dung;
        this.ttb_ho_ten = ttb_ho_ten;
        this.ttb_so_dien_thoai = ttb_so_dien_thoai;
        this.ttb_email = ttb_email;
        this.ttb_mat_khau = ttb_mat_khau;
        this.ttb_vai_tro = ttb_vai_tro;
        this.ttb_ngay_tao = ttb_ngay_tao;
    }

    // Getters and Setters
    public int getTtb_ma_nguoi_dung() {
        return ttb_ma_nguoi_dung;
    }

    public void setTtb_ma_nguoi_dung(int ttb_ma_nguoi_dung) {
        this.ttb_ma_nguoi_dung = ttb_ma_nguoi_dung;
    }

    public String getTtb_ho_ten() {
        return ttb_ho_ten;
    }

    public void setTtb_ho_ten(String ttb_ho_ten) {
        this.ttb_ho_ten = ttb_ho_ten;
    }

    public String getTtb_so_dien_thoai() {
        return ttb_so_dien_thoai;
    }

    public void setTtb_so_dien_thoai(String ttb_so_dien_thoai) {
        this.ttb_so_dien_thoai = ttb_so_dien_thoai;
    }

    public String getTtb_email() {
        return ttb_email;
    }

    public void setTtb_email(String ttb_email) {
        this.ttb_email = ttb_email;
    }

    public String getTtb_mat_khau() {
        return ttb_mat_khau;
    }

    public void setTtb_mat_khau(String ttb_mat_khau) {
        this.ttb_mat_khau = ttb_mat_khau;
    }

    public int getTtb_vai_tro() {
        return ttb_vai_tro;
    }

    public void setTtb_vai_tro(int ttb_vai_tro) {
        this.ttb_vai_tro = ttb_vai_tro;
    }

    public Date getTtb_ngay_tao() {
        return ttb_ngay_tao;
    }

    public void setTtb_ngay_tao(Date ttb_ngay_tao) {
        this.ttb_ngay_tao = ttb_ngay_tao;
    }
}
