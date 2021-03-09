package com.koreait.cobox.model.domain;

import java.util.List;

import lombok.Data;

@Data
public class Theater {
	private int theater_id;
	private int location_id;
	private String theater_name;
	private Location location;
	
	private List<Box> box;
}
