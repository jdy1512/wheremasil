package com.wheremasil.plan.dao;

import java.util.List;

import com.wheremasil.plan.vo.Area;
import com.wheremasil.plan.vo.PlannerSchedule;

public interface PlannerScheduleDAO {
	public List<Area> selectAreasByRange(Area area);
	public abstract int registPlanSchedule(PlannerSchedule ps);
	public abstract String getPlanId(String memberId);
}
