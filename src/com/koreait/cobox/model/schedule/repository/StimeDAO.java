package com.koreait.cobox.model.schedule.repository;

import java.util.List;

import com.koreait.cobox.model.domain.Stime;

public interface StimeDAO {
	public List selectBySchduleId(int schedule_id);
	public void insert(Stime stime);
	public void update(Stime stime);
	public void delete(Stime stime);
}
