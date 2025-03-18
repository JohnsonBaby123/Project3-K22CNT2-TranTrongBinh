package com.springmvc.beans;

public class TtbCuDan {
    private int ttb_ma_cu_dan;
    private int ttb_ma_nguoi_dung;
    private int ttb_ma_can_ho;
    // 1 = Chủ hộ, 2 = Người thuê, 3 = Thành viên gia đình
    private byte ttb_quan_he;  

    public TtbCuDan() {}

    public TtbCuDan(int ttb_ma_cu_dan, int ttb_ma_nguoi_dung, int ttb_ma_can_ho, byte ttb_quan_he) {
        this.ttb_ma_cu_dan = ttb_ma_cu_dan;
        this.ttb_ma_nguoi_dung = ttb_ma_nguoi_dung;
        this.ttb_ma_can_ho = ttb_ma_can_ho;
        this.ttb_quan_he = ttb_quan_he;
    }

    public int getTtb_ma_cu_dan() {
        return ttb_ma_cu_dan;
    }

    public void setTtb_ma_cu_dan(int ttb_ma_cu_dan) {
        this.ttb_ma_cu_dan = ttb_ma_cu_dan;
    }

    public int getTtb_ma_nguoi_dung() {
        return ttb_ma_nguoi_dung;
    }

    public void setTtb_ma_nguoi_dung(int ttb_ma_nguoi_dung) {
        this.ttb_ma_nguoi_dung = ttb_ma_nguoi_dung;
    }

    public int getTtb_ma_can_ho() {
        return ttb_ma_can_ho;
    }

    public void setTtb_ma_can_ho(int ttb_ma_can_ho) {
        this.ttb_ma_can_ho = ttb_ma_can_ho;
    }

    public byte getTtb_quan_he() {
        return ttb_quan_he;
    }

    public void setTtb_quan_he(byte ttb_quan_he) {
        this.ttb_quan_he = ttb_quan_he;
    }
}
