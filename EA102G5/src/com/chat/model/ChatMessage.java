package com.chat.model;

public class ChatMessage {
	private String type;
	private String sender;
	private String senderName;
	private String receiver;
	private String receiverName;
	private String friendName;
	private String message;
	private boolean firstChat;
	private String nowChatTime;
	private boolean onLine;
 	
	public boolean isFirstChat() {
		return firstChat;
	}

	public void setFirstChat(boolean firstChat) {
		this.firstChat = firstChat;
	}

	public ChatMessage(String type, String sender, String receiver, String message) {
		this.type = type;
		this.sender = sender;
		this.receiver = receiver;
		this.message = message;
	}
	
	
	
	public boolean getOnLine() {
		return onLine;
	}

	public void setOnLine(boolean onLine) {
		this.onLine = onLine;
	}

	public String getNowChatTime() {
		return nowChatTime;
	}

	public void setNowChatTime(String nowChatTime) {
		this.nowChatTime = nowChatTime;
	}

	public String getFriendName() {
		return friendName;
	}

	public void setFriendName(String friendName) {
		this.friendName = friendName;
	}

	public String getSenderName() {
		return senderName;
	}

	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}

	public String getReceiverName() {
		return receiverName;
	}

	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
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
}
