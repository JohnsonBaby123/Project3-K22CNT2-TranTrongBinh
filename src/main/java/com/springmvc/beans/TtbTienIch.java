package com.springmvc.beans;

public class TtbTienIch {
    private int ttb_ma_tien_ich;
    private String ttb_ten_tien_ich;
    private String ttb_mo_ta;
    private String ttb_gio_hoat_dong;

    public TtbTienIch() {}

    public TtbTienIch(int ttb_ma_tien_ich, String ttb_ten_tien_ich, String ttb_mo_ta, String ttb_gio_hoat_dong) {
        this.ttb_ma_tien_ich = ttb_ma_tien_ich;
        this.ttb_ten_tien_ich = ttb_ten_tien_ich;
        this.ttb_mo_ta = ttb_mo_ta;
        this.ttb_gio_hoat_dong = ttb_gio_hoat_dong;
    }

    public int getTtb_ma_tien_ich() {
        return ttb_ma_tien_ich;
    }

    public void setTtb_ma_tien_ich(int ttb_ma_tien_ich) {
        this.ttb_ma_tien_ich = ttb_ma_tien_ich;
    }

    public String getTtb_ten_tien_ich() {
        return ttb_ten_tien_ich;
    }

    public void setTtb_ten_tien_ich(String ttb_ten_tien_ich) {
        this.ttb_ten_tien_ich = ttb_ten_tien_ich;
    }

    public String getTtb_mo_ta() {
        return ttb_mo_ta;
    }

    public void setTtb_mo_ta(String ttb_mo_ta) {
        this.ttb_mo_ta = ttb_mo_ta;
    }

    public String getTtb_gio_hoat_dong() {
        return ttb_gio_hoat_dong;
    }

    public void setTtb_gio_hoat_dong(String ttb_gio_hoat_dong) {
        this.ttb_gio_hoat_dong = ttb_gio_hoat_dong;
    }
}
