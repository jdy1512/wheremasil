package com.wheremasil.board.service;


import java.io.File;
import java.io.FileWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.wheremasil.board.vo.PagingBean;
import com.wheremasil.board.vo.Reply;
import com.wheremasil.board.vo.ResultBoard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;









import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wheremasil.board.dao.BoardDAOImpl;
import com.wheremasil.board.vo.Board;
@Service
public class BoardServiceImpl {
	@Autowired
	private BoardDAOImpl dao;
	
	public int insertBoardVo(Board board){
		System.out.println("1234");
	
		long time = System.currentTimeMillis(); 
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMddhhmmss");
		String str = dayTime.format(new Date(time));
		
		board.setDateTime(str);
		System.out.println("-----------------");
		System.out.println(board.getDateTime());
		System.out.println(dao);
		//HTML 파일로 컨텐츠를 저장합시다
		
		/*String path="C:\\Users\\JPH.KOSTA_03_030-HP\\Dropbox\\masil\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\masil_jph\\uploads\\files";
		String filename=str+".html";
		
		String htmlTag = "";
		  htmlTag += "<html>";
		  htmlTag += "<head>";
		  htmlTag += "<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>";
		  htmlTag += "</head>";
		  htmlTag += "<body>";
		
		  htmlTag += board.getEditor1();
		  
		  htmlTag += "</body>";
		  htmlTag += "</html>";
		
		 try{
             
	            // 파일 객체 생성
	            File file = new File(path+filename);
	             
	            // true 지정시 파일의 기존 내용에 이어서 작성
	            FileWriter fw = new FileWriter(file, true) ;
	             
	            // 파일안에 문자열 쓰기
	            fw.write(htmlTag);
	            fw.flush();
	 
	            // 객체 닫기
	            fw.close(); 
	             
	             
	        }catch(Exception e){
	            e.printStackTrace();
	        }
		
		System.out.println("html 파일 저장 완료 editor1 파일경로로 변경");
		
		board.setEditor1("http://localhost:8083/masil_jph/uploads/files/"+filename);*/
		int result = dao.insertBoardVo(board);
		System.out.println(result);
		
		return result;
	}
	
	public Map getReviewList(int pageNO){
		HashMap map = new HashMap();
		System.out.println("서비스 겟리뷰리스트");
		 ArrayList list = dao.selectAllReviewPaging(pageNO);
		 int totalContent = dao.selectTotalMemberCount();
		 
		 
		 PagingBean pagingBean = new PagingBean(totalContent, pageNO);
		 map.put("board_list", list.get(0));
		 map.put("like_list", list.get(1));
			map.put("pagingBean", pagingBean);
		 return map;
	}
	
	public Map returnPostringValue(int postring_id){
		
		 String numStr2 = String.valueOf(postring_id);
		
		ResultBoard list =  dao.returnPostringValue(numStr2);
		
		System.out.println("넘어온 리턴포스팅값"+list);
		 
		
		Map map = new HashMap();
		map.put("posting", list);
		
		
		return map;
	}
	
	public int insertRp(Reply context,String rp){
	System.out.println("서비스값"+context);
	int result= dao.insertRp(context);
	
	
	
		return 1;
	}
	
	public String getRplist(String posting_id){
		List<Reply> list = dao.getRplist(posting_id);
		System.out.println("넘어온 리플 리스트"+list);
		Gson gson = new Gson();
		String txt = gson.toJson(list);
		System.out.println("변환된 제잇느"+txt);
		return txt;
	}
	
	public int getRplist2(String posting_id){
		List<Reply> list = dao.getRplist(posting_id);
		System.out.println("리플 수"+list.size());
	
		return list.size();
	}
	
	public int insertLike(String posting_id){
	int i=	dao.insertLike(posting_id);
		System.out.println(i);
		return dao.selectPlike(posting_id);
		
		
	}
	
	public int insertHit(String posting_id){
		int i=	dao.insertHit(posting_id);
			System.out.println(i);
			return dao.selectHit(posting_id);
			
			
		}
public int selHit(String posting_id){
	return dao.selectHit(posting_id);
}
	

	
	
}
