package org.example;

public class Goods {
    private int goodspk;
    private String gnum;
    private int categorypk;
    private String gnm;
    private int price;
    private int quantity;
    private String rdt;
    private int isdel;

    private String img;
    private int defaultimage;

    public int getDefaultimage() {
        return defaultimage;
    }

    public void setDefaultimage(int defaultimage) {
        this.defaultimage = defaultimage;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getGoodspk() {
        return goodspk;
    }

    public void setGoodspk(int goodspk) {
        this.goodspk = goodspk;
    }

    public String getGnum() {
        return gnum;
    }

    public void setGnum(String gnum) {
        this.gnum = gnum;
    }

    public int getCategorypk() {
        return categorypk;
    }

    public void setCategorypk(int categorypk) {
        this.categorypk = 0;
    }

    public String getGnm() {
        return gnm;
    }

    public void setGnm(String gnm) {
        this.gnm = gnm;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getRdt() {
        return rdt;
    }

    public void setRdt(String rdt) {
        this.rdt = rdt;
    }

    public int getIsdel() {
        return isdel;
    }

    public void setIsdel(int isdel) {
        this.isdel = isdel;
    }
}
