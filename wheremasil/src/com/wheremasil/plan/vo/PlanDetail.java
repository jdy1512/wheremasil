package com.wheremasil.plan.vo;

import java.io.Serializable;

public class PlanDetail implements Serializable {
	private static final long serialVersionUID = 1L;
	private String startDate;
	private String endDate;
	private String curDate;
	private String seq;
	private String areaImagePath;
	private String areaTitle;
	private String areaAddress;
	private String costFood;
	private String costVehicle;
	private String costStay;
	private String costEtc;
	private String memo;
	private double aLatitude;
	private double aLongitude;

	public PlanDetail() {
	}

	public PlanDetail(String startDate, String endDate, String curDate,
			String seq, String areaImagePath, String areaTitle,
			String areaAddress, String costFood, String costVehicle,
			String costStay, String costEtc, String memo, double aLatitude,
			double aLongitude) {
		this.startDate = startDate;
		this.endDate = endDate;
		this.curDate = curDate;
		this.seq = seq;
		this.areaImagePath = areaImagePath;
		this.areaTitle = areaTitle;
		this.areaAddress = areaAddress;
		this.costFood = costFood;
		this.costVehicle = costVehicle;
		this.costStay = costStay;
		this.costEtc = costEtc;
		this.memo = memo;
		this.aLatitude = aLatitude;
		this.aLongitude = aLongitude;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getCurDate() {
		return curDate;
	}

	public void setCurDate(String curDate) {
		this.curDate = curDate;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getAreaImagePath() {
		return areaImagePath;
	}

	public void setAreaImagePath(String areaImagePath) {
		this.areaImagePath = areaImagePath;
	}

	public String getAreaTitle() {
		return areaTitle;
	}

	public void setAreaTitle(String areaTitle) {
		this.areaTitle = areaTitle;
	}

	public String getAreaAddress() {
		return areaAddress;
	}

	public void setAreaAddress(String areaAddress) {
		this.areaAddress = areaAddress;
	}

	public String getCostFood() {
		return costFood;
	}

	public void setCostFood(String costFood) {
		this.costFood = costFood;
	}

	public String getCostVehicle() {
		return costVehicle;
	}

	public void setCostVehicle(String costVehicle) {
		this.costVehicle = costVehicle;
	}

	public String getCostStay() {
		return costStay;
	}

	public void setCostStay(String costStay) {
		this.costStay = costStay;
	}

	public String getCostEtc() {
		return costEtc;
	}

	public void setCostEtc(String costEtc) {
		this.costEtc = costEtc;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public double getaLatitude() {
		return aLatitude;
	}

	public void setaLatitude(double aLatitude) {
		this.aLatitude = aLatitude;
	}

	public double getaLongitude() {
		return aLongitude;
	}

	public void setaLongitude(double aLongitude) {
		this.aLongitude = aLongitude;
	}
	
	@Override
	public String toString() {
		return "PlanDetail [startDate=" + startDate + ", endDate=" + endDate
				+ ", curDate=" + curDate + ", seq=" + seq + ", areaImagePath="
				+ areaImagePath + ", areaTitle=" + areaTitle + ", areaAddress="
				+ areaAddress + ", costFood=" + costFood + ", costVehicle="
				+ costVehicle + ", costStay=" + costStay + ", costEtc="
				+ costEtc + ", memo=" + memo + ", aLatitude=" + aLatitude
				+ ", aLongitude=" + aLongitude + "]";
	}

}
