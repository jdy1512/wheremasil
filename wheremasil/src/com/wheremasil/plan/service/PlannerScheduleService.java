package com.wheremasil.plan.service;

import java.util.List;

import com.wheremasil.plan.vo.Area;
import com.wheremasil.plan.vo.PlannerSchedule;


public interface PlannerScheduleService {
	public List<Area> getAreasByRange(Area area);
	public void registPlanSchedule(PlannerSchedule ps);
	public String getPlanId(String memberId);
}
