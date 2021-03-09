package com.koreait.cobox.exception;

public class ScheduleRegistException extends RuntimeException{

	public ScheduleRegistException(String msg) {
		super(msg);
	}
	public ScheduleRegistException(String msg, Throwable e) {
		super(msg, e);
	}
}
