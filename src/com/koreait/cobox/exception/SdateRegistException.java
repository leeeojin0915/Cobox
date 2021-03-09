package com.koreait.cobox.exception;

public class SdateRegistException extends RuntimeException{

	public SdateRegistException(String msg) {
		super(msg);
	}
	public SdateRegistException(String msg, Throwable e) {
		super(msg, e);
	}
}
