package com.attendance.record.service;

import com.attendance.record.domain.Employee;

public interface EmployeeService {
    Employee loginCheck(Employee employee);

    boolean registerCheck(Employee employee);

    Employee register(Employee employee);
}
