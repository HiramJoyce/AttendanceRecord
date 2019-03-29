package com.attendance.record.controller;

import com.attendance.record.domain.Leave;
import com.attendance.record.service.LeaveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.UUID;

@Controller
@RequestMapping("leave")
public class LeaveController {

    @Autowired
    private LeaveService leaveService;

    @RequestMapping("apply")
    public String apply() {
        return "admin/apply";
    }

    @RequestMapping(value = "apply", method = RequestMethod.POST)
    public String apply(Leave leave) {
        leave.setId(UUID.randomUUID().toString().replaceAll("-", ""));
        leave.setState(1);
        System.out.println("leave -> apply -> " + leave);
        leaveService.createLeave(leave);
        return "redirect:/employee";
    }
}
