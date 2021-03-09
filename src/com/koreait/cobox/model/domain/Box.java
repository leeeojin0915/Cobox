package com.koreait.cobox.model.domain;

import lombok.Data;

@Data
public class Box {
	private int box_id;
	private int theater_id;
	private String box_name;
	
	private Theater theater; 
}
