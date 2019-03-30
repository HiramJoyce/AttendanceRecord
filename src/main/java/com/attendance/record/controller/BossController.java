package com.attendance.record.controller;

import com.alibaba.druid.util.StringUtils;
import com.alibaba.fastjson.JSONObject;
import com.attendance.record.domain.Boss;
import com.attendance.record.domain.Employee;
import com.attendance.record.domain.Leave;
import com.attendance.record.service.BossService;
import com.attendance.record.service.EmployeeService;
import com.attendance.record.service.LeaveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("boss")
public class BossController {

    @Autowired
    private BossService bossService;
    @Autowired
    private LeaveService leaveService;
    @Autowired
    private EmployeeService employeeService;

    @RequestMapping("")
    public String index(Model model) {
        Map<String, List<Employee>> map = employeeService.getEmployeeRecord();
        List<Employee> fullEmployees = map.get("fullEmployees");
        List<Employee> notFullEmployees = map.get("notFullEmployees");
        model.addAttribute("fullEmployees", fullEmployees);
        model.addAttribute("notFullEmployees", notFullEmployees);
        return "boss/index";
    }

    @RequestMapping("leaves")
    public String leaves(Model model) {
        List<Leave> leaves = leaveService.getLeaves();
        model.addAttribute("leaves", leaves);
        return "boss/leaves";
    }

    @RequestMapping("login")
    public String login() {
        return "boss/login";
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(Boss boss, HttpSession session) {
        System.out.println("-> boss -> login -> " + boss);
        Boss bossDB = bossService.loginCheck(boss);
        if (bossDB != null) {
            session.setAttribute("id", bossDB.getId());
            session.setAttribute("employeeNum", bossDB.getBossNum());
            session.setAttribute("realName", bossDB.getRealName());
            return "redirect:/boss";
        }
        return "redirect:/boss/login";
    }

    @RequestMapping("apply")
    public String apply(String id, String see, Model model) {
        if (see != null && StringUtils.equals(see, "1")) {
            model.addAttribute("see", "1");
        }
        model.addAttribute("leave", leaveService.getLeaveById(id));
        return "boss/leave";
    }

    @RequestMapping("pass")
    public String passLeave(String id) {
        leaveService.passLeave(id);
        return "redirect:/boss/leaves";
    }
}
