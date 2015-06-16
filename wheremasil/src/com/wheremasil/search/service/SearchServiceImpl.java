package com.wheremasil.search.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wheremasil.board.vo.ResultBoard;
import com.wheremasil.common.util.PagingBean;
import com.wheremasil.search.dao.SearchDAO;
import com.wheremasil.search.vo.PlanResult;
import com.wheremasil.search.vo.ReviewResult;

@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	private SearchDAO dao;
	
	/* 
	 * defaultSearch service
	 */
	
	@Override
	public Map getSimpleSearchList(int pageNo, String searchWord) {
		List<String> planIdList = dao.selectPlanSearchPaging(pageNo, searchWord);
		List<ResultBoard> boardList = dao.selectReviewSearchPaging(pageNo, searchWord);
		
		HashMap map = new HashMap();
		map.put("planId_list", planIdList);
		map.put("board_list", boardList);
		map.put("search", "default");
		map.put("category", "simple");
		map.put("header_search", "hidden");
		map.put("search_word", searchWord);
		return map;
	}
	
	public Map getPlanSearchListPaging(int pageNo, String searchWord) {
		
		List<String> planIdList = dao.selectPlanSearchPaging(pageNo, searchWord);
				
		int TotalContent = dao.selectPlanSearchCount(searchWord);
			
		PagingBean PagingBean = new PagingBean(TotalContent, pageNo);
		
		HashMap map = new HashMap();
		map.put("planId_list", planIdList);
		map.put("PagingBean", PagingBean);
		map.put("category", "default");
		map.put("type", "plan");
		map.put("header_search", "hidden");
		map.put("search_word", searchWord);
		return map;
	}
	
	public Map getReviewSearchListPaging(int pageNo, String searchWord) {
		
		List<ResultBoard> boardList = dao.selectReviewSearchPaging(pageNo, searchWord);
		
		int TotalContent = dao.selectReviewSearchCount(searchWord);
			
		PagingBean PagingBean = new PagingBean(TotalContent, pageNo);
		
		HashMap map = new HashMap();
		map.put("board_list", boardList);
		map.put("PagingBean", PagingBean);
		map.put("category", "default");
		map.put("type", "review");
		map.put("header_search", "hidden");
		map.put("search_word", searchWord);
		return map;
	}

	/* 
	 * detailsSearch service
	 */
	
	@Override
	public Map getDetailsSimpleSearchList(int pageNo, String title, String content, String theme,
										String attraction, String number) {
		
		List<String> planIdList = dao.selectPlanDetailsSearchPaging(pageNo, title, theme, attraction, number);
		List<ResultBoard> boardList = dao.selectReviewDetailsSearchPaging(pageNo, title, content);
				
		HashMap map = new HashMap();
		map.put("planId_list", planIdList);
		map.put("board_list", boardList);
		map.put("search", "details");
		map.put("category", "detailsSimple");
		map.put("header_search", "hidden");
		map.put("title", title);
		map.put("content", content);
		map.put("theme", theme);
		map.put("attraction", attraction);
		map.put("number", number);
		return map;
	}
		
	public Map getPlanDetailsSearchListPaging(int pageNo, String title, String theme,
										String attraction, String number) {
		
		List<String> planIdList = dao.selectPlanDetailsSearchPaging(pageNo, title, theme, 
																attraction, number);
				
		int TotalContent = dao.selectPlanDetailsSearchCount(title, theme, attraction, number);
			
		PagingBean PagingBean = new PagingBean(TotalContent, pageNo);
		
				
		HashMap map = new HashMap();
		map.put("planId_list", planIdList);
		map.put("PagingBean", PagingBean);
		map.put("category", "details");
		map.put("type", "plan");
		map.put("header_search", "hidden");
		map.put("title", title);
		map.put("theme", theme);
		map.put("attraction", attraction);
		map.put("number", number);
		
		return map;
	}
		
	public Map getReviewDetailsSearchListPaging(int pageNo, String title, String content) {
		
		List<ResultBoard> boardList = dao.selectReviewDetailsSearchPaging(pageNo, title, content);
		
		int TotalContent = dao.selectReviewDetailsSearchCount(title, content);
			
		PagingBean PagingBean = new PagingBean(TotalContent, pageNo);
		
		HashMap map = new HashMap();
		map.put("board_list", boardList);
		map.put("PagingBean", PagingBean);
		map.put("category", "details");
		map.put("type", "review");
		map.put("header_search", "hidden");
		map.put("title", title);
		map.put("content", content);
		return map;
	}

	
	
}
