package com.attendance.record.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.attendance.record.dao.LeaveDao;
import com.attendance.record.domain.Leave;
import com.attendance.record.service.LeaveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
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

    @Override
    public Leave getLeaveById(String id) {
        return leaveDao.selectLeaveById(id);
    }

    @Override
    public Leave updateLeave(Leave leaveDB) {
        return leaveDao.updateLeave(leaveDB) > 0 ? leaveDB : null;
    }

    @Override
    public int deleteLeaveById(String id) {
        return leaveDao.deleteLeaveById(id);
    }

    @Override
    public JSONObject getAttendanceRecord(String employeeNum) {
        JSONObject json = new JSONObject();
        JSONArray qqDate = new JSONArray();
        JSONArray zcDate = new JSONArray();
        int type1 = 0;
        int type2 = 0;
        int type3 = 0;
        int type4 = 0;
        int type5 = 0;
        int type6 = 0;
        JSONObject now;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar instanceNow = Calendar.getInstance();
        Calendar instance = Calendar.getInstance();
        Calendar instanceLeave = Calendar.getInstance();
        Calendar instanceLeaveEnd = Calendar.getInstance();
        instance.set(Calendar.DAY_OF_MONTH, 1);
        Leave leave;
        while (instance.before(instanceNow)) {
            leave = leaveDao.selectLeavesByEmployeeNumAndDate(employeeNum, sdf.format(instance.getTime()));
            if (leave != null) {
                instanceLeave.setTime(leave.getStartDate());
                instanceLeaveEnd.setTime(leave.getEndDate());
                while (instanceLeave.before(instanceLeaveEnd) && instanceLeave.before(instanceNow)) {
                    if (instanceLeave.get(Calendar.DAY_OF_WEEK) != Calendar.SATURDAY && instanceLeave.get(Calendar.DAY_OF_WEEK) != Calendar.SUNDAY) {
                        switch (leave.getType()) {
                            case 1:
                                type1++;
                                break;
                            case 2:
                                type2++;
                                break;
                            case 3:
                                type3++;
                                break;
                            case 4:
                                type4++;
                                break;
                            case 5:
                                type5++;
                                break;
                            case 6:
                                type6++;
                                break;
                        }
                        now = new JSONObject();
                        now.put("time", sdf.format(instanceLeave.getTime()));
                        qqDate.add(now);
                    }
                    instanceLeave.add(Calendar.DAY_OF_MONTH, 1);
                }
                instanceLeave.add(Calendar.DAY_OF_MONTH, -1);
                instance.setTime(instanceLeave.getTime());
            } else {
                if (instance.get(Calendar.DAY_OF_WEEK) != Calendar.SATURDAY && instance.get(Calendar.DAY_OF_WEEK) != Calendar.SUNDAY) {
                    now = new JSONObject();
                    now.put("time", sdf.format(instance.getTime()));
                    zcDate.add(now);
                }
            }
            instance.add(Calendar.DAY_OF_MONTH, 1);
        }
        json.put("qqDate", qqDate);
        json.put("zcDate", zcDate);
        json.put("type1", type1);
        json.put("type2", type2);
        json.put("type3", type3);
        json.put("type4", type4);
        json.put("type5", type5);
        json.put("type6", type6);
        System.out.println(json.toJSONString());
        return json;
    }

    @Override
    public List<Leave> getLeavesByEmployeeNumMonth(String employeeNum, int monthNum) {
        Calendar start = Calendar.getInstance();
        start.set(Calendar.MONTH, monthNum == 0 ? 11 : monthNum);
        start.set(Calendar.DAY_OF_MONTH, 1);
        Calendar end = Calendar.getInstance();
        end.set(Calendar.MONTH, monthNum == 0 ? 11 : monthNum);
        end.set(Calendar.DAY_OF_MONTH, 1);
        end.roll(Calendar.DAY_OF_MONTH, -1);
        return leaveDao.selectLeavesByEmployeeNumMonth(employeeNum, start.getTime(), end.getTime());
    }
    
    @Override
    public List<Leave> getLeavesByEmployeeNumYearMonth(String employeeNum, int yearNum, int monthNum) {
        Calendar start = Calendar.getInstance();
        start.set(Calendar.YEAR, yearNum);
        start.set(Calendar.MONTH, monthNum == 0 ? 11 : monthNum);
        start.set(Calendar.DAY_OF_MONTH, 1);
        Calendar end = Calendar.getInstance();
        end.set(Calendar.YEAR, yearNum);
        end.set(Calendar.MONTH, monthNum == 0 ? 11 : monthNum);
        end.set(Calendar.DAY_OF_MONTH, 1);
        end.roll(Calendar.DAY_OF_MONTH, -1);
        return leaveDao.selectLeavesByEmployeeNumMonth(employeeNum, start.getTime(), end.getTime());
    }

    @Override
    public List<Leave> getUnckeckLeaves() {
        return leaveDao.selectLeavesState("1");
    }

    @Override
    public List<Leave> getLeaves() {
        return leaveDao.selectLeaves();
    }

    @Override
    public int passLeave(String id) {
        return leaveDao.updateLeaveState(id, "2");
    }

    public static void main(String[] args) {
        int month = 2;
        Calendar start = Calendar.getInstance();
        start.set(Calendar.DAY_OF_MONTH, 1);
        Calendar end = Calendar.getInstance();
        end.set(Calendar.DAY_OF_MONTH, 1);
        end.roll(Calendar.DAY_OF_MONTH, -1);
        System.out.println(start.getTime());
        System.out.println(end.getTime());
        System.out.println(String.valueOf(Calendar.getInstance().get(Calendar.YEAR)) + "-" + (month < 10 ? "0" + month : month));
    }
}
