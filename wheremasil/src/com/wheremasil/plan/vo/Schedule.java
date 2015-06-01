package com.wheremasil.plan.vo;

import java.io.File;
import java.io.Serializable;

public class Schedule implements Serializable{
	private Cost cost;
	private Area area;
	private File memo;
	
	public Schedule(Cost cost, Area area, File memo) {
		super();
		if(cost!=null){
			this.cost = cost;
		}else{
			this.cost = new Cost();
		}
		
		if(area!=null){
			this.area = area;
		}else{
			this.area=new Area();
		}
		
			this.memo = memo;
	}

	public Cost getCost() {
		return cost;
	}

	public void setCost(Cost cost) {
		this.cost = cost;
	}

	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}

	public File getMemo() {
		return memo;
	}

	public void setMemo(File memo) {
		this.memo = memo;
	}

	@Override
	public String toString() {
		return "Schedule [cost=" + cost + ", area=" + area + ", memo=" + memo
				+ "]";
	}
	
	
	
	
}
