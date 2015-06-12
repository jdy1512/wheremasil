package com.wheremasil.plan.vo;

import java.io.Serializable;

public class PlannerSchedule implements Serializable {
	private static final long serialVersionUID = 1L;

	private String plan_id; // 플래너 ID
	private String title; // 플래너명
	private String startDate; // 시작일
	private String endDate; // 종료일
	private int groupNum; // 인원수
	private String theme; // 테마 정보
	private String memberId; // 멤버 id
	private String planCreateTime;// 플랜 만든시간.
	private String planCalendarFilePath; // 플래너스케쥴파일경로
	private String mapImgPath; // 지도 이미지 경로

	public PlannerSchedule() {
	}

	public PlannerSchedule(String plan_id, String title, String startDate,
			String endDate, int groupNum, String theme, String memberId,
			String planCreateTime, String planCalendarFilePath,
			String mapImgPath) {
		this.plan_id = plan_id;
		this.title = title;
		this.startDate = startDate;
		this.endDate = endDate;
		this.groupNum = groupNum;
		this.theme = theme;
		this.memberId = memberId;
		this.planCreateTime = planCreateTime;
		this.planCalendarFilePath = planCalendarFilePath;
		this.mapImgPath = mapImgPath;
	}

	public String getPlan_id() {
		return plan_id;
	}

	public void setPlan_id(String plan_id) {
		this.plan_id = plan_id;
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

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getPlanCreateTime() {
		return planCreateTime;
	}

	public void setPlanCreateTime(String planCreateTime) {
		this.planCreateTime = planCreateTime;
	}

	public String getPlanCalendarFilePath() {
		return planCalendarFilePath;
	}

	public void setPlanCalendarFilePath(String planCalendarFilePath) {
		this.planCalendarFilePath = planCalendarFilePath;
	}

	public String getMapImgPath() {
		return mapImgPath;
	}

	public void setMapImgPath(String mapImgPath) {
		this.mapImgPath = mapImgPath;
	}

	@Override
	public String toString() {
		return "PlannerSchedule [plan_id=" + plan_id + ", title=" + title
				+ ", startDate=" + startDate + ", endDate=" + endDate
				+ ", groupNum=" + groupNum + ", theme=" + theme + ", memberId="
				+ memberId + ", planCreateTime=" + planCreateTime
				+ ", planCalendarFilePath=" + planCalendarFilePath
				+ ", mapImgPath=" + mapImgPath + "]";
	}

}
