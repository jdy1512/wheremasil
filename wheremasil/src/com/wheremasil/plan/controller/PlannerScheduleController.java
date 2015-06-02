package com.wheremasil.plan.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wheremasil.plan.service.PlannerScheduleService;
import com.wheremasil.plan.validator.PlannerScheduleValidator;
import com.wheremasil.plan.vo.Area;
import com.wheremasil.plan.vo.PlannerSchedule;

@Controller
@RequestMapping("plan/")
public class PlannerScheduleController {
	
	@Autowired
	PlannerScheduleService service;

	@RequestMapping("map")
	public ModelAndView showPlannerScheduleMap(@ModelAttribute PlannerSchedule plan, Errors errors, HttpServletRequest request) {
		new PlannerScheduleValidator().validate(plan, errors);
		if(errors.hasErrors()){
			return new ModelAndView("main.tiles", "errors", errors.getAllErrors());
		}
		
		return new ModelAndView("plan/map.tiles", "plan", plan);
	}

	@RequestMapping("getAreasByRange")
	@ResponseBody
	public List<Area> getAreasByRange(@RequestParam double stLat, @RequestParam double stLon, 
			@RequestParam double enLat, @RequestParam double enLon) {
		Area area = new Area();
		area.setStLat(stLat);
		area.setStLon(stLon);
		area.setEnLat(enLat);
		area.setEnLon(enLon);
		return service.getAreasByRange(area);
	}
}
