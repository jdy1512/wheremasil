package com.wheremasil.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.wheremasil.board.service.BoardServiceImpl;
import com.wheremasil.board.vo.Board;
import com.wheremasil.board.vo.Reply;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	BoardServiceImpl service;
	
	@RequestMapping("/modiReveiw.do")
	public ModelAndView modiReveiw(String posting_id){
		System.out.println(posting_id);
		Map map = service.modiReveiw(posting_id);
		System.out.println("맵찍기"+map);
		return new ModelAndView("/WEB-INF/view/body/board/review_writer_form.jsp", map);
	}
	
	
	@ResponseBody
	@RequestMapping("/deletePost.do")
	public String deletePost(String posting_id){
		
		return service.deletePost(posting_id);
	}
	
	
	
	@RequestMapping("/insertRpcnt.do")
	@ResponseBody
	public String insertRpcnt(String posting_id){
		return service.insertRpcnt(posting_id);
		
		
	}
	
	
	
	
	@RequestMapping("returnCategoriList.do")
	@ResponseBody
	public String returnCategoriList(String categori){
		String  txt = service.returnCategoriList(categori);
		
		return txt;
	}
	
	
	

	@RequestMapping("/selectSlike.do")
	@ResponseBody
	public String selectSlike(){
		//("추천리턴 접근");
		
	return service.selectSlike();	
		
	}
	
	
	
	@RequestMapping("/getMemberImg.do")
	@ResponseBody
	public String getMemberImg(String member_id){
		//("getMemberImg접근 넘어온 member_id =" + member_id);
		String imgPath = service.returnMemberImg(member_id);
	//("넘어갈 이미지 주소 = "+ imgPath);
	return imgPath;
	}
	
	
	@RequestMapping("/getMemberInfo.do")
	@ResponseBody
	public String getMemberInfo(String posting_id){
		//("getMemberInfo접근 넘어온 posting_id =" + posting_id);
		String txt = service.returnPostingInfo(posting_id);
	//("넘기기전 member_info = "+ txt);
	return txt;
	}
	
	
	
	
	@RequestMapping("/Sblist.do")
	@ResponseBody
	public String returnSbValue(){
		
		//("Sblist.do 접근");
		
		
		String re = service.returnSbValue();
		
		
		//("보내기전 sb리스트 = " + re);
		
		return re;
	}
	
	
	@RequestMapping("/insertSb.do")
	@ResponseBody
	public String insertSb(@RequestParam String categori,@RequestParam String msg ,@RequestParam String login_id) throws UnsupportedEncodingException{
		
		
		
		
		
		
	
		
		
		service.insertSb(categori, msg, login_id);
		
		return "성공";
		
	}	
	
	
	
	
	
	
	@RequestMapping("/square.do")
	public String squareController(){
		//("Accece squareController");
		return "board/square_form.tiles";
	}
	
	
	@RequestMapping("/review.do")
	public ModelAndView reviewController(@RequestParam(defaultValue="1")int page){
		//("Accece reviewController");
		Map map =service.getReviewList(page);
		return new ModelAndView("board/review_list_form.tiles", map);
		
	}
	@RequestMapping("/postingVal")
	public ModelAndView returnPostValue(@RequestParam(defaultValue="1") int postring_id){
		Map map = service.returnPostringValue(postring_id);
		
		return new ModelAndView("/WEB-INF/view/body/board/review_detail_form.jsp", map);
	}
	
	
	
	
	@RequestMapping("/qna.do")
	public String QnaController(){
		//("Accece QnaController");
		return "/WEB-INF/view/body/board/qna_form.jsp";
	}
	@RequestMapping("/reivew/writer.do")
	public String revieWriter(){
		//("Accece revieWriter");
		return "/WEB-INF/view/body/board/review_writer_form.jsp";
		
	}
	@RequestMapping(value="/insertBoardDAO.do",method=RequestMethod.POST)
	public String insertBoardDAO(@ModelAttribute Board board) {
		
		//("Accece insertBoardDAO");
		//(board);
		
		int result = service.insertBoardVo(board);
		//(result);
		
		
		
		
		
		return "redirect:/board/review.do";
	}

	
	@RequestMapping(value = "/check.do" , method = RequestMethod.POST)
@ResponseBody
	public String check(MultipartHttpServletRequest req, 
		    HttpServletResponse res) throws IllegalStateException, IOException{
		System.out.println("파일 저장 들어옴");
	
		Iterator<String> itr =  req.getFileNames();
		 MultipartFile mpf = req.getFile(itr.next());
		 Long date = new Date().getTime();
		 //(date);
		 //(mpf.getContentType());
		 
		 String a = mpf.getContentType();
		 String[] arr =  a.split("/");
		 //(arr[1]);
		 
		//이경로 수정해야됨
		// File file = new File("/wheremasil/uploads/"
		//		 +date+"."+arr[1]);
		 //String path = req.getServletContext().getRealPath("/uploads/files/");
		 //String path1= "C:\\Users\\JPH.KOSTA_03_030-HP\\git\\wheremasil1\\wheremasil\\WebContent\\uploads\\images\\";
		 String path1="C:\\Users\\JPH.KOSTA_03_030-HP\\git\\wheremasil3\\wheremasil\\WebContent\\uploads\\images\\posting_img\\";
		 String fileName = System.currentTimeMillis()+""; 
		 File pic = new File(path1, fileName+"."+arr[1]);
		 
		 //("저장된 파일위치"+pic);
		 
		 
		 mpf.transferTo(pic);
		 
		
		 
		 
		return date.toString()+"."+arr[1];
	}
	
	@RequestMapping(value="/insertRp.do",produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String insertRp( @RequestParam String editor1,@RequestParam String member_id,@RequestParam String posting_id ) {
		
		
		long time = System.currentTimeMillis(); 
		//(editor1 );
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMddhhmmss");
		String str = dayTime.format(new Date(time));
		// Reply(reply_id, r_parent_id, r_datetime, r_level, posting_id, member_id, r_content)
		Reply reply = new Reply("x", "x", str, 0, posting_id, member_id,editor1);
		//("컨트롤러리플값"+reply);
		int r=	service.insertRp(reply,editor1);
		
		
	
	//("통과");
		//(r);
		return service.getRplist(posting_id);
		
	}
	
	@ResponseBody
	@RequestMapping("/rpcnt.do")
	public String getRpcnt(@RequestParam String p_id){
		//("넘어온 포스팅아이디1234"+p_id);
		
		int cnt = service.getRplist2(p_id);
		 String numStr2 = String.valueOf(cnt);
	        //(numStr2);
		
		return numStr2;
	}
	
	
	
	
	
	
	
	
	@RequestMapping(value="/sinsertRp.do",produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String sinsertRp(@RequestParam String editor1 ) {
		
		
	
	
		return service.getRplist(editor1);
		
	}
	
	@RequestMapping("/insertLike.do")
	@ResponseBody
	public String insertLike(@RequestParam String posting_id){
	int i=	service.insertLike(posting_id);
	 String numStr2 = String.valueOf(i);
     //(numStr2);
     
     return numStr2;
	
	}
	
	@RequestMapping("/selHit.do")
	@ResponseBody
	public String selHIt(@RequestParam String posting_id){
		//("셀힛 접근");
	int i=	service.selHit(posting_id);
	 String numStr2 = String.valueOf(i);
     //(numStr2);
     
     return numStr2;
	
	}
	
	@RequestMapping("/insertHit.do")
	@ResponseBody
	public String insertHIt(@RequestParam String posting_id){
		//("셀힛 접근");
		service.insertHit(posting_id);
	int i=	service.selHit(posting_id);
	 String numStr2 = String.valueOf(i);
     //(numStr2);
     
     return numStr2;
	
	}
	
	
	
	

}
