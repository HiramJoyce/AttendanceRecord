package com.attendance.record.dao;

import com.attendance.record.domain.Employee;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EmployeeDao {
    Employee selectEmployeeByEmployeeNum(String employeeNum);

    int insertEmployee(Employee employee);

    int updateEmployee(Employee employee);

    List<Employee> selectAllEmployees();
}
