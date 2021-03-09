package com.koreait.cobox.model.schedule.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.cobox.exception.StimeRegistException;
import com.koreait.cobox.model.domain.Stime;

@Repository
public class MybatisStimeDAO implements StimeDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List selectBySchduleId(int schedule_id) {
		return sqlSessionTemplate.selectList("Stime.selectByScheduleId", schedule_id);
	}

	@Override
	public void insert(Stime stime) throws StimeRegistException{
		int result=sqlSessionTemplate.insert("Stime.insert",stime);
		if(result==0) {
			throw new StimeRegistException("시간등록실패");
		}
	}

	@Override
	public void update(Stime stime) {
		sqlSessionTemplate.update("Stime.update",stime);
	}

	@Override
	public void delete(Stime stime) {
		sqlSessionTemplate.delete("Stime.delete",stime);
	}

}
