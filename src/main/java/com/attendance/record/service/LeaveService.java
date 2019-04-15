package com.attendance.record.service;

import com.alibaba.fastjson.JSONObject;
import com.attendance.record.domain.Leave;

import java.util.List;

public interface LeaveService {

    int createLeave(Leave leave);

    List<Leave> getMyLeaves(String employeeNum);

    Leave getLeaveById(String id);

    Leave updateLeave(Leave leaveDB);

    int deleteLeaveById(String id);

    JSONObject getAttendanceRecord(String employeeNum);

    List<Leave> getLeavesByEmployeeNumMonth(String employeeNum, int i);
    
    List<Leave> getLeavesByEmployeeNumYearMonth(String employeeNum, int year, int month);

    List<Leave> getUnckeckLeaves();

    List<Leave> getLeaves();

    int passLeave(String id);
}
