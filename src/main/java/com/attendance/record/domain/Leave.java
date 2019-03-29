package com.attendance.record.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 请假
 */
public class Leave {
    private String id;
    private Integer type;   // 类型   1病假 2事假 3年假 4调休 5婚丧假 6产假护理假
    private String reason;  // 原因说明
    private String employeeNum; // 员工编号
    private String realName;    // 员工姓名
    private Date startDate; // 开始日
    private Date endDate;   // 结束日
    private Integer dayCount;   // 天数
    private Integer state;  // 1申请中 2已通过

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getEmployeeNum() {
        return employeeNum;
    }

    public void setEmployeeNum(String employeeNum) {
        this.employeeNum = employeeNum;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public Date getStartDate() {
        return startDate;
    }

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Integer getDayCount() {
        return dayCount;
    }

    public void setDayCount(Integer dayCount) {
        this.dayCount = dayCount;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "Leave{" +
                "id='" + id + '\'' +
                ", type=" + type +
                ", reason='" + reason + '\'' +
                ", employeeNum='" + employeeNum + '\'' +
                ", realName='" + realName + '\'' +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", dayCount=" + dayCount +
                ", state=" + state +
                '}';
    }
}
