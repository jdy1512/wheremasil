package com.wheremasil.member.service;

import java.io.IOException;
import java.util.DuplicateFormatFlagsException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;






import com.wheremasil.member.dao.MemberDAO;
import com.wheremasil.member.vo.Member;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO dao;
	
	@Override
	public int  joinMember(Member member) {
		
		System.out.println("서비스확인");
		if(dao.selectMemberById(member.getMember_id())!=null){
		return -1;
		
	}else if(dao.selectMemberByName(member.getM_name())!=null){
		return -1;
	}
		
		return dao.insertMember(member);
		
	}

	@Override
	public int modifyMember(Member member) {
		return dao.updateMember(member);
		
	}

	@Override
	public Member getMemberById(String member_id) {
		return dao.selectMemberById(member_id);
	}

	@Override
	public Member getMemberByName(String m_name) {
		return dao.selectMemberByName(m_name);
	}
	

	
}
