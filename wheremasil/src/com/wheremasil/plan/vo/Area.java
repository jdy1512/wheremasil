package com.wheremasil.plan.vo;

import java.io.Serializable;

public class Area implements Serializable{
	private String id; //고유아이디
	private String title; 
	private String address; //주소
	private String latitude; //위도
	private String longitude; // 경도
	private String imgPath; // 이미지 경로
	
	public Area(){}
	public Area(String id, String title, String address, String latitude,
			String longitude, String imgPath) {
		super();
		this.id = id;
		this.title = title;
		this.address = address;
		this.latitude = latitude;
		this.longitude = longitude;
		this.imgPath = imgPath;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	@Override
	public String toString() {
		return "Area [id=" + id + ", title=" + title + ", address=" + address
				+ ", latitude=" + latitude + ", longitude=" + longitude
				+ ", imgPath=" + imgPath + "]";
	}
	
	
}
