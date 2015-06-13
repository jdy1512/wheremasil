package com.wheremasil.search.dao;

import java.util.List;

import com.wheremasil.search.vo.PlanResult;
import com.wheremasil.search.vo.ReviewResult;

public interface SearchDAO {
	
	// defaultSearch
	public abstract List<PlanResult> selectPlanSearch(String searchWord);
	
	public abstract List<ReviewResult> selectReviewSearch(String searchWord);
	
	public abstract List<PlanResult> selectPlanSearchPaging(int pageNo, String searchWord);
	
	public abstract List<ReviewResult> selectReviewSearchPaging(int pageNo, String searchWord);
	
	public abstract int selectPlanSearchCount(String searchWord);
	
	public abstract int selectReviewSearchCount(String searchWord);
	
	// detailsSearch
	public abstract List<PlanResult> selectPlanDetailsSearch(String title, String theme,
													String attraction, String number);
	
	public abstract List<ReviewResult> selectReviewDetailsSearch(String title, String content);
	
	public abstract List<PlanResult> selectPlanDetailsSearchPaging(int pageNo, String title, String theme,
															String attraction, String number);
	
	public abstract List<ReviewResult> selectReviewDetailsSearchPaging(int pageNo, String title, String content);
	
	public abstract int selectPlanDetailsSearchCount(String title, String theme, String attraction, String number);
	
	public abstract int selectReviewDetailsSearchCount(String title, String content);
}
