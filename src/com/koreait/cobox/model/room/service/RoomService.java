package com.koreait.cobox.model.room.service;

import java.util.List;

import com.koreait.cobox.model.domain.Room;

public interface RoomService {
	public List selectAll();
	public Room select(int room_id);

}
