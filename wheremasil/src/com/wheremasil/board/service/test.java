package com.wheremasil.board.service;

public class test {
public static void main(String[] args) {
	int totalSec = 9201;

	int day = totalSec / (60 * 60 * 24);
	int hour = (totalSec - day * 60 * 60 * 24) / (60 * 60); 
	int minute = (totalSec - day * 60 * 60 * 24 - hour * 3600) / 60; 
	int second = totalSec % 60;

	System.out.println(day + "일 " + hour + "시간 " + minute + "분 " + second
			+ "초");
}

}
