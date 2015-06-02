package com.wheremasil.plan.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wheremasil.plan.vo.Area;

@Repository("dao")
public class PlannerScheduleDAOImpl implements PlannerScheduleDAO {
	private String namespace="plan.mapper.planMapper.";
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<Area> selectAreasByRange(Area area) {
		return session.selectList(namespace + "selectAreasByRange", area);
	}

}
