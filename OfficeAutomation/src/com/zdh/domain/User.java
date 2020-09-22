package com.zdh.domain;

public class User {
    private String username;
    private String password;
    private String name;
    private int groupId;
    private int power;
    private int transfer;
    private int inuse;

    public User() {
        this.transfer = 0;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    public int getPower() {
        return power;
    }

    public void setPower(int power) {
        this.power = power;
    }

    public int getTransfer() {
        return transfer;
    }

    public void setTransfer(int transfer) {
        this.transfer = transfer;
    }

    public int getInuse() {
        return inuse;
    }

    public void setInuse(int inuse) {
        this.inuse = inuse;
    }
}
