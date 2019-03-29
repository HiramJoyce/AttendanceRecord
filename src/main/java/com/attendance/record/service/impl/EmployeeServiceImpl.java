package com.attendance.record.service.impl;

import com.alibaba.druid.util.StringUtils;
import com.attendance.record.dao.EmployeeDao;
import com.attendance.record.domain.Employee;
import com.attendance.record.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeDao employeeDao;

    @Override
    public Employee loginCheck(Employee employee) {
        Employee employeeDB = employeeDao.selectEmployeeByEmployeeNum(employee.getEmployeeNum());
        return StringUtils.equals(employeeDB.getPassword(), employee.getPassword()) ? employeeDB : null;
    }

    @Override
    public boolean registerCheck(Employee employee) {
        return employeeDao.selectEmployeeByEmployeeNum(employee.getEmployeeNum()) == null;
    }

    @Override
    public Employee register(Employee employee) {
        return employeeDao.insertEmployee(employee) > 0 ? employee : null;
    }
}
