package com.koreait.cobox.model.box.service;

import java.util.List;

import com.koreait.cobox.model.domain.Box;

public interface BoxService {
	public List selectAll(int theater_id);
	public List selectAllById(int theater_id);
}
