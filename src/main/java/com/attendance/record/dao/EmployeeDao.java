package com.attendance.record.dao;

import com.attendance.record.domain.Employee;
import org.springframework.stereotype.Repository;

@Repository
public interface EmployeeDao {
    Employee selectEmployeeByEmployeeNum(String employeeNum);

    int insertEmployee(Employee employee);
}
