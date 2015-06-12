package com.wheremasil.plan.vo;

import java.io.Serializable;

public class PlanMap implements Serializable {
	private static final long serialVersionUID = 1L;
	private String planId;
	private String startDate;
	private String endDate;
	private String curDate;
	private String seq;
	private String memberId;
	private double aLatitude;
	private double aLongitude;

	public PlanMap() {
	}

	public PlanMap(String planId, String startDate, String endDate,
			String curDate, String seq, String memberId, double aLatitude,
			double aLongitude) {
		this.planId = planId;
		this.startDate = startDate;
		this.endDate = endDate;
		this.curDate = curDate;
		this.seq = seq;
		this.memberId = memberId;
		this.aLatitude = aLatitude;
		this.aLongitude = aLongitude;
	}

	public String getPlanId() {
		return planId;
	}

	public void setPlanId(String planId) {
		this.planId = planId;
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

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
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
		return "PlanMap [planId=" + planId + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", curDate=" + curDate + ", seq="
				+ seq + ", memberId=" + memberId + ", aLatitude=" + aLatitude
				+ ", aLongitude=" + aLongitude + "]";
	}

}
