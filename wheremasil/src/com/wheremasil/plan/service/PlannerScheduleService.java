package com.wheremasil.plan.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.wheremasil.plan.vo.Area;
import com.wheremasil.plan.vo.AreaCost;
import com.wheremasil.plan.vo.PlanDetail;
import com.wheremasil.plan.vo.PlannerSchedule;
import com.wheremasil.plan.vo.Schedule;


public interface PlannerScheduleService {
	public List<Area> getAreasByRange(Area area);
	public int registArea(Area area);
	public String getAreaIdByName(String name);
	public String registAreaTran(Area area, String name, String imageUrl, String workspaceImageUrl, HttpServletRequest request);
	
	public int registPlanSchedule(PlannerSchedule ps);
	public String getPlanId(String memberId);
	public int registSchedule(Schedule schedule);
	public int setScheduleByMemo(Schedule schedule);
	public int registAreaCost(AreaCost ac);
	public PlannerSchedule registPlanScheduleTran(Map<String, Object> params, HttpServletRequest request) throws Exception;
	
	public List<PlanDetail> getPlanDetails(String planId);
}
