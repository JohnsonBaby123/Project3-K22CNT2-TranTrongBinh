package com.springmvc.beans;

import java.util.Date;

public class TtbThongBao {
    private int ttb_ma_thong_bao;
    private String ttb_tieu_de;
    private String ttb_noi_dung;
    private int ttb_nguoi_dang;
    private Date ttb_ngay_dang;

    public TtbThongBao() {}

    public TtbThongBao(int ttb_ma_thong_bao, String ttb_tieu_de, String ttb_noi_dung, int ttb_nguoi_dang, Date ttb_ngay_dang) {
        this.ttb_ma_thong_bao = ttb_ma_thong_bao;
        this.ttb_tieu_de = ttb_tieu_de;
        this.ttb_noi_dung = ttb_noi_dung;
        this.ttb_nguoi_dang = ttb_nguoi_dang;
        this.ttb_ngay_dang = ttb_ngay_dang;
    }

    public int getTtb_ma_thong_bao() {
        return ttb_ma_thong_bao;
    }

    public void setTtb_ma_thong_bao(int ttb_ma_thong_bao) {
        this.ttb_ma_thong_bao = ttb_ma_thong_bao;
    }

    public String getTtb_tieu_de() {
        return ttb_tieu_de;
    }

    public void setTtb_tieu_de(String ttb_tieu_de) {
        this.ttb_tieu_de = ttb_tieu_de;
    }

    public String getTtb_noi_dung() {
        return ttb_noi_dung;
    }

    public void setTtb_noi_dung(String ttb_noi_dung) {
        this.ttb_noi_dung = ttb_noi_dung;
    }

    public int getTtb_nguoi_dang() {
        return ttb_nguoi_dang;
    }

    public void setTtb_nguoi_dang(int ttb_nguoi_dang) {
        this.ttb_nguoi_dang = ttb_nguoi_dang;
    }

    public Date getTtb_ngay_dang() {
        return ttb_ngay_dang;
    }

    public void setTtb_ngay_dang(Date ttb_ngay_dang) {
        this.ttb_ngay_dang = ttb_ngay_dang;
    }
}
