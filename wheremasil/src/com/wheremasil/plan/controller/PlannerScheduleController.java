package com.wheremasil.plan.controller;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wheremasil.plan.service.PlannerScheduleService;
import com.wheremasil.plan.validator.PlannerScheduleValidator;
import com.wheremasil.plan.vo.Area;
import com.wheremasil.plan.vo.PlannerSchedule;

@Controller
@RequestMapping("plan/")
public class PlannerScheduleController {
	
	@Autowired
	PlannerScheduleService service;

	@RequestMapping("map")
	public ModelAndView showPlannerScheduleMap(@ModelAttribute PlannerSchedule plan, Errors errors, HttpServletRequest request) {
		new PlannerScheduleValidator().validate(plan, errors);
		if(errors.hasErrors()){
			return new ModelAndView("main.tiles", "errors", errors.getAllErrors());
		}
		
		return new ModelAndView("plan/map.tiles", "plan", plan);
	}

	@RequestMapping("getAreasByRange")
	@ResponseBody
	public List<Area> getAreasByRange(@RequestParam double stLat, @RequestParam double stLon, 
			@RequestParam double enLat, @RequestParam double enLon) {
		Area area = new Area();
		area.setStLat(stLat);
		area.setStLon(stLon);
		area.setEnLat(enLat);
		area.setEnLon(enLon);
		return service.getAreasByRange(area);
	}

	@RequestMapping("registArea")
	@ResponseBody
	public int registArea(@RequestParam String title, @RequestParam String address, @RequestParam String imageUrl, @RequestParam String latitude, @RequestParam String longitude, HttpServletRequest request) {
		Area area = new Area();
		area.setTitle(title);
		area.setAddress(address);
		area.setLatitude(latitude);
		area.setLongitude(longitude);
		area.setImgPath(imageUrl);
		
		// area 등록
		int result = service.registArea(area);
		
		String id = null;
		if (result == 1) {
			// id 추출
			id = service.getAreaIdByName(title);
			
			if (id != null) {
				// image file download
				try {
					String localPath = request.getSession().getServletContext().getRealPath("/uploads/images/area/" + id);
					new File(localPath).mkdirs();
					
					if (!imageUrl.contains("wheremasil")) {
						imgFileDownload(localPath, imageUrl, "main", "png");
					} else {
						imageUrl = request.getSession().getServletContext().getRealPath("/uploads/images/default/img_not_found.png");
						imgFileCopy(localPath, imageUrl, "main", "png");
					}
					
					// workspace로 copy (backup)
					String wsLocalPath = "C:/Users/KOSTA_03_001_/git/wheremasil/wheremasil/WebContent/uploads/images/area/" + id;
					new File(wsLocalPath).mkdirs();
					imgFileCopy(wsLocalPath, localPath + "/main.png", "main", "png");
				} catch (Exception e) {
					e.printStackTrace();
					return -1;
				}
			}
		}
		return result;
	}

	private void imgFileDownload(String localPath, String path, String name, String file_ext) throws Exception {
		BufferedImage image = null;
		image = ImageIO.read(new URL(path));
		BufferedImage bufferedImage = new BufferedImage(image.getWidth(),
				image.getHeight(), BufferedImage.TYPE_INT_BGR);

		Graphics2D graphics = (Graphics2D) bufferedImage.getGraphics();
		graphics.setBackground(Color.WHITE);
		graphics.drawImage(image, 0, 0, null);

		ImageIO.write(bufferedImage, file_ext, new File(localPath + "/" + name + "." + file_ext));
	}

	private void imgFileCopy(String localPath, String path, String name, String file_ext) throws Exception {
		File rscFile = new File(path);
		FileInputStream fis = new FileInputStream(rscFile);
		File descFile = new File(localPath + "/" + name + "." + file_ext);
		FileOutputStream fos = new FileOutputStream(descFile);
		
		int i = 0;
		while (( i = fis.read()) != -1)
			fos.write(i);

		fos.close();
		fis.close();
	}
	
	// 수정중
	@RequestMapping("planInfo")
	public ModelAndView planInfo(@RequestParam Map<String, Object> map, HttpServletRequest request){
//		String costFood2=(String) request.getParameter("costFood2");
//		String costFood1=(String) request.getParameter("costFood1");
//		System.out.println("request : "  +costFood2);
//		System.out.println("request : "  +costFood1);
//		System.out.println("title=" +plan.getTitle()+"startDate "+plan.getStartDate()+"endDate "+plan.getEndDate()+"theme"+plan.getTheme());
		for(Object s: map.entrySet()) {
			System.out.println(s);
		}
		
		return null;
	}
}
