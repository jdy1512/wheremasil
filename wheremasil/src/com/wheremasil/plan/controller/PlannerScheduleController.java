package com.wheremasil.plan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("plan/")
public class PlannerScheduleController {

	@RequestMapping("info")
	public String showInfoView() {
		return "info.do";
	}
	
	
	
}
