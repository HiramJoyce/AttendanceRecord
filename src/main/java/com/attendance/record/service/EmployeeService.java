package com.attendance.record.service;

import com.attendance.record.domain.Employee;

import java.util.List;
import java.util.Map;

public interface EmployeeService {
    Employee loginCheck(Employee employee);

    boolean registerCheck(Employee employee);

    Employee register(Employee employee);

    Employee getEmployeeByEmployeeNum(String employeeNum);

    int updateEmployee(Employee employee);

    Map<String, List<Employee>> getEmployeeRecord();
}
