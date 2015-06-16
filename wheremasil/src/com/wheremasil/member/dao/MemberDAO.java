package com.wheremasil.member.dao;

import java.util.List;

import com.wheremasil.member.vo.Member;

;

public interface MemberDAO {

	//으로 회원정보를 조회하여 return하는 메소드
	public abstract Member selectMemberById(String member_id);
	//회원 정보를 DB에 insert하는 메소드
	public abstract int insertMember(Member member);
	//회원 정보 수정 메소드
	public abstract int updateMember(String member_id, String m_password);
	
	public abstract Member selectMemberByName(String m_name);
	
	
}

