package com.wheremasil.plan.dao;

import java.util.List;

import com.wheremasil.plan.vo.Area;
import com.wheremasil.plan.vo.AreaCost;
import com.wheremasil.plan.vo.PlannerSchedule;
import com.wheremasil.plan.vo.Schedule;

public interface PlannerScheduleDAO {
	public List<Area> selectAreasByRange(Area area);
	public int insertArea(Area area);
	public String selectAreaIdByName(String name);
	
	public int insertPlanSchedule(PlannerSchedule ps);
	public abstract String selectPlanId(String memberId);
	public int insertSchedule(Schedule schedule);
	public int updateScheduleByMemo(Schedule schedule);
	public int insertAreaCost(AreaCost ac);
}
