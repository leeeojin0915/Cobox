package com.koreait.cobox.model.schedule.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.koreait.cobox.model.domain.Schedule;


public interface ScheduleDAO {
	public List selectById();
	public Schedule select(int schedule_id);
	public List selectAll();
	public void insert(Schedule schedule);
	public void update(Schedule schedule);
	public void delete(Schedule schedule);
}
