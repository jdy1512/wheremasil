package com.wheremasil.plan.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wheremasil.plan.vo.Area;
import com.wheremasil.plan.vo.PlannerSchedule;

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
	public int registPlanSchedule(PlannerSchedule ps) {
		// TODO Auto-generated method stub
		return session.insert(namespace+"registPlanSchedule",ps);
	}

	@Override
	public String getPlanId(String memberId) {
	
		return session.selectOne(namespace+"getPlanId",memberId);
	}

}
