package com.wheremasil.plan.vo;

import java.io.Serializable;

public class AreaCost implements Serializable {
	private static final long serialVersionUID = 1L;

	private String sDate;
	private String planId;
	private int acSeq; // 일정 순서
	private int acStay; // 숙박비
	private int acFood; // 식비
	private int acVehicle; // 교통비
	private int acEtc;// 기타비용
	private String areaId;// area id

	public AreaCost() {
	}

	public AreaCost(String sDate, String planId, int acSeq, int acStay,
			int acFood, int acVehicle, int acEtc, String areaId) {
		this.sDate = sDate;
		this.planId = planId;
		this.acSeq = acSeq;
		this.acStay = acStay;
		this.acFood = acFood;
		this.acVehicle = acVehicle;
		this.acEtc = acEtc;
		this.areaId = areaId;
	}

	public String getsDate() {
		return sDate;
	}

	public void setsDate(String sDate) {
		this.sDate = sDate;
	}

	public String getPlanId() {
		return planId;
	}

	public void setPlanId(String planId) {
		this.planId = planId;
	}

	public int getAcSeq() {
		return acSeq;
	}

	public void setAcSeq(int acSeq) {
		this.acSeq = acSeq;
	}

	public int getAcStay() {
		return acStay;
	}

	public void setAcStay(int acStay) {
		this.acStay = acStay;
	}

	public int getAcFood() {
		return acFood;
	}

	public void setAcFood(int acFood) {
		this.acFood = acFood;
	}

	public int getAcVehicle() {
		return acVehicle;
	}

	public void setAcVehicle(int acVehicle) {
		this.acVehicle = acVehicle;
	}

	public int getAcEtc() {
		return acEtc;
	}

	public void setAcEtc(int acEtc) {
		this.acEtc = acEtc;
	}

	public String getAreaId() {
		return areaId;
	}

	public void setAreaId(String areaId) {
		this.areaId = areaId;
	}

	@Override
	public String toString() {
		return "AreaCost [sDate=" + sDate + ", planId=" + planId + ", acSeq="
				+ acSeq + ", acStay=" + acStay + ", acFood=" + acFood
				+ ", acVehicle=" + acVehicle + ", acEtc=" + acEtc + ", areaId="
				+ areaId + "]";
	}

}
