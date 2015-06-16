/**
 * 
 */
package com.wheremasil.member.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.wheremasil.member.service.MemberService;
import com.wheremasil.member.vo.Member;


@Controller
@RequestMapping("/member")
public class MemberController{

	@Autowired
	private MemberService service;

	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	@ResponseBody
	public String joinMember(@ModelAttribute Member member, HttpServletRequest request)throws Exception{
		
		member.setM_email(member.getMember_id());
		MultipartFile file = member.getPicture();
		if(file != null && !file.isEmpty()){
			String path = request.getServletContext().getRealPath("/uploads/images/profile");
			String fileName = System.currentTimeMillis()+"";
			File pic = new File(path, fileName);
			file.transferTo(pic);//파일 이동
			member.setM_prof_img_path(fileName);
		}
		
		return service.joinMember(member);
		
	}
	
	@RequestMapping("/login.do")
	@ResponseBody
	public String login(String member_id, String m_password, HttpServletRequest request, ModelMap map)throws Exception{
		
		Member m = service.getMemberById(member_id);
		
		String url = null;
		
		if(m!=null){
			if(m_password.equals(m.getM_password())){
				
				request.getSession().setAttribute("login_info",m);
				url = "success";
			}else{
				url =  "1";
				map.addAttribute("error_message", "Password를 확인하세요");
			}
		}else{
			url = "2";
			map.addAttribute("error_message", "ID를 확인하세요");
		}
		return url;
	}
	
	@RequestMapping("/logout.do")
	public void logout(HttpSession session){
		session.invalidate();
	}
	
	@RequestMapping("/mypageconn.do")
	public ModelAndView mypage(String member_id) throws Exception {
		Map map = new HashMap();
		map = service.getPlanId(member_id);
		return new ModelAndView("member/mypage_form.tiles",map);
	}
	
	@RequestMapping(value="/modifyMember.do", method=RequestMethod.POST	)
	public ModelAndView change(@ModelAttribute Member member, HttpSession session, HttpServletRequest request) throws Exception{
		
		
		Member loginInfo = (Member)session.getAttribute("login_info");
		
		MultipartFile file = member.getPicture();
		
		String newFileName = null;
		if(file!=null&&!file.isEmpty()){
			newFileName = System.currentTimeMillis()+"";
			File picture = new File(request.getServletContext().getRealPath("/uploads/images/profile"), newFileName);
			file.transferTo(picture);
			if(loginInfo.getM_prof_img_path() != null){
				File oldPic = new File(request.getServletContext().getRealPath("/uploads/images/profile"), loginInfo.getM_prof_img_path());
				oldPic.delete();
			}
			member.setM_prof_img_path(newFileName);
		}
		Map map = new HashMap();
		map = service.getPlanId(member.getMember_id());
		service.modifyMember(member);
		loginInfo.setM_name(member.getM_name());
		loginInfo.setM_password(member.getM_password());
		if(newFileName != null){
			loginInfo.setM_prof_img_path(newFileName);
		}
		return new ModelAndView("member/mypage_form.tiles", map);
	}
	
	
	@RequestMapping("/logoutmypage.do")
	public String logoutmypage(){
		return "main.tiles";
	}
	
}

	

