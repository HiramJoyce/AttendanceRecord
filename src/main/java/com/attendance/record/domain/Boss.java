package com.attendance.record.domain;

public class Boss {
    private String id;
    private String bossNum;
    private String realName;
    private String password;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getBossNum() {
        return bossNum;
    }

    public void setBossNum(String bossNum) {
        this.bossNum = bossNum;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Boss{" +
                "id='" + id + '\'' +
                ", bossNum='" + bossNum + '\'' +
                ", realName='" + realName + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
