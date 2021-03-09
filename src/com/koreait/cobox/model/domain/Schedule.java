package com.koreait.cobox.model.domain;


import java.util.List;

import lombok.Data;

@Data
public class Schedule {
	private int schedule_id;
	//private int box_id;
	private int movie_id;
	
	private Box box;
	private Movie movie;
	
	//join할때
	private List<Stime> stimeList;
	
	//insert할때
	private Stime[] stime;
	private Sdate sdate;
	
}