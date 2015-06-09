package com.wheremasil.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;










import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;





import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;










import com.wheremasil.board.service.BoardServiceImpl;
import com.wheremasil.board.vo.Board;
import com.wheremasil.board.vo.Reply;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	BoardServiceImpl service;
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("/square.do")
	public String squareController(){
		System.out.println("Accece squareController");
		return "board/square_form.tiles";
	}
	
	
	@RequestMapping("/review.do")
	public ModelAndView reviewController(@RequestParam(defaultValue="1")int page){
		System.out.println("Accece reviewController");
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
		System.out.println("Accece QnaController");
		return "/WEB-INF/view/body/board/qna_form.jsp";
	}
	@RequestMapping("/reivew/writer.do")
	public String revieWriter(){
		System.out.println("Accece revieWriter");
		return "/WEB-INF/view/body/board/review_writer_form.jsp";
		
	}
	@RequestMapping(value="/insertBoardDAO.do",method=RequestMethod.POST)
	public String insertBoardDAO(@ModelAttribute Board board) {
		
		System.out.println("Accece insertBoardDAO");
		System.out.println(board);
		
		int result = service.insertBoardVo(board);
		System.out.println(result);
		
		
		
		
		
		return "redirect:/board/review.do";
	}
	
	
	@RequestMapping("/check.do")
@ResponseBody


	public String check(MultipartHttpServletRequest req, 
		    HttpServletResponse res) throws IllegalStateException, IOException{
		System.out.println("확인");
	
		Iterator<String> itr =  req.getFileNames();
		 MultipartFile mpf = req.getFile(itr.next());
		 Long date = new Date().getTime();
		 System.out.println(date);
		 System.out.println(mpf.getContentType());
		 
		 String a = mpf.getContentType();
		 String[] arr =  a.split("/");
		 System.out.println(arr[1]);
		 
		//이경로 수정해야됨
		// File file = new File("/wheremasil/uploads/"
		//		 +date+"."+arr[1]);
		 //String path = req.getServletContext().getRealPath("/uploads/files/");
		 //String path1= "C:\\Users\\JPH.KOSTA_03_030-HP\\git\\wheremasil1\\wheremasil\\WebContent\\uploads\\images\\";
		 String path1="C:\\Users\\JPH.KOSTA_03_030-HP\\Dropbox\\masil\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\wheremasil\\uploads\\images\\posting_img\\";
		 String fileName = System.currentTimeMillis()+""; 
		 File pic = new File(path1, fileName+"."+arr[1]);
		 
		 System.out.println("저장된 파일위치"+pic);
		 
		 
		 mpf.transferTo(pic);
		 
		
		 
		 
		return date.toString()+"."+arr[1];
	}
	
	@RequestMapping(value="/insertRp.do",produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String insertRp( @RequestParam String editor1,@RequestParam String member_id,@RequestParam String posting_id ) {
		
		
		long time = System.currentTimeMillis(); 
		System.out.println(editor1 );
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMddhhmmss");
		String str = dayTime.format(new Date(time));
		// Reply(reply_id, r_parent_id, r_datetime, r_level, posting_id, member_id, r_content)
		Reply reply = new Reply("x", "x", str, 0, posting_id, member_id,editor1);
		System.out.println("컨트롤러리플값"+reply);
		int r=	service.insertRp(reply,editor1);
		
		
	
	System.out.println("통과");
		System.out.println(r);
		return service.getRplist(posting_id);
		
	}
	
	@ResponseBody
	@RequestMapping("/rpcnt.do")
	public String getRpcnt(@RequestParam String p_id){
		System.out.println("넘어온 포스팅아이디1234"+p_id);
		
		int cnt = service.getRplist2(p_id);
		 String numStr2 = String.valueOf(cnt);
	        System.out.println(numStr2);
		
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
     System.out.println(numStr2);
     
     return numStr2;
	
	}
	
	@RequestMapping("/selHit.do")
	@ResponseBody
	public String selHIt(@RequestParam String posting_id){
		System.out.println("셀힛 접근");
	int i=	service.selHit(posting_id);
	 String numStr2 = String.valueOf(i);
     System.out.println(numStr2);
     
     return numStr2;
	
	}
	
	@RequestMapping("/insertHit.do")
	@ResponseBody
	public String insertHIt(@RequestParam String posting_id){
		System.out.println("셀힛 접근");
		service.insertHit(posting_id);
	int i=	service.selHit(posting_id);
	 String numStr2 = String.valueOf(i);
     System.out.println(numStr2);
     
     return numStr2;
	
	}
	
	
	
	

}
