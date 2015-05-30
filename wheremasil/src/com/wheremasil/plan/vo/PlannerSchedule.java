package com.wheremasil.plan.vo;

import java.io.Serializable;

public class PlannerSchedule implements Serializable {
	private static final long serialVersionUID = 1L;

	private String title;
	private String startDate;
	private String endDate;
	private int groupNum;
	private String theme;

	public PlannerSchedule() {
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public int getGroupNum() {
		return groupNum;
	}

	public void setGroupNum(int groupNum) {
		this.groupNum = groupNum;
	}

	public String getTheme() {
		return theme;
	}

	public void setTheme(String theme) {
		this.theme = theme;
	}

	@Override
	public String toString() {
		return "PlannerSchedule [title=" + title + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", groupNum=" + groupNum
				+ ", theme=" + theme + "]";
	}

}
