package com.wheremasil.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {

	@RequestMapping("no_tiles.do")
	public String noTilesView() {
		return "/WEB-INF/view/no_tiles.jsp";
	}
}
