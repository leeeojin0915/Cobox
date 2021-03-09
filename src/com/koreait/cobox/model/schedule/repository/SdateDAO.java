package com.koreait.cobox.model.schedule.repository;

import java.util.List;

import com.koreait.cobox.model.domain.Sdate;

public interface SdateDAO {
	public List selectByScheduleId(int schedule_id);
	public void insert(Sdate sdate);
	public void update(Sdate sdate);
	public void delete(Sdate sdate);
}
