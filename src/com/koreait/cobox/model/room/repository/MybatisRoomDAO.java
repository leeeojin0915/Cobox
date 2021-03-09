package com.koreait.cobox.model.room.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.cobox.model.domain.Room;

@Repository
public class MybatisRoomDAO implements RoomDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	@Override
	public List selectAll() {
		return sqlSessionTemplate.selectList("Room.selectAll");
	}

	@Override
	public Room select(int room_id) {
		return sqlSessionTemplate.selectOne("Room.select",room_id);
	}

}
