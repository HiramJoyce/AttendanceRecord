package com.attendance.record.service.impl;

import com.alibaba.druid.util.StringUtils;
import com.attendance.record.dao.EmployeeDao;
import com.attendance.record.domain.Employee;
import com.attendance.record.domain.Leave;
import com.attendance.record.service.EmployeeService;
import com.attendance.record.service.LeaveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeDao employeeDao;

	@Autowired
	private LeaveService leaveService;

	@Override
	public Employee loginCheck(Employee employee) {
		Employee employeeDB = employeeDao.selectEmployeeByEmployeeNum(employee.getEmployeeNum());
		return (employeeDB != null && StringUtils.equals(employeeDB.getPassword(), employee.getPassword())) ? employeeDB : null;
	}

	@Override
	public boolean registerCheck(Employee employee) {
		return employeeDao.selectEmployeeByEmployeeNum(employee.getEmployeeNum()) == null;
	}

	@Override
	public Employee register(Employee employee) {
		return employeeDao.insertEmployee(employee) > 0 ? employee : null;
	}

	@Override
	public Employee getEmployeeByEmployeeNum(String employeeNum) {
		return employeeDao.selectEmployeeByEmployeeNum(employeeNum);
	}

	@Override
	public int updateEmployee(Employee employee) {
		return employeeDao.updateEmployee(employee);
	}

	@Override
	public Map<String, List<Employee>> getEmployeeRecord() {
		Map<String, List<Employee>> map = new LinkedHashMap<>();
		List<Employee> employees = employeeDao.selectAllEmployees();
		List<Employee> fullEmployees = new ArrayList<>();
		List<Employee> notFullEmployees = new ArrayList<>();
		for (Employee employee : employees) {
			String employeeNum = employee.getEmployeeNum();
			List<Leave> leaves = leaveService.getLeavesByEmployeeNumMonth(employeeNum,
					Calendar.getInstance().get(Calendar.MONTH));
			if (leaves != null && leaves.size() > 0) {
				notFullEmployees.add(employee);
			} else {
				fullEmployees.add(employee);
			}
		}
		map.put("fullEmployees", fullEmployees);
		map.put("notFullEmployees", notFullEmployees);
		return map;
	}
}
