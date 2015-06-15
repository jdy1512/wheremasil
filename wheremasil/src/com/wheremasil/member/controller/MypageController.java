package com.wheremasil.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.wheremasil.member.vo.Member;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@RequestMapping("/mypageconn.do")
	public String mypage(String page) throws Exception {

	

		return "member/mypage_form.tiles";
	}

	
	
}
