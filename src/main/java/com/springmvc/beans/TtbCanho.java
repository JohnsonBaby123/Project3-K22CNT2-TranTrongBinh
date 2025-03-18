package com.springmvc.beans;

public class TtbCanHo {
    private int ttb_ma_can_ho;
    private String ttb_so_can_ho;
    private byte ttb_tang;
    private String ttb_loai_can_ho;
    private float ttb_dien_tich;
    private byte ttb_trang_thai;
    private int ttb_chu_ho_id;

    public TtbCanHo() {}

    public TtbCanHo(int ttb_ma_can_ho, String ttb_so_can_ho, byte ttb_tang, String ttb_loai_can_ho, float ttb_dien_tich, byte ttb_trang_thai, int ttb_chu_ho_id) {
        this.ttb_ma_can_ho = ttb_ma_can_ho;
        this.ttb_so_can_ho = ttb_so_can_ho;
        this.ttb_tang = ttb_tang;
        this.ttb_loai_can_ho = ttb_loai_can_ho;
        this.ttb_dien_tich = ttb_dien_tich;
        this.ttb_trang_thai = ttb_trang_thai;
        this.ttb_chu_ho_id = ttb_chu_ho_id;
    }

    public int getTtb_ma_can_ho() {
        return ttb_ma_can_ho;
    }

    public void setTtb_ma_can_ho(int ttb_ma_can_ho) {
        this.ttb_ma_can_ho = ttb_ma_can_ho;
    }

    public String getTtb_so_can_ho() {
        return ttb_so_can_ho;
    }

    public void setTtb_so_can_ho(String ttb_so_can_ho) {
        this.ttb_so_can_ho = ttb_so_can_ho;
    }

    public byte getTtb_tang() {
        return ttb_tang;
    }

    public void setTtb_tang(byte ttb_tang) {
        this.ttb_tang = ttb_tang;
    }

    public String getTtb_loai_can_ho() {
        return ttb_loai_can_ho;
    }

    public void setTtb_loai_can_ho(String ttb_loai_can_ho) {
        this.ttb_loai_can_ho = ttb_loai_can_ho;
    }

    public float getTtb_dien_tich() {
        return ttb_dien_tich;
    }

    public void setTtb_dien_tich(float ttb_dien_tich) {
        this.ttb_dien_tich = ttb_dien_tich;
    }

    public byte getTtb_trang_thai() {
        return ttb_trang_thai;
    }

    public void setTtb_trang_thai(byte ttb_trang_thai) {
        this.ttb_trang_thai = ttb_trang_thai;
    }

    public int getTtb_chu_ho_id() {
        return ttb_chu_ho_id;
    }

    public void setTtb_chu_ho_id(int ttb_chu_ho_id) {
        this.ttb_chu_ho_id = ttb_chu_ho_id;
    }
}
