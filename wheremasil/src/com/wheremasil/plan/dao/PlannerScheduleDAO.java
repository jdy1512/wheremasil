package com.wheremasil.plan.dao;

import java.util.List;

import com.wheremasil.plan.vo.Area;

public interface PlannerScheduleDAO {
	public List<Area> selectAreasByRange(Area area);
}
