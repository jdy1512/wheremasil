package com.wheremasil.plan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wheremasil.plan.dao.PlannerScheduleDAOImpl;
import com.wheremasil.plan.vo.Area;

@Component("service")
public class PlannerScheduleServiceImpl implements PlannerScheduleService{
	
	@Autowired
	PlannerScheduleDAOImpl dao;

	@Override
	public List<Area> getAreasByRange(Area area) {
		return dao.selectAreasByRange(area);
	}

	@Override
	public int registArea(Area area) {
		return dao.insertArea(area);
	}

	@Override
	public String getAreaIdByName(String name) {
		return dao.selectAreaIdByName(name);
	}
	
}
