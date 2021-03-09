package com.koreait.cobox.exception;

public class StimeRegistException extends RuntimeException{

	public StimeRegistException(String msg) {
		super(msg);
	}
	public StimeRegistException(String msg, Throwable e) {
		super(msg, e);
	}
}
