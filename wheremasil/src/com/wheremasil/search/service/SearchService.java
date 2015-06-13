package com.wheremasil.search.service;

import java.util.List;
import java.util.Map;

import com.wheremasil.search.vo.PlanResult;

public interface SearchService {

	// defaultSearch
	public abstract Map getSimpleSearchList(String searchWord);
		
	public abstract Map getPlanSearchListPaging(int pageNo, String searchWord);
	
	public abstract Map getReviewSearchListPaging(int pageNo, String searchWord);
	
	// detailsSearch
	public abstract Map getDetailsSimpleSearchList(String title, String content, String theme,
												String attraction, String number);
	
	public abstract Map getPlanDetailsSearchListPaging(int pageNo, String title, String theme,
												String attraction, String number);
		
	public abstract Map getReviewDetailsSearchListPaging(int pageNo, String title, String content);
}
