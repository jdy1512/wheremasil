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
	public ModelAndView planInfo(@RequestParam Map<String, Object> map){
		PlannerSchedule ps = new PlannerSchedule();
		ArrayList<Schedule> scheduleList = new ArrayList<Schedule>();
		
		for(Entry<String, Object> entry: map.entrySet()) {
			
			System.out.println("전체:"+entry); 
			
//			for(int i=1;i<entry.getKey().length();i++){
//				
//				if(entry.getKey().substring(0, 14).equals("scheduleList:"+i)){
//					System.out.println("scheduleList:"+entry); 
////					Schedule schedule = new Schedule();	
////					List<Cost> costList = new ArrayList<Cost>();
//					
//					for(int j=1;j<(entry.getKey().length())/4;j++){
//						Cost cost = new Cost();
//						if(entry.getKey().substring(15, 25).equals("costList:j")){
//							System.out.println(entry); 
//							// cost 값 세팅
//							if(entry.getKey().substring(26,31).equals("costF")){
//								cost.setCostFood((int) entry.getValue());
//							}
//							if(entry.getKey().substring(26,31).equals("costV")){
//								cost.setCostVehicle((int) entry.getValue());
//							}
//							if(entry.getKey().substring(26,31).equals("costS")){
//								cost.setCostStay((int) entry.getValue());
//							}
//							if(entry.getKey().substring(26,31).equals("costE")){
//								cost.setCostEtc((int) entry.getValue());
//							}
//							System.out.println("cost:"+cost);
//							costList.add(j-1, cost); //costList(cost)추가
//						}
//					}//cost셋팅 endDate
//					schedule.setCostList(costList);
//					if(entry.getKey().substring(26,30).equals("memo")){		
//						System.out.println("memo: "+entry); 
////						schedule.setMemo((String) entry.getValue());
//					}
////				   scheduleList.add(i, schedule);
//				}
//				
//			}
//			ps.setScheduleList(scheduleList);
		}
		return null;
	}
}
