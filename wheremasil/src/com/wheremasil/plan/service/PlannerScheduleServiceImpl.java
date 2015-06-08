package com.wheremasil.plan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wheremasil.plan.dao.PlannerScheduleDAOImpl;
import com.wheremasil.plan.vo.Area;
import com.wheremasil.plan.vo.AreaCost;
import com.wheremasil.plan.vo.PlannerSchedule;
import com.wheremasil.plan.vo.Schedule;

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

	@Override
	public int registPlanSchedule(PlannerSchedule ps) {
		return dao.insertPlanSchedule(ps);
	}

	@Override
	public String getPlanId(String memberId) {
		return dao.selectPlanId(memberId);
	}

	@Override
	public int registSchedule(Schedule schedule) {
		return dao.insertSchedule(schedule);
	}

	@Override
	public int setScheduleByMemo(Schedule schedule) {
		return dao.updateScheduleByMemo(schedule);
	}

	@Override
	public int registAreaCost(AreaCost ac) {
		return dao.insertAreaCost(ac);
	}

}
