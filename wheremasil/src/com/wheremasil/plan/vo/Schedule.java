package com.wheremasil.plan.vo;

import java.io.Serializable;

public class Schedule implements Serializable {
	private static final long serialVersionUID = 1L;
	private String sDate;
	private String planId;
	private String memo;

	public Schedule() {
	}

	public Schedule(String sDate, String planId, String memo) {
		this.sDate = sDate;
		this.planId = planId;
		this.memo = memo;
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

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	@Override
	public String toString() {
		return "Schedule [sDate=" + sDate + ", planId=" + planId + ", memo="
				+ memo + "]";
	}

}
