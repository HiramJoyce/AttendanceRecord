package com.attendance.record.dao;

import com.attendance.record.domain.Leave;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface LeaveDao {
    int insertLeave(Leave leave);

    Leave selectLeaveById(String id);

    List<Leave> selectLeavesByEmployeeNum(String employeeNum);

    int updateLeave(Leave leaveDB);

    int deleteLeaveById(String id);

    Leave selectLeavesByEmployeeNumAndDate(@Param("employeeNum") String employeeNum, @Param("startDate") String startDate);

    List<Leave> selectLeavesByEmployeeNumMonth(@Param("employeeNum") String employeeNum, @Param("start") Date start, @Param("end") Date end);

    List<Leave> selectLeavesState(String state);

    List<Leave> selectLeaves();

    int updateLeaveState(@Param("id") String id, @Param("state") String state);
}
