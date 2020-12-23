package com.chat.model;

public class ChatPicService {
	private ChatPic_interface dao;
	public ChatPicService(){
		dao=new ChatPicDAO();
	}
	public ChatPicVO ChatPicInsert(ChatPicVO chatPicVO) {
		return dao.insertChatPic(chatPicVO);
	}
	public ChatPicVO selectChatPic(String chat_pic_number) {
		return dao.selectChatPic(chat_pic_number);
	}
}
