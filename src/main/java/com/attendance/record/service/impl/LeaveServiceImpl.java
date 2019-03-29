package com.attendance.record.service.impl;

import com.attendance.record.dao.LeaveDao;
import com.attendance.record.domain.Leave;
import com.attendance.record.service.LeaveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LeaveServiceImpl implements LeaveService {

    @Autowired
    private LeaveDao leaveDao;

    @Override
    public int createLeave(Leave leave) {
        return leaveDao.insertLeave(leave);
    }

    @Override
    public List<Leave> getMyLeaves(String employeeNum) {
        return leaveDao.selectLeavesByEmployeeNum(employeeNum);
    }
}
