package com.koreait.cobox.model.domain;

import java.util.List;

import lombok.Data;

@Data
public class Reservation {
	private int reservation_id;
	private int res_summary_id;
	private int schedule_id;
	private int room_id;
	private int roomquantity;
}
