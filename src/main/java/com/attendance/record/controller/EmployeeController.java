package com.attendance.record.controller;

import com.attendance.record.domain.Employee;
import com.attendance.record.domain.Leave;
import com.attendance.record.service.EmployeeService;
import com.attendance.record.service.LeaveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("employee")
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private LeaveService leaveService;

    @RequestMapping("")
    public String index(Model model, HttpSession session) {
        List<Leave> leaves = leaveService.getMyLeaves((String) session.getAttribute("employeeNum"));
        System.out.println(leaves);
        model.addAttribute("leaves", leaves);
        return "admin/index";
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(Employee employee, HttpSession session) {
        System.out.println("-> employee -> login -> " + employee);
        Employee employeeDB = employeeService.loginCheck(employee);
        if (employeeDB != null) {
            session.setAttribute("id", employeeDB.getId());
            session.setAttribute("employeeNum", employeeDB.getEmployeeNum());
            session.setAttribute("realName", employeeDB.getRealName());
            return "redirect:/employee";
        }
        return "redirect:/";
    }

    @RequestMapping(value = "register", method = RequestMethod.POST)
    public String register(Employee employee, HttpSession session) {
        if (employeeService.registerCheck(employee)) {
            employee.setId(UUID.randomUUID().toString().replaceAll("-", ""));
            if (employeeService.register(employee) != null) {
                session.setAttribute("id", employee.getId());
                session.setAttribute("realName", employee.getRealName());
                return "admin/index";
            }
        }
        return "redirect:/";
    }
}
