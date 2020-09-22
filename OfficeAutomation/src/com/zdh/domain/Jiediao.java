package com.zdh.domain;

import com.zdh.utils.CommonsUtils;

public class Jiediao {
    private String year;
    private String month;
    private String username;
    private String ratio;
    private String transfer;

    public Jiediao() {
        this.year = CommonsUtils.getCurrentYear();
        this.month = CommonsUtils.getCurrentMonth();
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRatio() {
        return ratio;
    }

    public void setRatio(String ratio) {
        this.ratio = ratio;
    }

    public String getTransfer() {
        return transfer;
    }

    public void setTransfer(String transfer) {
        this.transfer = transfer;
    }
}
