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
import com.wheremasil.member.vo.Member;
@Service
public class BoardServiceImpl {
	@Autowired
	private BoardDAOImpl dao;
	
	
	public String returnNic(String member_id){
	
		List<Member> mList =  dao.returnMemberInfo(member_id);
		System.out.println(mList.get(0).getM_name());
		return mList.get(0).getM_name();		
	}
	
	public Map modiReveiw(String posting_id){
		ResultBoard b =  dao.returnPostingInfo(posting_id);
		HashMap map = new HashMap();
		
		map.put("board", b);
		
		return map;
	}
	
	
	public String deletePost(String posting_id){
	int i = 	dao.deletePost(posting_id);
	String r="";
		if(i==1){
			r="성공";
		}
		else{
			r="실패";
		}
		return r;
	}
	
	public String RdeletePost(String posting_id){
		int i = 	dao.RdeletePost(posting_id);
		String r="";
			if(i==1){
				r="성공";
			}
			else{
				r="실패";
			}
			System.out.println(i);
			return r;
		}
	
	
	public String insertRpcnt(String posting_id){
		List<Reply> list = dao.insertRpcnt(posting_id);
		
		String to = Integer.toString(list.size());
		
		return to;
	}
	
	
	
	public String returnCategoriList(String categori){
		
		List<ResultBoard> list =  dao.returnCategoriList(categori);
		Gson gson = new Gson();
		String txt = gson.toJson(list);
		
		//("보내기전 카테고리 리스트 = " + txt );
		return txt;
	}
	
	
	
	
	public String selectSlike(){
		List<Board> list = dao.selectSlike();
		Gson gson = new Gson();
		String txt = gson.toJson(list);
		
		return txt;
		
	}
	
	
	
	
	public String returnMemberImg(String member_id){
		List<Member> mList =  dao.returnMemberInfo(member_id);
		//(mList);
		
		
		
		
		return mList.get(0).getM_prof_img_path();
	}
	
	public String returnPostingInfo(String posting_id){
		ResultBoard board =  dao.returnPostingInfo(posting_id);
		//(board);
		
		
		Gson gson = new Gson();
		String txt = gson.toJson(board);
		
		//("넘기기전 변환된 포스팅 인포 = "+txt );
		return txt;
	
		
		
		
	}
	
	
	
	public String returnSbValue(){
		List<ResultBoard> list =dao.returnSbValue();
		
		 
		//("넘어온 광장 리스트"+list);
		Gson gson = new Gson();
		String txt = gson.toJson(list);
		//("변환된 제잇느"+txt);
		return txt;
		
		
	}
	
	
	
	
	public int insertSb(String categori,String msg,String login_id,String m_name){
		
	
		
		
		
		
		long time = System.currentTimeMillis(); 
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMddHHmmss");
		String str = dayTime.format(new Date(time));
		
		//("저장될 data"+str);
		
		Board board = new Board(login_id, categori, "x", msg, str, "x", m_name);
		
		
		return dao.insertSb(board);
	}
	
	public int insertBoardVo(Board board){
		//("1234");
	
		long time = System.currentTimeMillis(); 
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMddhhmmss");
		String str = dayTime.format(new Date(time));
		
		board.setDateTime(str);
		//("-----------------");
		//(board.getDateTime());
		//(dao);
		if(board.getSumname().equals("default")){
			board.setSumname("http://192.168.7.122:8082/wheremasil/uploads/images/default/posting_no_images.png");
		}
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
		
		//("html 파일 저장 완료 editor1 파일경로로 변경");
		
		board.setEditor1("http://localhost:8083/masil_jph/uploads/files/"+filename);*/
		int result = dao.insertBoardVo(board);
		//(result);
		
		return result;
	}
	
	public Map getReviewList(int pageNO){
		HashMap map = new HashMap();
		//("서비스 겟리뷰리스트");
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
		
		//("넘어온 리턴포스팅값"+list);
		 if(list==null){
			 //("리스트 널확인");
			 list =  dao.returnPostringValue("1");
			 //("교체된 리스트"+list);
		 }
		
		Map map = new HashMap();
		map.put("posting", list);
		
		
		return map;
	}
	
	public int insertRp(Reply context){
	//("서비스값"+context);
	int result= dao.insertRp(context);
	
	
	
		return 1;
	}
	
	public String getRplist(String posting_id){
		List<Reply> list = dao.getRplist(posting_id);
		//("넘어온 리플 리스트"+list);
		Gson gson = new Gson();
		String txt = gson.toJson(list);
		//("변환된 제잇느"+txt);
		return txt;
	}
	
	public int getRplist2(String posting_id){
		List<Reply> list = dao.getRplist(posting_id);
		//("리플 수"+list.size());
	
		return list.size();
	}
	
	public int insertLike(String posting_id){
	int i=	dao.insertLike(posting_id);
		//(i);
		return dao.selectPlike(posting_id);
		
		
	}
	
	public int insertHit(String posting_id){
		int i=	dao.insertHit(posting_id);
			//(i);
			return dao.selectHit(posting_id);
			
			
		}
public int selHit(String posting_id){
	return dao.selectHit(posting_id);
}
	

	
	
}
