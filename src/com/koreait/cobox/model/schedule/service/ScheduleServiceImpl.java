package com.koreait.cobox.model.schedule.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.cobox.model.domain.Schedule;
import com.koreait.cobox.model.domain.Sdate;
import com.koreait.cobox.model.domain.Stime;
import com.koreait.cobox.model.schedule.repository.ScheduleDAO;
import com.koreait.cobox.model.schedule.repository.SdateDAO;
import com.koreait.cobox.model.schedule.repository.StimeDAO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ScheduleServiceImpl implements ScheduleService{
	@Autowired
	private ScheduleDAO scheduleDAO;
	@Autowired
	private StimeDAO stimeDAO;
	@Autowired
	private SdateDAO sdateDAO;
	
	@Override
	public List selectById() {
		return scheduleDAO.selectById();
	}

	@Override
	public void regist(Schedule schedule,Sdate sdate) {
		scheduleDAO.insert(schedule);
		
		
		//시간 넣기
		for(Stime stime:schedule.getStime()) {
			log.debug("선택한 시간"+stime.getTimepicker());
			stime.setSchedule_id(schedule.getSchedule_id());//fk대입
			stimeDAO.insert(stime);
		}
		
		//날짜 넣기
		sdate.setSchedule_id(schedule.getSchedule_id());
		sdateDAO.insert(sdate);
		
	}

	@Override
	public void update(Schedule schedule,Sdate sdate) {
		//시간 넣기
		for(Stime stime:schedule.getStime()) {
			log.debug("선택한 시간"+stime.getTimepicker());
			stime.setSchedule_id(schedule.getSchedule_id());//fk대입
			stimeDAO.update(stime);
		}
		
		//날짜 넣기
		sdate.setSchedule_id(schedule.getSchedule_id());
		log.debug("수정 날짜"+sdate.getDatepicker());
		sdateDAO.update(sdate);
		
		//scheduleDAO.update(schedule);
	}

	@Override
	public List selectAll() {
		return scheduleDAO.selectAll();
	}

	@Override
	public Schedule select(int schedule_id) {
		return scheduleDAO.select(schedule_id);
	}

	@Override
	public void delete(Schedule schedule, Sdate sdate) {
		for(Stime stime:schedule.getStime()) {
			log.debug("선택한 시간"+stime.getTimepicker());
			stime.setSchedule_id(schedule.getSchedule_id());//fk대입
			stimeDAO.delete(stime);
		}
		
		//날짜 넣기
		sdate.setSchedule_id(schedule.getSchedule_id());
		log.debug("수정 날짜"+sdate.getDatepicker());
		sdateDAO.delete(sdate);
		
		scheduleDAO.delete(schedule);
	}

}
