package com.wheremasil.plan.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

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
import com.wheremasil.plan.vo.Cost;
import com.wheremasil.plan.vo.PlannerSchedule;
import com.wheremasil.plan.vo.Schedule;

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
	
	// 수정중
	@RequestMapping("planInfo")
	public ModelAndView planInfo(@RequestParam Map<String, Object> map,HttpServletRequest request){
		request.getSession().setAttribute("login_info", "qwer");
		PlannerSchedule ps = new PlannerSchedule();
		ArrayList<Schedule> scheduleList = new ArrayList<Schedule>();
		Schedule schedule = null;
		ArrayList<Cost> costList = null;
		ArrayList<Area> areaList = null;
		Cost cost = null;
		Area area = null;
		
		ps.setTitle((String) map.get("title"));
		ps.setTheme((String) map.get("theme"));
		ps.setStartDate((String) map.get("startDate"));
		ps.setEndDate((String) map.get("endDate"));
		ps.setGroupNum(Integer.parseInt((String) map.get("groupNum")));
		ps.setMemberId((String) request.getSession().getAttribute("login_info"));
		
		map.remove("title");
		map.remove("theme");
		map.remove("startDate");
		map.remove("endDate");
		map.remove("groupNum");
		
		// System.out.println(ps);
		int curScheduleIdx = -1;
		int curCostIdx = -1;
		for(Entry<String, Object> entry: map.entrySet()) {
		//	System.err.println(entry);
			String[] keySplit = ((String) entry.getKey()).split(",");
			int scheduleIdx = Integer.parseInt(keySplit[0].split(":")[1]);
			int costIdx = Integer.parseInt(keySplit[1].split(":")[1]);
			String key = keySplit[2];
			String value = (String) entry.getValue();
			
			if (curScheduleIdx != scheduleIdx) {
				if (curScheduleIdx != -1) {
					costList.add(cost);
					areaList.add(area);
					schedule.setCostList(costList);
					schedule.setAreaList(areaList);
					scheduleList.add(schedule);
					//System.out.println(schedule);
				}
				curScheduleIdx = scheduleIdx;
				curCostIdx = -1;
				schedule = new Schedule();
				costList = new ArrayList<Cost>();
				areaList = new ArrayList<Area>();
			}
			
			if (curCostIdx != costIdx && costIdx != 0) {
				if (curCostIdx != -1) {
					costList.add(cost);
					areaList.add(area);
				}
				curCostIdx = costIdx;
				cost = new Cost();
				area = new Area();
			}
			
			if(key.equals("costFood")){
				cost.setCostFood(Integer.parseInt(value));
			} else if(key.equals("costVehicle")){
				cost.setCostVehicle(Integer.parseInt(value));
			} else if(key.equals("costStay")){
				cost.setCostStay(Integer.parseInt(value));
			} else if(key.equals("costEtc")){
				cost.setCostEtc(Integer.parseInt(value));
			} else if(key.equals("memo")){
				schedule.setMemo(value);
			}
		}// end of for
		// 마지막 값들
		costList.add(cost);
		areaList.add(area);
		schedule.setCostList(costList);
		schedule.setAreaList(areaList);
		scheduleList.add(schedule);
	//	System.out.println(schedule);

		ps.setScheduleList(scheduleList);
		System.out.println(ps);
		service.registPlanSchedule(ps);
		schedule.setPlanId(service.getPlanId(ps.getMemberId()));
		
		
		
		
		//return new ModelAndView("plan/map.tiles", "plannerSchedule", ps);
		return null;
	}
}
