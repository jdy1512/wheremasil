package com.wheremasil.plan.service;

import java.util.List;

import com.wheremasil.plan.vo.Area;


public interface PlannerScheduleService {
	public List<Area> getAreasByRange(Area area);
}
