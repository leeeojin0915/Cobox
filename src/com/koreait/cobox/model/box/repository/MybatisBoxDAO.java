package com.koreait.cobox.model.box.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.cobox.model.domain.Box;

@Repository
public class MybatisBoxDAO implements BoxDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List selectAll(int theater_id) {
		return sqlSessionTemplate.selectList("Box.selectAll",theater_id);
	}

	@Override
	public List selectAllById(int theater_id) {
		return sqlSessionTemplate.selectList("Box.selectAllById",theater_id);
	}
	

}
