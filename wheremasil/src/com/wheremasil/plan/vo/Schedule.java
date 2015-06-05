package com.wheremasil.plan.vo;

import java.io.Serializable;
import java.util.List;

public class Schedule implements Serializable {
	private List<Cost> costList;
	private List<Area> areaList;
	private String memo;
	private String planId;

	public Schedule(){}
	public Schedule(List<Cost> costList, List<Area> areaList, String memo) {
		this.costList = costList;
		this.areaList = areaList;
		this.memo = memo;
	}

	
	public Schedule(List<Cost> costList, List<Area> areaList, String memo,
			String planId) {
		super();
		this.costList = costList;
		this.areaList = areaList;
		this.memo = memo;
		this.planId = planId;
	}
	
	
	public String getPlanId() {
		return planId;
	}
	public void setPlanId(String planId) {
		this.planId = planId;
	}
	public List<Cost> getCostList() {
		return costList;
	}

	public void setCostList(List<Cost> costList) {
		this.costList = costList;
	}

	public List<Area> getAreaList() {
		return areaList;
	}

	public void setAreaList(List<Area> areaList) {
		this.areaList = areaList;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}
	@Override
	public String toString() {
		return "Schedule [costList=" + costList + ", areaList=" + areaList
				+ ", memo=" + memo + ", planId=" + planId + "]";
	}



}
