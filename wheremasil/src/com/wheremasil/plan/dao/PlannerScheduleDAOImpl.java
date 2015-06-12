package com.wheremasil.plan.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wheremasil.plan.vo.Area;
import com.wheremasil.plan.vo.AreaCost;
import com.wheremasil.plan.vo.PlanDetail;
import com.wheremasil.plan.vo.PlanMap;
import com.wheremasil.plan.vo.PlannerSchedule;
import com.wheremasil.plan.vo.Schedule;

@Repository("dao")
public class PlannerScheduleDAOImpl implements PlannerScheduleDAO {
	private String namespace="plan.mapper.planMapper.";
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<Area> selectAreasByRange(Area area) {
		return session.selectList(namespace + "selectAreasByRange", area);
	}

	@Override
	public int insertArea(Area area) {
		return session.insert(namespace + "insertArea", area);
	}

	@Override
	public String selectAreaIdByName(String name) {
		return session.selectOne(namespace + "selectAreaIdByName", name);
	}

	@Override
	public int insertPlanSchedule(PlannerSchedule ps) {
		return session.insert(namespace + "insertPlanSchedule", ps);
	}

	@Override
	public String selectPlanId(String memberId) {
		return session.selectOne(namespace + "selectPlanId", memberId);
	}

	@Override
	public int insertSchedule(Schedule schedule) {
		return session.insert(namespace + "insertSchedule", schedule);
	}

	@Override
	public int updateScheduleByMemo(Schedule schedule) {
		return session.update(namespace + "updateScheduleByMemo", schedule);
	}

	@Override
	public int insertAreaCost(AreaCost ac) {
		return session.insert(namespace + "insertAreaCost", ac);
	}

	@Override
	public List<PlanDetail> selectPlanDetails(String planId) {
		return session.selectList(namespace + "selectPlanDetails", planId);
	}

	@Override
	public List<PlanMap> selectPlanIdListByNum(int num) {
		return session.selectList(namespace + "selectPlanIdListByNum", num);
	}

	@Override
	public List<PlanMap> selectPlanMapList(List<String> planIdList) {
		return session.selectList(namespace + "selectPlanMapList", planIdList);
	}

}
