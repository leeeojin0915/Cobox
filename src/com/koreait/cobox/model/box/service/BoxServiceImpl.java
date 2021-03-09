package com.koreait.cobox.model.box.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.cobox.model.box.repository.BoxDAO;
import com.koreait.cobox.model.domain.Box;

@Service
public class BoxServiceImpl implements BoxService{
	@Autowired
	private BoxDAO boxDAO;

	@Override
	public List selectAll(int theater_id) {
		return boxDAO.selectAll(theater_id);
	}

	@Override
	public List selectAllById(int theater_id) {
		return boxDAO.selectAllById(theater_id);
	}


}
