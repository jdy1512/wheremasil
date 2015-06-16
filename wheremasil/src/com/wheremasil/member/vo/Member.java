package com.wheremasil.member.vo;

import org.springframework.web.multipart.MultipartFile;

public class Member {

	private String member_id;
	private String m_name;
	private String m_password;
	private String m_email;
	private String m_prof_img_path;
	private String m_join_date;
	private String m_drop_date;
	private String m_position;
	private String m_state;
	private MultipartFile picture;
	
	public Member(){}

	public Member(String member_id, String m_name, String m_password,
			String m_email, String m_prof_img_path, String m_join_date,
			String m_drop_date, String m_position, String m_state,
			MultipartFile picture) {
		super();
		this.member_id = member_id;
		this.m_name = m_name;
		this.m_password = m_password;
		this.m_email = m_email;
		this.m_prof_img_path = m_prof_img_path;
		this.m_join_date = m_join_date;
		this.m_drop_date = m_drop_date;
		this.m_position = m_position;
		this.m_state = m_state;
		this.picture = picture;
	}

	public Member(String member_id, String m_name, String m_password,
			String m_email, String m_prof_img_path, String m_join_date,
			String m_drop_date, String m_position, String m_state) {
		super();
		this.member_id = member_id;
		this.m_name = m_name;
		this.m_password = m_password;
		this.m_email = m_email;
		this.m_prof_img_path = m_prof_img_path;
		this.m_join_date = m_join_date;
		this.m_drop_date = m_drop_date;
		this.m_position = m_position;
		this.m_state = m_state;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_password() {
		return m_password;
	}

	public void setM_password(String m_password) {
		this.m_password = m_password;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_prof_img_path() {
		return m_prof_img_path;
	}

	public void setM_prof_img_path(String m_prof_img_path) {
		this.m_prof_img_path = m_prof_img_path;
	}

	public String getM_join_date() {
		return m_join_date;
	}

	public void setM_join_date(String m_join_date) {
		this.m_join_date = m_join_date;
	}

	public String getM_drop_date() {
		return m_drop_date;
	}

	public void setM_drop_date(String m_drop_date) {
		this.m_drop_date = m_drop_date;
	}

	public String getM_position() {
		return m_position;
	}

	public void setM_position(String m_position) {
		this.m_position = m_position;
	}

	public String getM_state() {
		return m_state;
	}

	public void setM_state(String m_state) {
		this.m_state = m_state;
	}

	public MultipartFile getPicture() {
		return picture;
	}

	public void setPicture(MultipartFile picture) {
		this.picture = picture;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((m_drop_date == null) ? 0 : m_drop_date.hashCode());
		result = prime * result + ((m_email == null) ? 0 : m_email.hashCode());
		result = prime * result
				+ ((m_join_date == null) ? 0 : m_join_date.hashCode());
		result = prime * result + ((m_name == null) ? 0 : m_name.hashCode());
		result = prime * result
				+ ((m_password == null) ? 0 : m_password.hashCode());
		result = prime * result
				+ ((m_position == null) ? 0 : m_position.hashCode());
		result = prime * result
				+ ((m_prof_img_path == null) ? 0 : m_prof_img_path.hashCode());
		result = prime * result + ((m_state == null) ? 0 : m_state.hashCode());
		result = prime * result
				+ ((member_id == null) ? 0 : member_id.hashCode());
		result = prime * result + ((picture == null) ? 0 : picture.hashCode());
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
		Member other = (Member) obj;
		if (m_drop_date == null) {
			if (other.m_drop_date != null)
				return false;
		} else if (!m_drop_date.equals(other.m_drop_date))
			return false;
		if (m_email == null) {
			if (other.m_email != null)
				return false;
		} else if (!m_email.equals(other.m_email))
			return false;
		if (m_join_date == null) {
			if (other.m_join_date != null)
				return false;
		} else if (!m_join_date.equals(other.m_join_date))
			return false;
		if (m_name == null) {
			if (other.m_name != null)
				return false;
		} else if (!m_name.equals(other.m_name))
			return false;
		if (m_password == null) {
			if (other.m_password != null)
				return false;
		} else if (!m_password.equals(other.m_password))
			return false;
		if (m_position == null) {
			if (other.m_position != null)
				return false;
		} else if (!m_position.equals(other.m_position))
			return false;
		if (m_prof_img_path == null) {
			if (other.m_prof_img_path != null)
				return false;
		} else if (!m_prof_img_path.equals(other.m_prof_img_path))
			return false;
		if (m_state == null) {
			if (other.m_state != null)
				return false;
		} else if (!m_state.equals(other.m_state))
			return false;
		if (member_id == null) {
			if (other.member_id != null)
				return false;
		} else if (!member_id.equals(other.member_id))
			return false;
		if (picture == null) {
			if (other.picture != null)
				return false;
		} else if (!picture.equals(other.picture))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Member [member_id=" + member_id + ", m_name=" + m_name
				+ ", m_password=" + m_password + ", m_email=" + m_email
				+ ", m_prof_img_path=" + m_prof_img_path + ", m_join_date="
				+ m_join_date + ", m_drop_date=" + m_drop_date
				+ ", m_position=" + m_position + ", m_state=" + m_state
				+ ", picture=" + picture + "]";
	}

	

	
	
}
