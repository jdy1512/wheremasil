package com.wheremasil.plan.vo;

import java.io.Serializable;

public class Cost implements Serializable {

	private int costStay; // 숙박비
	private int costFood; // 식비
	private int costVehicle; // 교통비
	private int costEtc;// 기타비용

	public Cost() {
	}

	public Cost(int costStay, int costFood, int costVehicle, int costEtc) {
		this.costStay = costStay;
		this.costFood = costFood;
		this.costVehicle = costVehicle;
		this.costEtc = costEtc;
	}

	public int getCostStay() {
		return costStay;
	}

	public void setCostStay(int costStay) {
		this.costStay = costStay;
	}

	public int getCostFood() {
		return costFood;
	}

	public void setCostFood(int costFood) {
		this.costFood = costFood;
	}

	public int getCostVehicle() {
		return costVehicle;
	}

	public void setCostVehicle(int costVehicle) {
		this.costVehicle = costVehicle;
	}

	public int getCostEtc() {
		return costEtc;
	}

	public void setCostEtc(int costEtc) {
		this.costEtc = costEtc;
	}

	@Override
	public String toString() {
		return "Cost [costStay=" + costStay + ", costFood=" + costFood
				+ ", costVehicle=" + costVehicle + ", costEtc=" + costEtc + "]";
	}



}
