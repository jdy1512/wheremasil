package com.wheremasil.member.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wheremasil.member.vo.Member;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	
	@RequestMapping("/mypageconn.do")
	public String mypage(String page)throws Exception{
		
		System.out.println("123");
		
		return "member/mypage_form.tiles";
	}
	
}
