package com.wheremasil.board.vo;

public class Reply {
	private String reply_id;
	private String r_parent_id;
	private String r_datetime;
	private int r_level;
	private String posting_id;
	private String member_id;
	private String r_content;
	private String m_name;
	public Reply(String reply_id, String r_parent_id, String r_datetime,
			int r_level, String posting_id, String member_id, String r_content,
			String m_name) {
		super();
		this.reply_id = reply_id;
		this.r_parent_id = r_parent_id;
		this.r_datetime = r_datetime;
		this.r_level = r_level;
		this.posting_id = posting_id;
		this.member_id = member_id;
		this.r_content = r_content;
		this.m_name = m_name;
	}
	public Reply() {
		super();
	}
	@Override
	public String toString() {
		return "Reply [reply_id=" + reply_id + ", r_parent_id=" + r_parent_id
				+ ", r_datetime=" + r_datetime + ", r_level=" + r_level
				+ ", posting_id=" + posting_id + ", member_id=" + member_id
				+ ", r_content=" + r_content + ", m_name=" + m_name + "]";
	}
	public String getReply_id() {
		return reply_id;
	}
	public void setReply_id(String reply_id) {
		this.reply_id = reply_id;
	}
	public String getR_parent_id() {
		return r_parent_id;
	}
	public void setR_parent_id(String r_parent_id) {
		this.r_parent_id = r_parent_id;
	}
	public String getR_datetime() {
		return r_datetime;
	}
	public void setR_datetime(String r_datetime) {
		this.r_datetime = r_datetime;
	}
	public int getR_level() {
		return r_level;
	}
	public void setR_level(int r_level) {
		this.r_level = r_level;
	}
	public String getPosting_id() {
		return posting_id;
	}
	public void setPosting_id(String posting_id) {
		this.posting_id = posting_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	

}
