package com.wheremasil.plan.controller;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
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
import com.wheremasil.plan.vo.AreaCost;
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
	public String registArea(@RequestParam String title, @RequestParam String address, @RequestParam String imageUrl, @RequestParam String latitude, @RequestParam String longitude, HttpServletRequest request) {
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
					String wsLocalPath = "C:/Users/KOSTA_03_001_/Desktop/wheremasil_master/wheremasil/wheremasil/WebContent/uploads/images/area/" + id;
					new File(wsLocalPath).mkdirs();
					imgFileCopy(wsLocalPath, localPath + "/main.png", "main", "png");
				} catch (Exception e) {
					e.printStackTrace();
					return null;
				}
			}
		}
		return id;
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
	
	@RequestMapping("planInfo")
	public ModelAndView planInfo(@RequestParam Map<String, Object> map, HttpServletRequest request){
		request.getSession().setAttribute("login_info", "admin@wheremasil.com");
		PlannerSchedule ps = new PlannerSchedule();
		Schedule schedule = null;
		AreaCost areaCost = null;
		String scheduleDate = null;
		String schedulePlanId = null;
		Calendar c = null;

		// plan db 등록
		ps.setTitle((String) map.get("title"));
		ps.setTheme((String) map.get("theme"));
		ps.setStartDate((String) map.get("startDate"));
		ps.setEndDate((String) map.get("endDate"));
		ps.setGroupNum(Integer.parseInt((String) map.get("groupNum")));
		ps.setMemberId((String) request.getSession().getAttribute("login_info"));

		try {
			int result = service.registPlanSchedule(ps);
			
			if (result == 1) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyymmdd");
				Date date = sdf.parse(ps.getStartDate());
				c = new GregorianCalendar();

				//DB에서 해당 플랜 ID조회
				schedulePlanId = service.getPlanId(ps.getMemberId());
				
				// split 형식에 맞지않는 prof 삭제
				map.remove("title");
				map.remove("theme");
				map.remove("startDate");
				map.remove("endDate");
				map.remove("groupNum");
				
				int curScheduleIdx = -1; //현재 Schedule idx 
				int curCostIdx = -1; // 현재 cost idx
				
				for(Entry<String, Object> entry: map.entrySet()) {
					String[] keySplit = ((String) entry.getKey()).split(",");
					int scheduleIdx = Integer.parseInt(keySplit[0].split(":")[1]);
					int costIdx = Integer.parseInt(keySplit[1].split(":")[1]);
					String key = keySplit[2];
					String value = (String) entry.getValue();
					
					if (curScheduleIdx != scheduleIdx) {
						System.out.println("----------------------------------------------");
						curScheduleIdx = scheduleIdx;
						curCostIdx = -1;
						
						// 날짜 증가
						c.setTime(date);
						c.add(Calendar.DAY_OF_MONTH, curScheduleIdx - 1);
						scheduleDate = sdf.format(c.getTime());
						
						// 새로운 스케줄(DAY)이 생성되는 곳. 
						schedule = new Schedule();
						schedule.setsDate(scheduleDate);
						schedule.setPlanId(schedulePlanId);
						schedule.setMemo("");

						// schedule db 등록
						service.registSchedule(schedule);
					}

					if (curCostIdx != costIdx && costIdx != 0) {// 새로운 일정이 추가.
						if (curCostIdx != -1) { // 각 DAY별 처음 제외.
							// area_cost db 등록
							areaCost.setAcSeq(curCostIdx);
							areaCost.setsDate(scheduleDate);
							areaCost.setPlanId(schedulePlanId);
							service.registAreaCost(areaCost);
							System.out.println(areaCost);
						} // 새로운 일정이 생성되는 곳. 
						curCostIdx = costIdx;
						areaCost = new AreaCost();
					} else if (curCostIdx == -1 && costIdx == 0) {
						curCostIdx = 1;
					}
					
					if(key.equals("areaId")){
						areaCost.setAreaId(value);
					} else if(key.equals("costFood")){
						areaCost.setAcFood(Integer.parseInt(value));
					} else if(key.equals("costVehicle")){
						areaCost.setAcVehicle(Integer.parseInt(value));
					} else if(key.equals("costStay")){
						areaCost.setAcStay(Integer.parseInt(value));
					} else if(key.equals("costEtc")){
						areaCost.setAcEtc(Integer.parseInt(value));
					} else if(key.equals("memo")){
						schedule.setMemo(value);
						// 메모 업데이트
						service.setScheduleByMemo(schedule);
						
						// area_cost db 등록
						areaCost.setAcSeq(curCostIdx);
						areaCost.setsDate(scheduleDate);
						areaCost.setPlanId(schedulePlanId);
						service.registAreaCost(areaCost);

						System.out.println(areaCost);
						System.out.println(schedule);
					}
				}// end of for
			}// end of if(result)
		} catch (ParseException e) {
			e.printStackTrace();
		}
		//return new ModelAndView("plan/map.tiles", "plannerSchedule", ps);
		return null;
	}
}