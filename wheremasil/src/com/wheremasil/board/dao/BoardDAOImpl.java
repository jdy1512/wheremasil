package com.wheremasil.board.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.stereotype.Repository;

import com.wheremasil.board.vo.PagingBean;
import com.wheremasil.board.vo.Board;
import com.wheremasil.board.vo.Reply;
import com.wheremasil.board.vo.ResultBoard;
import com.wheremasil.member.vo.Member;
@Repository
public class BoardDAOImpl {
	@Autowired
	private SqlSessionTemplate session;
	
	private String namespace="board.dao.boardMapper.";
	
	
	public int deletePost(String posting_id){
		
		return session.delete(namespace+"deletePost",posting_id);
	}
	
	
	public List<Reply> insertRpcnt(String posting_id){
		
		return session.selectList(namespace+"insertRpcnt",posting_id);
	}
	
	
	public List<ResultBoard> returnCategoriList(String categori){
		return session.selectList(namespace+"returnCategoriList",categori);
	}
	
	
	public List<Board> selectSlike(){
		
		 return session.selectList(namespace+"selectSlike");
		
	}
	
	
	
	public List<Member> returnMemberInfo(String member_id){
		
		return session.selectList(namespace+"selectMemberInfo",member_id);
	}
	
	public ResultBoard returnPostingInfo(String posting_id){
		return session.selectOne(namespace+"selectPostingInfo",posting_id);
	}
	
	
	
	public int insertSb(Board board){
		
		return session.insert(namespace+"insertSb",board);
	}
	
	
	public int insertRp(Reply reply){
		
		return session.insert(namespace+"insertRp",reply);
	}
	
	
	
	public ResultBoard returnPostringValue(String postring_id){
		
		return session.selectOne(namespace+"returnPostringValue",postring_id);
	}
	
	
	
	
	
	
	
	public int insertBoardVo(Board board){
	//("보냅니다");	
	//(session);
		return session.insert(namespace+"insertBoardVo",board);
		
	}
	
	public ArrayList selectAllReviewPaging(int pageNo){
		
		Map param = new HashMap();
		param.put("contentsPerPage", PagingBean.CONTENTS_PER_PAGE);
		param.put("pageNo", pageNo);
		
		List<Board> result=session.selectList(namespace+"selectAllReviewPaging",param);
		
		List<Board> result2=session.selectList(namespace+"selectOrderByLike");
		
		ArrayList map = new ArrayList();
		
		map.add(result);
		map.add(result2);
		
		return map;
	}
	
	public int selectTotalMemberCount(){
		return session.selectOne(namespace+"selectTotalMemberCount");
	}
	
	public List<Reply>getRplist(String posting_id){
		return session.selectList(namespace+"selectRpList",posting_id);
	}
	
	
public List<ResultBoard> returnSbValue(){
		
		return session.selectList(namespace+"selectAllSpage");
	}
	
	public int insertLike(String posting_id){
		return session.insert(namespace+"insertLike",posting_id);
	}
	
	public int selectPlike(String posting_id){
		return session.selectOne(namespace+"selectPlike",posting_id);
	}
	
	public int insertHit(String posting_id){
		return session.insert(namespace+"insertHit",posting_id);
	}
	public int selectHit(String posting_id){
		return session.selectOne(namespace+"selecthit",posting_id);
	}

}
