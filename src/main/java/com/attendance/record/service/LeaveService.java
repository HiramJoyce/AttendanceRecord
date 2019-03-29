package com.attendance.record.service;

import com.attendance.record.domain.Leave;

import java.util.List;

public interface LeaveService {

    int createLeave(Leave leave);

    List<Leave> getMyLeaves(String employeeNum);
}
