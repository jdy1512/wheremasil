package com.wheremasil.plan.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wheremasil.plan.validator.PlannerScheduleValidator;
import com.wheremasil.plan.vo.PlannerSchedule;

@Controller
@RequestMapping("plan/")
public class PlannerScheduleController {

	@RequestMapping("map")
	public ModelAndView showPlannerScheduleMap(@ModelAttribute PlannerSchedule plan, Errors errors, HttpServletRequest request) {
		new PlannerScheduleValidator().validate(plan, errors);
		if(errors.hasErrors()){
			return new ModelAndView("main.tiles", "errors", errors.getAllErrors());
		}
		
		return new ModelAndView("plan/map.tiles", "plan", plan);
	}
	
	@RequestMapping("getAllAreas")
	@ResponseBody
	public Map<String, Object> getAreas() {
		Map<String, Object> map = new HashMap<String, Object>();
		
		return map;
	}
}
