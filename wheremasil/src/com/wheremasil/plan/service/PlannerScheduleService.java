package com.wheremasil.plan.service;

import java.util.List;

import com.wheremasil.plan.vo.Area;
import com.wheremasil.plan.vo.PlannerSchedule;


public interface PlannerScheduleService {
	public List<Area> getAreasByRange(Area area);
	public int registArea(Area area);
	public String getAreaIdByName(String name);
	public void registPlanSchedule(PlannerSchedule ps);
	public String getPlanId(String memberId);
}
