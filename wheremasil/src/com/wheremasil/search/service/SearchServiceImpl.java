package com.wheremasil.search.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public Map getSimpleSearchList(String searchWord) {
		List<PlanResult> planList = dao.selectPlanSearch(searchWord);
		List<ReviewResult> reviewList = dao.selectReviewSearch(searchWord);
		List<String> planIdList = new ArrayList<String>();
		
		for(PlanResult p : planList){
			planIdList.add(p.getPlanId());
		}
		
		HashMap map = new HashMap();
		map.put("planId_list", planIdList);
		map.put("plan_list", planList);
		map.put("review_list", reviewList);
		map.put("search", "default");
		map.put("category", "simple");
		map.put("header_search", "hidden");
		map.put("search_word", searchWord);
		return map;
	}
	
	public Map getPlanSearchListPaging(int pageNo, String searchWord) {
		
		List<PlanResult> planList = dao.selectPlanSearchPaging(pageNo, searchWord);
		List<String> planIdList = new ArrayList<String>();
		
		int TotalContent = dao.selectPlanSearchCount(searchWord);
			
		PagingBean PagingBean = new PagingBean(TotalContent, pageNo);
		
		for(PlanResult p : planList){
			planIdList.add(p.getPlanId());
		}
		
		HashMap map = new HashMap();
		map.put("plan_list", planList);
		map.put("planId_list", planIdList);
		map.put("PagingBean", PagingBean);
		map.put("category", "default");
		map.put("type", "plan");
		map.put("header_search", "hidden");
		map.put("search_word", searchWord);
		return map;
	}
	
	public Map getReviewSearchListPaging(int pageNo, String searchWord) {
		
		List<ReviewResult> reviewList = dao.selectReviewSearchPaging(pageNo, searchWord);
		
		int TotalContent = dao.selectReviewSearchCount(searchWord);
			
		PagingBean PagingBean = new PagingBean(TotalContent, pageNo);
		
		HashMap map = new HashMap();
		map.put("review_list", reviewList);
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
	public Map getDetailsSimpleSearchList(String title, String content, String theme,
										String attraction, String number) {
		
		List<PlanResult> planList = dao.selectPlanDetailsSearch(title, theme, attraction, number);
		List<ReviewResult> reviewList = dao.selectReviewDetailsSearch(title, content);
		List<String> planIdList = new ArrayList<String>();
		
		for(PlanResult p : planList){
			planIdList.add(p.getPlanId());
		}
		
		HashMap map = new HashMap();
		map.put("plan_list", planList);
		map.put("planId_list", planIdList);
		map.put("review_list", reviewList);
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
		
		List<PlanResult> planList = dao.selectPlanDetailsSearchPaging(pageNo, title, theme, 
																attraction, number);
		List<String> planIdList = new ArrayList<String>();
		
		int TotalContent = dao.selectPlanDetailsSearchCount(title, theme, attraction, number);
			
		PagingBean PagingBean = new PagingBean(TotalContent, pageNo);
		
		for(PlanResult p : planList){
			planIdList.add(p.getPlanId());
		}
		
		HashMap map = new HashMap();
		map.put("plan_list", planList);
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
		
		List<ReviewResult> reviewList = dao.selectReviewDetailsSearchPaging(pageNo, title, content);
		
		int TotalContent = dao.selectReviewDetailsSearchCount(title, content);
			
		PagingBean PagingBean = new PagingBean(TotalContent, pageNo);
		
		HashMap map = new HashMap();
		map.put("review_list", reviewList);
		map.put("PagingBean", PagingBean);
		map.put("category", "details");
		map.put("type", "review");
		map.put("header_search", "hidden");
		map.put("title", title);
		map.put("content", content);
		return map;
	}

	
	
}
