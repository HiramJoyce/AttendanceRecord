package com.attendance.record.dao;

import com.attendance.record.domain.Leave;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LeaveDao {
    int insertLeave(Leave leave);

    Leave selectLeaveById(String id);

    List<Leave> selectLeavesByEmployeeNum(String employeeNum);
}
