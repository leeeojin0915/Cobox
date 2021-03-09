package com.koreait.cobox.model.room.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.cobox.model.domain.Room;
import com.koreait.cobox.model.room.repository.RoomDAO;

@Service
public class RoomServiceImpl implements RoomService{
	@Autowired
	private RoomDAO roomDAO;

	@Override
	public List selectAll() {
		return roomDAO.selectAll();
	}

	@Override
	public Room select(int room_id) {
		// TODO Auto-generated method stub
		return null;
	}

}
