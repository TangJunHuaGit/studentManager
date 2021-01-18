package com.tjh.util;

public class ReturnViewException extends Exception{
	 //异常信息
    public String message;

    public ReturnViewException (String message) {
        super(message);
        this.message = message;
    }

    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
