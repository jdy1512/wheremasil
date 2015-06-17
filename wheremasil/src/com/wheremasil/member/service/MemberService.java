package com.wheremasil.member.service;

import java.util.List;

import com.wheremasil.member.vo.Member;



public interface MemberService {
	/**
	 * 가입 처리 메소드
	 * @param member 가입 정보
	 * @throws DuplicatedIdException 중복된 아이디일 경우 발생
	 */
	public abstract String joinMember(Member member);

	/**
	 * 회원 정보 수정 처리 메소드
	 * @param member 수정할 회원 전보
	 * @return 
	 */
	public abstract void modifyMember(Member member);
	
	public abstract Member getMemberById(String member_id);
	
	public abstract Member getMemberByName(String m_name);
	
	public abstract List<String> getPlanId(String member_id);
}
