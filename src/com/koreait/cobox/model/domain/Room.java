package com.koreait.cobox.model.domain;

import lombok.Data;

@Data
public class Room {
	private int room_id;
	private int box_id;
	private String room_name;
	private int price;
	private int room_max;
	private String hold;
}
