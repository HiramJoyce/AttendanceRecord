package com.attendance.record.controller;

import com.alibaba.druid.util.StringUtils;
import com.attendance.record.domain.Leave;
import com.attendance.record.service.LeaveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.UUID;

@Controller
@RequestMapping("leave")
public class LeaveController {

    @Autowired
    private LeaveService leaveService;

    @RequestMapping("apply")
    public String apply(String id, String see, Model model) {
        Leave leave;
        if (see != null && StringUtils.equals(see, "1")) {
            model.addAttribute("see", "1");
        }
        if (id != null) {
            leave = leaveService.getLeaveById(id);
            if (leave != null) {
                model.addAttribute("leave", leave);
                return "admin/apply";
            }
        }
        model.addAttribute("leave", new Leave());
        return "admin/apply";
    }

    @RequestMapping(value = "apply", method = RequestMethod.POST)
    public String apply(Leave leave) {
        if (leave.getId() == null || StringUtils.equals(leave.getId(), "")) {
            leave.setId(UUID.randomUUID().toString().replaceAll("-", ""));
            leave.setState(1);
            System.out.println("leave -> apply -> " + leave);
            leaveService.createLeave(leave);
        } else {
            leave.setState(1);
            System.out.println("leave -> update -> " + leave);
            leaveService.updateLeave(leave);
        }
        return "redirect:/employee";
    }

    @RequestMapping("callback")
    public String callbackLeave(String id) {
        if (id != null) {
            leaveService.deleteLeaveById(id);
        }
        return "redirect:/employee";
    }
}
