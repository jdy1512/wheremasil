/**
 * 
 */
package com.wheremasil.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wheremasil.member.service.MemberService;
import com.wheremasil.member.validator.MemberValidator;
import com.wheremasil.member.vo.Member;


@Controller
@RequestMapping("/member")
public class MemberController{

	@Autowired
	
	
	@Qualifier("memberService")
	private MemberService service;

	@RequestMapping("/join.do")
	@ResponseBody
	public String  joinform()throws Exception{
		
		return "member/join_form.tiles";
	}
	@RequestMapping("/joinSuccess.do")
	@ResponseBody
	public String joinSuccess(String m_name1,String m_password1,String member_id12,HttpSession session,HttpServletRequest request)throws Exception{
	
		
		Member member = new Member(member_id12, m_name1, m_password1, "", "", "", "", "", "");		
		
	
		member.setM_email(member.getMember_id());
		
		String result="";
		
		Object o = service.getMemberById(member_id12);
	
		if(o==null){
			
			o= service.getMemberByName(m_name1);
			
			if(o==null){
				int count = service.joinMember(member);
				
			}else{
				//닉넴중복
				result= "2";
			}
			
		}else{
			//아이디 중복
			result= "1";
		}
		
		

		
	/*	
		int count = service.joinMember(member);
		if(count == -1){
			session.setAttribute("error", "id중복됩니다.");
			return "1";
		}
		System.out.println(count);
		
		return "main.tiles";*/
	return result;
	}

	@RequestMapping(value="/sessionlogincheck.do")
	@ResponseBody
	public String logincheck(@RequestParam String member_id, @RequestParam String m_password,String default_url,HttpSession session, HttpServletResponse response,HttpServletRequest request, ModelMap map)throws Exception{
	//System.out.println("로그인상황 = "+request.getSession().getAttribute("login_info"));
		
		
	
		
		Member m = service.getMemberById(member_id);
		
		
		String url = null;
		System.out.println(member_id+m_password);
		if(m!=null){
			if(m_password.equals(m.getM_password())){
			
				session.setAttribute("login_info", m);
				session.setMaxInactiveInterval(180);
				url = default_url;
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
	public String logout(String page, HttpSession session){
		
		
		session.invalidate();
		System.out.println(page);
		if(page.equals("http://127.0.0.1:8078/wheremasil/")){
			page = "main.tiles";
		}
		return page;
	}
	@RequestMapping("/memberchange.do")
	@ResponseBody
	public String change(String member_id,String m_password){
		System.out.println("수정");
		int change1= service.modifyMember(member_id,m_password);
		String change2;
		if(change1==1){
			change2 = "a";
		}else{
			change2="b";
		}
		return change2;
	}
	@RequestMapping("/logoutmypage.do")
	public String logoutmypage(){
		return "main.tiles";
	}
	
	
}

	

