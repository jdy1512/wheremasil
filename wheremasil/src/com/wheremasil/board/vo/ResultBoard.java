package com.wheremasil.board.vo;

public class ResultBoard {
	private int posting_id;
	private String p_content;
	private String p_datetime;
	private int p_number;
	private int p_like;
	private String p_title;
	private int p_hits;
	private String p_img_path;
	private String boardtype_id;
	private String member_id;
	public int getPosting_id() {
		return posting_id;
	}
	public void setPosting_id(int posting_id) {
		this.posting_id = posting_id;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public String getP_datetime() {
		return p_datetime;
	}
	public void setP_datetime(String p_datetime) {
		this.p_datetime = p_datetime;
	}
	public int getP_number() {
		return p_number;
	}
	public void setP_number(int p_number) {
		this.p_number = p_number;
	}
	public int getP_like() {
		return p_like;
	}
	public void setP_like(int p_like) {
		this.p_like = p_like;
	}
	public String getP_title() {
		return p_title;
	}
	public void setP_title(String p_title) {
		this.p_title = p_title;
	}
	public int getP_hits() {
		return p_hits;
	}
	public void setP_hits(int p_hits) {
		this.p_hits = p_hits;
	}
	public String getP_img_path() {
		return p_img_path;
	}
	public void setP_img_path(String p_img_path) {
		this.p_img_path = p_img_path;
	}
	public String getBoardtype_id() {
		return boardtype_id;
	}
	public void setBoardtype_id(String boardtype_id) {
		this.boardtype_id = boardtype_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	@Override
	public String toString() {
		return "ResultBoard [posting_id=" + posting_id + ", p_content="
				+ p_content + ", p_datetime=" + p_datetime + ", p_number="
				+ p_number + ", p_like=" + p_like + ", p_title=" + p_title
				+ ", p_hits=" + p_hits + ", p_img_path=" + p_img_path
				+ ", boardtype_id=" + boardtype_id + ", member_id=" + member_id
				+ "]";
	}
	public ResultBoard(int posting_id, String p_content, String p_datetime,
			int p_number, int p_like, String p_title, int p_hits,
			String p_img_path, String boardtype_id, String member_id) {
		super();
		this.posting_id = posting_id;
		this.p_content = p_content;
		this.p_datetime = p_datetime;
		this.p_number = p_number;
		this.p_like = p_like;
		this.p_title = p_title;
		this.p_hits = p_hits;
		this.p_img_path = p_img_path;
		this.boardtype_id = boardtype_id;
		this.member_id = member_id;
	}
	public ResultBoard() {
		super();
	}
	

}
