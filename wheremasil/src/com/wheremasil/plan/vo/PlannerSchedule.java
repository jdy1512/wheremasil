package com.wheremasil.plan.vo;

import java.io.Serializable;
import java.util.ArrayList;



public class PlannerSchedule implements Serializable {
	private static final long serialVersionUID = 1L;

	private String title; //플래너명
	private String startDate; //시작일
	private String endDate; //종료일
	private int groupNum; //인원수
	private String theme; //테마 정보
	private String memberId; //멤버 id
	private String planCreateTime;//플랜 만든시간.
	private ArrayList<Schedule> scheduleList;


	public PlannerSchedule(){}



	public PlannerSchedule(String title, String startDate, String endDate,
			int groupNum, String theme, String memberId,
			ArrayList<Schedule> scheduleList) {
		super();
		this.title = title;
		this.startDate = startDate;
		this.endDate = endDate;
		this.groupNum = groupNum;
		this.theme = theme;
		this.memberId = memberId;
		this.scheduleList = scheduleList;
	}



	public PlannerSchedule(String title, String startDate, String endDate,
			int groupNum, String theme, String memberId, String planCreateTime,
			ArrayList<Schedule> scheduleList) {
		super();
		this.title = title;
		this.startDate = startDate;
		this.endDate = endDate;
		this.groupNum = groupNum;
		this.theme = theme;
		this.memberId = memberId;
		this.planCreateTime = planCreateTime;
		this.scheduleList = scheduleList;
	}



	public String getPlanCreateTime() {
		return planCreateTime;
	}



	public void setPlanCreateTime(String planCreateTime) {
		this.planCreateTime = planCreateTime;
	}



	public ArrayList<Schedule> getScheduleList() {
		return scheduleList;
	}
	
	
	public String getMemberId() {
		return memberId;
	}



	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}



	public void setScheduleList(ArrayList<Schedule> scheduleList) {
		this.scheduleList = scheduleList;
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
				+ ", theme=" + theme + ", memberId=" + memberId
				+ ", planCreateTime=" + planCreateTime + ", scheduleList="
				+ scheduleList + "]";
	}







}
