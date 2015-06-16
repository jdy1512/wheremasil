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







import com.google.gson.JsonObject;
import com.wheremasil.member.dao.MemberDAO;
import com.wheremasil.member.vo.Member;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO dao;
	
	@Override
	public String joinMember(Member member) {
		
		if(dao.selectMemberById(member.getMember_id())!=null){
			return "id";
		}else if(dao.selectMemberByName(member.getM_name())!=null){
			return "name";
		}
		
		dao.insertMember(member);
		return "success";	
	}

	@Override
	public void modifyMember(Member member) {
		
		dao.updateMember(member);
		
	}

	@Override
	public Member getMemberById(String member_id) {
		return dao.selectMemberById(member_id);
	}

	@Override
	public Member getMemberByName(String m_name) {
		return dao.selectMemberByName(m_name);
	}
	
	@Override
	public Map getPlanId(String member_id){
		List<String> planList = dao.selectPlanId(member_id);
				
		Map map = new HashMap();
		
		map.put("planId_list", planList);
	
		return map; 
	}

	
}
