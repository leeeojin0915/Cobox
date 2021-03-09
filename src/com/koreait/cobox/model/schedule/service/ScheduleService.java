package com.koreait.cobox.model.schedule.service;

import java.util.List;

import com.koreait.cobox.model.domain.Schedule;
import com.koreait.cobox.model.domain.Sdate;
import com.koreait.cobox.model.domain.Stime;

public interface ScheduleService {
	public List selectById();
	public List selectAll();
	public Schedule select(int schedule_id);
	public void regist(Schedule schedule,Sdate sdate);
	public void update(Schedule schedule,Sdate sdate);
	public void delete(Schedule schedule,Sdate sdate);
	
}
