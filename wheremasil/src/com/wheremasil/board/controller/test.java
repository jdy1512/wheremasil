package com.wheremasil.board.controller;


import java.io.FileWriter;

import org.springframework.web.filter.CharacterEncodingFilter;

public class test {
	
	/**
	  * @param args
	  */
	 public static void main(String[] args) throws Exception {
	  FileWriter fw = new FileWriter("D:/test.html");
	  
	  String htmlTag = "";
	  htmlTag += "<html>";
	  htmlTag += "<head>";
	  htmlTag += "<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>";
	  htmlTag += "</head>";
	  htmlTag += "<body>";
	
	  
	  
	  htmlTag += "</body>";
	  htmlTag += "</html>";
	  
	  
	  fw.write(htmlTag);
	  
	  fw.close();
	  System.out.println("끝");
	  
	 }
}
