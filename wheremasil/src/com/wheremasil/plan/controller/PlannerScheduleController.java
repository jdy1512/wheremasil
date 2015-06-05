package com.wheremasil.plan.controller;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

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
import com.wheremasil.plan.vo.Cost;
import com.wheremasil.plan.vo.PlannerSchedule;
import com.wheremasil.plan.vo.Schedule;

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
	public ModelAndView planInfo(@RequestParam Map<String, Object> map,HttpServletRequest request){
		request.getSession().setAttribute("login_info", "qwer");
		PlannerSchedule ps = new PlannerSchedule();
		ArrayList<Schedule> scheduleList = new ArrayList<Schedule>();
		Schedule schedule = null;
		ArrayList<Cost> costList = null;
		ArrayList<Area> areaList = null;
		Cost cost = null;
		Area area = null;
		
		ps.setTitle((String) map.get("title"));
		ps.setTheme((String) map.get("theme"));
		ps.setStartDate((String) map.get("startDate"));
		ps.setEndDate((String) map.get("endDate"));
		ps.setGroupNum(Integer.parseInt((String) map.get("groupNum")));
		ps.setMemberId((String) request.getSession().getAttribute("login_info"));
		
		map.remove("title");
		map.remove("theme");
		map.remove("startDate");
		map.remove("endDate");
		map.remove("groupNum");
		
		// System.out.println(ps);
		int curScheduleIdx = -1;
		int curCostIdx = -1;
		for(Entry<String, Object> entry: map.entrySet()) {
		//	System.err.println(entry);
			String[] keySplit = ((String) entry.getKey()).split(",");
			int scheduleIdx = Integer.parseInt(keySplit[0].split(":")[1]);
			int costIdx = Integer.parseInt(keySplit[1].split(":")[1]);
			String key = keySplit[2];
			String value = (String) entry.getValue();
			
			if (curScheduleIdx != scheduleIdx) {
				if (curScheduleIdx != -1) {
					costList.add(cost);
					areaList.add(area);
					schedule.setCostList(costList);
					schedule.setAreaList(areaList);
					scheduleList.add(schedule);
					//System.out.println(schedule);
				}
				curScheduleIdx = scheduleIdx;
				curCostIdx = -1;
				schedule = new Schedule();
				costList = new ArrayList<Cost>();
				areaList = new ArrayList<Area>();
			}
			
			if (curCostIdx != costIdx && costIdx != 0) {
				if (curCostIdx != -1) {
					costList.add(cost);
					areaList.add(area);
				}
				curCostIdx = costIdx;
				cost = new Cost();
				area = new Area();
			}
			
			if(key.equals("costFood")){
				cost.setCostFood(Integer.parseInt(value));
			} else if(key.equals("costVehicle")){
				cost.setCostVehicle(Integer.parseInt(value));
			} else if(key.equals("costStay")){
				cost.setCostStay(Integer.parseInt(value));
			} else if(key.equals("costEtc")){
				cost.setCostEtc(Integer.parseInt(value));
			} else if(key.equals("memo")){
				schedule.setMemo(value);
			}
		}// end of for
		// 마지막 값들
		costList.add(cost);
		areaList.add(area);
		schedule.setCostList(costList);
		schedule.setAreaList(areaList);
		scheduleList.add(schedule);
	//	System.out.println(schedule);

		ps.setScheduleList(scheduleList);
		System.out.println(ps);
		service.registPlanSchedule(ps);
		schedule.setPlanId(service.getPlanId(ps.getMemberId()));
		
		
		
		
		//return new ModelAndView("plan/map.tiles", "plannerSchedule", ps);
		return null;
	}
}
