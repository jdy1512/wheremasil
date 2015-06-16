package com.wheremasil.search.dao;

import java.util.List;

import com.wheremasil.board.vo.ResultBoard;
import com.wheremasil.search.vo.PlanResult;
import com.wheremasil.search.vo.ReviewResult;

public interface SearchDAO {
	
	// defaultSearch
	public abstract List<String> selectPlanSearchPaging(int pageNo, String searchWord);
	
	public abstract List<ResultBoard> selectReviewSearchPaging(int pageNo, String searchWord);
	
	public abstract int selectPlanSearchCount(String searchWord);
	
	public abstract int selectReviewSearchCount(String searchWord);
	
	// detailsSearch
		
	public abstract List<String> selectPlanDetailsSearchPaging(int pageNo, String title, String theme,
															String attraction, String number);
	
	public abstract List<ResultBoard> selectReviewDetailsSearchPaging(int pageNo, String title, String content);
	
	public abstract int selectPlanDetailsSearchCount(String title, String theme, String attraction, String number);
	
	public abstract int selectReviewDetailsSearchCount(String title, String content);
}
