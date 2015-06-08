package com.wheremasil.plan.service;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.net.URL;
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
import org.springframework.stereotype.Service;

import com.wheremasil.plan.dao.PlannerScheduleDAOImpl;
import com.wheremasil.plan.vo.Area;
import com.wheremasil.plan.vo.AreaCost;
import com.wheremasil.plan.vo.PlannerSchedule;
import com.wheremasil.plan.vo.Schedule;

@Service("service")
public class PlannerScheduleServiceImpl implements PlannerScheduleService{
	
	@Autowired
	PlannerScheduleDAOImpl dao;

	@Override
	public List<Area> getAreasByRange(Area area) {
		return dao.selectAreasByRange(area);
	}

	@Override
	public int registArea(Area area) {
		return dao.insertArea(area);
	}

	@Override
	public String getAreaIdByName(String name) {
		return dao.selectAreaIdByName(name);
	}

	@Override
	public String registAreaTran(Area area, String name, String imageUrl, String workspaceImageUrl, HttpServletRequest request) {
		String id = null;
		
		// area 등록
		registArea(area);

		// area id 가져오기
		id = getAreaIdByName(name);
		
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
				String wsLocalPath = workspaceImageUrl + "/" + id;
				new File(wsLocalPath).mkdirs();
				imgFileCopy(wsLocalPath, localPath + "/main.png", "main", "png");
			} catch (Exception e) {
				e.printStackTrace();
				return null;
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

	@Override
	public int registPlanSchedule(PlannerSchedule ps) {
		return dao.insertPlanSchedule(ps);
	}

	@Override
	public String getPlanId(String memberId) {
		return dao.selectPlanId(memberId);
	}

	@Override
	public int registSchedule(Schedule schedule) {
		return dao.insertSchedule(schedule);
	}

	@Override
	public int setScheduleByMemo(Schedule schedule) {
		return dao.updateScheduleByMemo(schedule);
	}

	@Override
	public int registAreaCost(AreaCost ac) {
		return dao.insertAreaCost(ac);
	}

	@Override
	public PlannerSchedule registPlanScheduleTran(Map<String, Object> params, HttpServletRequest request) throws Exception {
		PlannerSchedule plan = new PlannerSchedule();
		Schedule schedule = null;
		AreaCost areaCost = null;
		String scheduleDate = null;
		String schedulePlanId = null;
		Calendar c = null;

		// plan db 등록
		plan.setTitle((String) params.get("title"));
		plan.setTheme((String) params.get("theme"));
		plan.setStartDate((String) params.get("startDate"));
		plan.setEndDate((String) params.get("endDate"));
		plan.setGroupNum(Integer.parseInt((String) params.get("groupNum")));
		plan.setMemberId((String) request.getSession().getAttribute("login_info"));

		// 플랜 등록
		registPlanSchedule(plan);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyymmdd");
		Date date = sdf.parse(plan.getStartDate());
		c = new GregorianCalendar();

		//DB에서 해당 플랜 ID조회
		schedulePlanId = getPlanId(plan.getMemberId());
		
		// split 형식에 맞지않는 prof 삭제
		params.remove("title");
		params.remove("theme");
		params.remove("startDate");
		params.remove("endDate");
		params.remove("groupNum");
		
		int curScheduleIdx = -1; //현재 Schedule idx 
		int curCostIdx = -1; // 현재 cost idx
		
		for(Entry<String, Object> entry: params.entrySet()) {
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
				registSchedule(schedule);
			}

			if (curCostIdx != costIdx && costIdx != 0) {// 새로운 일정이 추가.
				if (curCostIdx != -1) { // 각 DAY별 처음 제외.
					// area_cost db 등록
					areaCost.setAcSeq(curCostIdx);
					areaCost.setsDate(scheduleDate);
					areaCost.setPlanId(schedulePlanId);
					registAreaCost(areaCost);
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
				setScheduleByMemo(schedule);
				
				// area_cost db 등록
				areaCost.setAcSeq(curCostIdx);
				areaCost.setsDate(scheduleDate);
				areaCost.setPlanId(schedulePlanId);
				registAreaCost(areaCost);

				System.out.println(areaCost);
				System.out.println(schedule);
			}
		}// end of for
		
		return plan;
	}

}
