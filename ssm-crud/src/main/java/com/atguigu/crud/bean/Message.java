package com.atguigu.crud.bean;

import java.util.HashMap;
import java.util.Map;

import org.springframework.util.concurrent.SuccessCallback;

public class Message {
	private int code;
	
	private String meg;
	
	private Map<String, Object> info= new HashMap<>();

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMeg() {
		return meg;
	}

	public void setMeg(String meg) {
		this.meg = meg;
	}

	public Map<String, Object> getInfo() {
		return info;
	}

	public void setInfo(Map<String, Object> info) {
		this.info = info;
	}

	public static Message success(int code,String meg,Map<String, Object> info){
		return new Message(code, meg, info);
		
		
	}
	public static Message fail(int code,String meg){
		return new Message(code, meg, null);
		
		
	}
	
	@Override
	public String toString() {
		return "Message [code=" + code + ", meg=" + meg + ", info=" + info + "]";
	}

	public Message(int code, String meg, Map<String, Object> info) {
		super();
		this.code = code;
		this.meg = meg;
		this.info = info;
	}

	public Message() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	
}
