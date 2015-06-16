package com.wheremasil.board.vo;

import java.awt.List;

import org.springframework.stereotype.Repository;
@Repository
public class Board {
	
	private String name;
	private String theme;
	private String subject;
	private String editor1;
	private String dateTime;
	private String sumname;
	private String m_name;
	public Board(String name, String theme, String subject, String editor1,
			String dateTime, String sumname, String m_name) {
		super();
		this.name = name;
		this.theme = theme;
		this.subject = subject;
		this.editor1 = editor1;
		this.dateTime = dateTime;
		this.sumname = sumname;
		this.m_name = m_name;
	}
	public Board() {
		super();
	}
	@Override
	public String toString() {
		return "Board [name=" + name + ", theme=" + theme + ", subject="
				+ subject + ", editor1=" + editor1 + ", dateTime=" + dateTime
				+ ", sumname=" + sumname + ", m_name=" + m_name + "]";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTheme() {
		return theme;
	}
	public void setTheme(String theme) {
		this.theme = theme;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getEditor1() {
		return editor1;
	}
	public void setEditor1(String editor1) {
		this.editor1 = editor1;
	}
	public String getDateTime() {
		return dateTime;
	}
	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}
	public String getSumname() {
		return sumname;
	}
	public void setSumname(String sumname) {
		this.sumname = sumname;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	
	
}
