package com.wheremasil.plan.controller;

import java.util.List;
import java.util.Map;

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

	@RequestMapping("registArea")
	@ResponseBody
	public String registArea(@RequestParam String title, @RequestParam String address, @RequestParam String imageUrl, @RequestParam String latitude, @RequestParam String longitude, HttpServletRequest request) {
		Area area = new Area();
		area.setTitle(title);
		area.setAddress(address);
		area.setLatitude(latitude);
		area.setLongitude(longitude);
		area.setImgPath(imageUrl);
		
		// area 등록 - image 저장 - id 추출 module
		// 백업 이미지 작업 url
		String workspaceImageUrl = "C:/Users/KOSTA_03_001_/Desktop/wheremasil_master/wheremasil/wheremasil/WebContent/uploads/images/area";
		String id = service.registAreaTran(area, title, imageUrl, workspaceImageUrl, request);
		
		return id;
	}
	
	@RequestMapping("planInfo")
	public ModelAndView planInfo(@RequestParam Map<String, Object> params, HttpServletRequest request) {
		PlannerSchedule plan = null;
		request.getSession().setAttribute("login_info", "admin@wheremasil.com");
		
		try {
			plan = service.registPlanScheduleTran(params, request);
		} catch (Exception e) {
			e.printStackTrace();
			return new ModelAndView("plan/map.tiles", "plan", plan);
		}
		
		return new ModelAndView("main.tiles", "plan", plan);
	}
}