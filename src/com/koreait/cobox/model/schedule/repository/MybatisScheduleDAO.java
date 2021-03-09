package com.koreait.cobox.model.schedule.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.cobox.exception.ReservationRegistException;
import com.koreait.cobox.exception.ScheduleRegistException;
import com.koreait.cobox.model.domain.Schedule;

@Repository
public class MybatisScheduleDAO implements ScheduleDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List selectById() {
		return sqlSessionTemplate.selectList("Schedule.selectById");
	}

	@Override
	public void insert(Schedule schedule) throws ScheduleRegistException{
		int result=sqlSessionTemplate.insert("Schedule.insert",schedule);
		if(result==0) {
			throw new ScheduleRegistException("스케줄등록실패");
		}
	}
	
	@Override
	public void update(Schedule schedule) throws ScheduleRegistException{
		int result=sqlSessionTemplate.update("Schedule.update", schedule);
		if(result==0) {
			throw new ScheduleRegistException("스케줄수정실패");
		}
		
	}

	@Override
	public void delete(Schedule schedule) throws ScheduleRegistException{
		int result=sqlSessionTemplate.delete("Schedule.delete",schedule);
		if(result==0) {
			throw new ScheduleRegistException("스케줄삭제실패");
		}
	}

	@Override
	public List selectAll() {
		return sqlSessionTemplate.selectList("Schedule.selectAll");
	}

	@Override
	public Schedule select(int schedule_id) {
		return sqlSessionTemplate.selectOne("Schedule.select",schedule_id);
	}

}