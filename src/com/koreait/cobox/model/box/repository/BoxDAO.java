package com.koreait.cobox.model.box.repository;

import java.util.List;

import com.koreait.cobox.model.domain.Box;

public interface BoxDAO {
	public List selectAll(int theater_id);
	public List selectAllById(int theater_id);

}
