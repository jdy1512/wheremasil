package com.wheremasil.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wheremasil.member.vo.Member;



@Repository
public class MemberDAOImpl implements MemberDAO {
	private String namespace="member.dao.memberMapper.";
	
	@Autowired
	private SqlSessionTemplate session;
	//private SqlSession session; //SqlSessionTemplate이 SqlSession 타입이다.
	/**
	 * id로 회원 정보를 조회하여 return하는 메소드
	 * @param id 조회할 회원 ID
	 * @return 
	 */
	@Override
	public Member selectMemberById(String member_id){
		
		return session.selectOne(namespace+"selectMemberById", member_id);
	}
	/**
	 * 회원 정보를 DB에 insert하는 메소드
	 * @param member 등록할 회원 정보
	 */
	@Override
	public int insertMember(Member member){
		System.out.println("확인");
		return session.insert(namespace+"insertMember", member);
	}
	/**
	 * 회원 정보 수정 메소드
	 * 매개변수로 받은 Member객체의 id 회원의 나머지 정보를 변경한다. 단 ID와 가입일자는 변경 안한다.
	 * @param member
	 */
	@Override
	public int updateMember(String member_id,String m_password){
		Member member = new Member(member_id, "", m_password, "", "", "", "", "", "");
		return  session.update(namespace+"updateMember", member);
	}
	@Override
	public Member selectMemberByName(String m_name) {
		return session.selectOne(namespace+"selectMemberByName", m_name);
	}
	

	
}
