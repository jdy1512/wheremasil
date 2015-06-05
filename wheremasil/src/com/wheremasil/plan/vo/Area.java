package com.wheremasil.plan.vo;

import java.io.Serializable;

public class Area implements Serializable {
	private static final long serialVersionUID = 1L;
	private String id; // 고유아이디
	private String title;
	private String address; // 주소
	private String latitude; // 위도
	private String longitude; // 경도
	private String imgPath; // 이미지 경로
	private String channel; // 채널id

	private double stLat; // 좌상단 위도
	private double stLon; // 좌상단 경도
	private double enLat; // 우하단 위도
	private double enLon; // 우하단 경도

	public Area() {
	}

	public Area(String id, String title, String address, String latitude,
			String longitude, String imgPath, String channel) {
		this.id = id;
		this.title = title;
		this.address = address;
		this.latitude = latitude;
		this.longitude = longitude;
		this.imgPath = imgPath;
		this.channel = channel;
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

	public String getChannel() {
		return channel;
	}

	public void setChannel(String channel) {
		this.channel = channel;
	}

	public double getStLat() {
		return stLat;
	}

	public void setStLat(double stLat) {
		this.stLat = stLat;
	}

	public double getStLon() {
		return stLon;
	}

	public void setStLon(double stLon) {
		this.stLon = stLon;
	}

	public double getEnLat() {
		return enLat;
	}

	public void setEnLat(double enLat) {
		this.enLat = enLat;
	}

	public double getEnLon() {
		return enLon;
	}

	public void setEnLon(double enLon) {
		this.enLon = enLon;
	}

	@Override
	public String toString() {
		return "Area [id=" + id + ", title=" + title + ", address=" + address
				+ ", latitude=" + latitude + ", longitude=" + longitude
				+ ", imgPath=" + imgPath + ", channel=" + channel + ", stLat="
				+ stLat + ", stLon=" + stLon + ", enLat=" + enLat + ", enLon="
				+ enLon + "]";
	}



}
