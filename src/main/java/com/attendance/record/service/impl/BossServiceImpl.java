package com.attendance.record.service.impl;

import com.alibaba.druid.util.StringUtils;
import com.attendance.record.dao.BossDao;
import com.attendance.record.dao.EmployeeDao;
import com.attendance.record.domain.Boss;
import com.attendance.record.domain.Employee;
import com.attendance.record.service.BossService;
import com.attendance.record.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BossServiceImpl implements BossService {

    @Autowired
    private BossDao bossDao;

    @Override
    public Boss loginCheck(Boss boss) {
        Boss employeeDB = bossDao.selectBossByBossNum(boss.getBossNum());
        return StringUtils.equals(employeeDB.getPassword(), boss.getPassword()) ? employeeDB : null;
    }
}
