package com.wheremasil.search.vo;

public class PlanResult {
	private String planId; //plan id
	private String planTitle;
	private String planStartDate;
	private String planEndDate;
	private int planGroupNum;
	private String planMapImgPath;
	private String planAttraction;
	private String planAddress;
	private String planTheme;
	
	public PlanResult(){
		
	}

	public PlanResult(String planId, String planTitle, String planStartDate,
			String planEndDate, int planGroupNum, String planMapImgPath,
			String planAttraction, String planAddress, String planTheme) {
		super();
		this.planId = planId;
		this.planTitle = planTitle;
		this.planStartDate = planStartDate;
		this.planEndDate = planEndDate;
		this.planGroupNum = planGroupNum;
		this.planMapImgPath = planMapImgPath;
		this.planAttraction = planAttraction;
		this.planAddress = planAddress;
		this.planTheme = planTheme;
	}

	public String getPlanId() {
		return planId;
	}

	public void setPlanId(String planId) {
		this.planId = planId;
	}

	public String getPlanTitle() {
		return planTitle;
	}

	public void setPlanTitle(String planTitle) {
		this.planTitle = planTitle;
	}

	public String getPlanStartDate() {
		return planStartDate;
	}

	public void setPlanStartDate(String planStartDate) {
		this.planStartDate = planStartDate;
	}

	public String getPlanEndDate() {
		return planEndDate;
	}

	public void setPlanEndDate(String planEndDate) {
		this.planEndDate = planEndDate;
	}

	public int getPlanGroupNum() {
		return planGroupNum;
	}

	public void setPlanGroupNum(int planGroupNum) {
		this.planGroupNum = planGroupNum;
	}

	public String getPlanMapImgPath() {
		return planMapImgPath;
	}

	public void setPlanMapImgPath(String planMapImgPath) {
		this.planMapImgPath = planMapImgPath;
	}

	public String getPlanAttraction() {
		return planAttraction;
	}

	public void setPlanAttraction(String planAttraction) {
		this.planAttraction = planAttraction;
	}

	public String getPlanAddress() {
		return planAddress;
	}

	public void setPlanAddress(String planAddress) {
		this.planAddress = planAddress;
	}

	public String getPlanTheme() {
		return planTheme;
	}

	public void setPlanTheme(String planTheme) {
		this.planTheme = planTheme;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((planAddress == null) ? 0 : planAddress.hashCode());
		result = prime * result
				+ ((planAttraction == null) ? 0 : planAttraction.hashCode());
		result = prime * result
				+ ((planEndDate == null) ? 0 : planEndDate.hashCode());
		result = prime * result + planGroupNum;
		result = prime * result + ((planId == null) ? 0 : planId.hashCode());
		result = prime * result
				+ ((planMapImgPath == null) ? 0 : planMapImgPath.hashCode());
		result = prime * result
				+ ((planStartDate == null) ? 0 : planStartDate.hashCode());
		result = prime * result
				+ ((planTheme == null) ? 0 : planTheme.hashCode());
		result = prime * result
				+ ((planTitle == null) ? 0 : planTitle.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PlanResult other = (PlanResult) obj;
		if (planAddress == null) {
			if (other.planAddress != null)
				return false;
		} else if (!planAddress.equals(other.planAddress))
			return false;
		if (planAttraction == null) {
			if (other.planAttraction != null)
				return false;
		} else if (!planAttraction.equals(other.planAttraction))
			return false;
		if (planEndDate == null) {
			if (other.planEndDate != null)
				return false;
		} else if (!planEndDate.equals(other.planEndDate))
			return false;
		if (planGroupNum != other.planGroupNum)
			return false;
		if (planId == null) {
			if (other.planId != null)
				return false;
		} else if (!planId.equals(other.planId))
			return false;
		if (planMapImgPath == null) {
			if (other.planMapImgPath != null)
				return false;
		} else if (!planMapImgPath.equals(other.planMapImgPath))
			return false;
		if (planStartDate == null) {
			if (other.planStartDate != null)
				return false;
		} else if (!planStartDate.equals(other.planStartDate))
			return false;
		if (planTheme == null) {
			if (other.planTheme != null)
				return false;
		} else if (!planTheme.equals(other.planTheme))
			return false;
		if (planTitle == null) {
			if (other.planTitle != null)
				return false;
		} else if (!planTitle.equals(other.planTitle))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "PlanResult [planId=" + planId + ", planTitle=" + planTitle
				+ ", planStartDate=" + planStartDate + ", planEndDate="
				+ planEndDate + ", planGroupNum=" + planGroupNum
				+ ", planMapImgPath=" + planMapImgPath + ", planAttraction="
				+ planAttraction + ", planAddress=" + planAddress
				+ ", planTheme=" + planTheme + "]";
	}
	
	
}
