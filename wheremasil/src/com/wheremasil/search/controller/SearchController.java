package com.wheremasil.search.controller;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wheremasil.search.service.SearchService;

@Controller
@RequestMapping("/search/")
public class SearchController {

	@Autowired
	private SearchService service;
	
	// simpleSearch controller
	@RequestMapping("simpleSearch.do")
	public ModelAndView simpleSearch(@RequestParam(defaultValue="1")int page,
						String searchWord, String category, String title, String content,
						String theme, String attraction, String number){
		Map map = new HashMap();
				
		if(category.equals("simple")){
			map = service.getSimpleSearchList(page, searchWord);
		}else if(category.equals("detailsSimple")){
			map = service.getDetailsSimpleSearchList(page, title, content, theme, attraction, number);
		}
		return new ModelAndView("search/search_result_form.tiles", map);
	}
	
	// defaultSearch controller
	@RequestMapping("defaultSearch.do")
	public ModelAndView defaultSearch(@RequestParam(defaultValue="1")int page,
									String searchWord, String category, String type){
		Map map = new HashMap();
		
		if(searchWord.trim().equals("")){
			return new ModelAndView("search/search_result_form.tiles");
		}
		
		if(type.equals("plan")){
			map = service.getPlanSearchListPaging(page, searchWord);
		}else if(type.equals("review")){
			map = service.getReviewSearchListPaging(page, searchWord);
		}
		return new ModelAndView("search/search_result_form.tiles", map);
	}
	
	// detailsSearch controller
	@RequestMapping("detailsSearch.do")
	public ModelAndView detailsSearch(@RequestParam(defaultValue="1")int page,
									String category, String type, String title, String content,
									String theme, String attraction, String number){
		Map map = new HashMap();
		
		if(title.trim().equals("")&&content.trim().equals("")&&theme.trim().equals("")&&
			attraction.trim().equals("")&&number.trim().equals("")){
			return new ModelAndView("search/search_result_form.tiles");
		}
		
		if(type.equals("plan")){
			map = service.getPlanDetailsSearchListPaging(page, title, theme, attraction, number);
		}else if(type.equals("review")){
			map = service.getReviewDetailsSearchListPaging(page, title, content);
		}
				
		return new ModelAndView("search/search_result_form.tiles", map);
	}
	
	
	
}
