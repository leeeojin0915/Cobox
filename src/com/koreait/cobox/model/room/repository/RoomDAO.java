package com.koreait.cobox.model.room.repository;

import java.util.List;

import com.koreait.cobox.model.domain.Room;

public interface RoomDAO {
	public List selectAll();
	public Room select(int room_id);

}
