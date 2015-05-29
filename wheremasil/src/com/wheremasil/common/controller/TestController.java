package com.wheremasil.common.controller;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {
	@Autowired
	private SqlSessionTemplate session;

	@RequestMapping("no_tiles.do")
	public String noTilesView() {
		return "/WEB-INF/view/no_tiles.jsp";
	}
	
	@RequestMapping("dbTest.do")
	@ResponseBody
	public String dbTest() {
		return session.selectOne("common.dao.testMapper.test");
	}
}
