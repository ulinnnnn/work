package com.Bid.websocket.model;

public class ChatMessage {
	private String type;
	private String sender;
	private String mem;
	private String message;
	private String nprice;
	private String session;
	

	public ChatMessage(String type, String sender,String message) {
		this.type = type;
		this.sender = sender;
		this.message = message;
	}
	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}


	public String getMem() {
		return mem;
	}

	public void setMem(String mem) {
		this.mem = mem;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getNprice() {
		return nprice;
	}

	public void setNprice(String nprice) {
		this.nprice = nprice;
	}
	public String getSession() {
		return session;
	}
	public void setSession(String session) {
		this.session = session;
	}
}
