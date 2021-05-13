package com.example.second.exception;

public class ValidateException extends RuntimeException {
    private String code;
    private String message;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public ValidateException(String code, String msg) {
        super(msg);
        this.code = code;
        this.message = msg;
    }
}
