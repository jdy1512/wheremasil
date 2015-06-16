package com.wheremasil.search.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wheremasil.board.vo.ResultBoard;
import com.wheremasil.common.util.PagingBean;


@Repository
public class SearchDAOImpl implements SearchDAO {
	private String namespace="search.dao.searchMapper.";
	
	@Autowired
	private SqlSessionTemplate session;
	
	/* 
	 * defaultSearch
	 */
	
	@Override
	public List<String> selectPlanSearchPaging(int pageNo, String searchWord){
		Map param = new HashMap();
		param.put("contentsPerPage", PagingBean.CONTENTS_PER_PAGE);
		param.put("pageNo", pageNo);
		param.put("searchWord", searchWord);
		return session.selectList(namespace+"selectPlanSearchPaging",param);
	}
	@Override
	public List<ResultBoard> selectReviewSearchPaging(int pageNo, String searchWord){
		Map param = new HashMap();
		param.put("contentsPerPage", PagingBean.CONTENTS_PER_PAGE);
		param.put("pageNo", pageNo);
		param.put("searchWord", searchWord);
		return session.selectList(namespace+"selectReviewSearchPaging",param);
	}
	
	@Override
	public int selectPlanSearchCount(String searchWord) {
		return session.selectOne(namespace+"selectPlanSearchCount", searchWord);
	}
	
	@Override
	public int selectReviewSearchCount(String searchWord) {
		return session.selectOne(namespace+"selectReviewSearchCount", searchWord);
	}
	
	/* 
	 * detailsSearch
	 */
	
	@Override
	public List<String> selectPlanDetailsSearchPaging(int pageNo, String title, String theme,
												String attraction, String number){
		Map param = new HashMap();
		param.put("contentsPerPage", PagingBean.CONTENTS_PER_PAGE);
		param.put("pageNo", pageNo);
		param.put("title", title);
		param.put("theme", theme);
		param.put("attraction", attraction);
		param.put("number", number);
		return session.selectList(namespace+"selectPlanDetailsSearchPaging",param);
	}
	
	@Override
	public List<ResultBoard> selectReviewDetailsSearchPaging(int pageNo, String title, String content){
		Map param = new HashMap();
		param.put("contentsPerPage", PagingBean.CONTENTS_PER_PAGE);
		param.put("pageNo", pageNo);
		param.put("title", title);
		param.put("content", content);
		return session.selectList(namespace+"selectReviewDetailsSearchPaging",param);
	}
		
	@Override
	public int selectPlanDetailsSearchCount(String title, String theme, String attraction, String number) {
		Map param = new HashMap();
		param.put("title", title);
		param.put("theme", theme);
		param.put("attraction", attraction);
		param.put("number", number);
		return session.selectOne(namespace+"selectPlanDetailsSearchCount", param);
	}
		
	@Override
	public int selectReviewDetailsSearchCount(String title, String content) {
		Map param = new HashMap();
		param.put("title", title);
		param.put("content", content);
		return session.selectOne(namespace+"selectReviewDetailsSearchCount", param);
	}
}
