package com.koreait.cobox.model.schedule.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.cobox.exception.SdateRegistException;
import com.koreait.cobox.model.domain.Sdate;

@Repository
public class MybatisSdateDAO implements SdateDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List selectByScheduleId(int schedule_id) {
		return sqlSessionTemplate.selectList("Sdate.selectByScheduleId",schedule_id);
	}

	@Override
	public void insert(Sdate sdate) throws SdateRegistException{
		int result=sqlSessionTemplate.insert("Sdate.insert",sdate);
		if(result==0) {
			throw new SdateRegistException("날짜등록실패");
		}
	}

	@Override
	public void update(Sdate sdate) {
		sqlSessionTemplate.update("Sdate.update",sdate);
		
	}

	@Override
	public void delete(Sdate sdate) {
		sqlSessionTemplate.delete("Sdate.delete",sdate);
	}
	

}
