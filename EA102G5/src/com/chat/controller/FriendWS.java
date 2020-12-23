package com.chat.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.CloseReason;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import com.chat.jedis.JedisHandleMessage;
import com.chat.model.ChatMessage;
import com.chat.model.State;
import com.google.gson.Gson;
import com.mem.model.*;



@ServerEndpoint("/FriendWS/{userName}")
public class FriendWS {
	private static MemService memSvc=new MemService();
	private static Map<String, Session> sessionsMap = new ConcurrentHashMap<>();
	private static Map<String, String> nameMap = new ConcurrentHashMap<>();
	Gson gson = new Gson();

	@OnOpen
	public void onOpen(@PathParam("userName") String userName, Session userSession) throws IOException {
		MemVO memVO=memSvc.memSelect(userName);
		String trueUserName=memVO.getMem_name();
		/* 帳號轉換成姓名 */
		nameMap.put(userName, trueUserName);
		/* save the new user in the map */
		sessionsMap.put(userName, userSession);
		/* Sends all the connected users to the new user */
		Collection trueNames=nameMap.values();
		Set<String> userNames = sessionsMap.keySet();
		State stateMessage = new State("open", userName,trueUserName,userNames,trueNames);
		State onlineMessage = new State("online", userName);
		
		
		Map<String, String> allHistoryData = JedisHandleMessage.getMessage(userName);
		Set<String> allHisMsgsKeys=allHistoryData.keySet();
		
		stateMessage.setAllHisMsgs(allHistoryData);
		stateMessage.setAllHisMsgsKeys(allHisMsgsKeys);
		String stateMessageJson = gson.toJson(stateMessage);
		String onlineMessageJson = gson.toJson(onlineMessage);
		
				synchronized (userSession) {
					if (userSession.isOpen()) {
						userSession.getBasicRemote().sendText(stateMessageJson);
					}
				}

				for (Object onLine :userNames) {
					for(Object fr : allHisMsgsKeys) {
						String onLine2=(String)onLine;
						String fr2=(String)fr;
						if(!fr2.equals(userName)&&!onLine2.equals(userName)&&fr2.equals(onLine2)) {
							System.out.println("fr2="+fr2);
							System.out.println("onLine2="+onLine2);
							Session frSession=sessionsMap.get(fr2);
							State onlineMessageToF = new State("online", onLine2);
							String onlineMessageJson2 = gson.toJson(onlineMessageToF);
							frSession.getAsyncRemote().sendText(onlineMessageJson);
							userSession.getAsyncRemote().sendText(onlineMessageJson2);
						}
					}
				}
		String text = String.format("Session ID = %s, connected; userName = %s%nusers: %s", userSession.getId(),
				userName, userNames,allHistoryData,allHisMsgsKeys);
		System.out.println(text);
	}

	@OnMessage
	public void onMessage(Session userSession, String message) {
		ChatMessage chatMessage = gson.fromJson(message, ChatMessage.class);
		String sender = chatMessage.getSender();
		String receiver = chatMessage.getReceiver();
		List<String> checkFirstChat= JedisHandleMessage.getHistoryMsg(sender, receiver);

		System.out.println("checkFirstChat.isEmpty()="+checkFirstChat.isEmpty());
		if(checkFirstChat.isEmpty()) {
			chatMessage.setFirstChat(true);
		}else {
			chatMessage.setFirstChat(false);
		}
		MemVO senderVO=memSvc.memSelect(sender);
		MemVO receiverVO=memSvc.memSelect(receiver);
		String senderName=senderVO.getMem_name();
		String receiverName=receiverVO.getMem_name();
		chatMessage.setSenderName(senderName);
		chatMessage.setReceiverName(receiverName);
		
		if ("history".equals(chatMessage.getType())) {
			List<String> historyData = JedisHandleMessage.getHistoryMsg(sender, receiver);
			String historyMsg = gson.toJson(historyData);
			String friendName=receiverName;
			ChatMessage cmHistory = new ChatMessage("history", sender, receiver, historyMsg);
			cmHistory.setFriendName(friendName);
			if (userSession != null && userSession.isOpen()) {
				
				Session f=sessionsMap.get(receiver);
				if(f==null) {
					cmHistory.setOnLine(false);
				}else {
					cmHistory.setOnLine(true);
				}
				userSession.getAsyncRemote().sendText(gson.toJson(cmHistory));
				System.out.println("history = " + gson.toJson(cmHistory));
				return;
			}
		}
		
		
		Session receiverSession = sessionsMap.get(receiver);
		if (receiverSession != null && receiverSession.isOpen()) {
			Session f=sessionsMap.get(receiver);
			if(f==null) {
				chatMessage.setOnLine(false);
			}else {
				chatMessage.setOnLine(true);
			}
			message=gson.toJson(chatMessage);
			receiverSession.getAsyncRemote().sendText(message);
			userSession.getAsyncRemote().sendText(message);
			JedisHandleMessage.saveChatMessage(sender, receiver, message);
			JedisHandleMessage.saveMessage(sender, receiver,chatMessage.getMessage(),chatMessage.getNowChatTime());
		}else {
			Session f=sessionsMap.get(receiver);
			if(f==null) {
				chatMessage.setOnLine(false);
			}else {
				chatMessage.setOnLine(true);
			}
			message=gson.toJson(chatMessage);
			userSession.getAsyncRemote().sendText(message);
			JedisHandleMessage.saveChatMessage(sender, receiver, message);
			JedisHandleMessage.saveMessage(sender, receiver,chatMessage.getMessage(),chatMessage.getNowChatTime());
		}
		System.out.println("Message received: 123" + message);
	}

	@OnError
	public void onError(Session userSession, Throwable e) {
		System.out.println("Error: " + e.toString());
	}

	@OnClose
	public void onClose(@PathParam("userName") String userName1,Session userSession, CloseReason reason) {
		String userNameClose = null;
		
		Collection<String> trueNames=nameMap.values();
		Set<String> userNames = sessionsMap.keySet();
		State minimumMessage = new State("minimum", userName1);
		String minimumMessageJson = gson.toJson(minimumMessage);
		Map<String, String> allHistoryData = JedisHandleMessage.getMessage(userName1);
		Set<String> allHisMsgsKeys=allHistoryData.keySet();
		for (Object onLine :userNames) {
			for(Object fr : allHisMsgsKeys) {
				String onLine2=(String)onLine;
				String fr2=(String)fr;
				if(!fr2.equals(userName1)&&!onLine2.equals(userName1)&&fr2.equals(onLine2)) {
					System.out.println("fr2="+fr2);
					System.out.println("onLine2="+onLine2);
					Session frSession=sessionsMap.get(fr2);
					frSession.getAsyncRemote().sendText(minimumMessageJson);
				}
			}
		}
		
		for (String userName : userNames) {
			if (sessionsMap.get(userName).equals(userSession)) {
				userNameClose = userName;
				sessionsMap.remove(userName);
				nameMap.remove(userName);
				break;
			}
		}
		
		if (userNameClose != null) {
			MemVO memVO=memSvc.memSelect(userNameClose);
			String trueUserName=memVO.getMem_name();
			State stateMessage = new State("close", userNameClose,trueUserName ,userNames,trueNames);
			String stateMessageJson = gson.toJson(stateMessage);
			Collection<Session> sessions = sessionsMap.values();
			for (Session session : sessions) {
				session.getAsyncRemote().sendText(stateMessageJson);
			}
		}

		String text = String.format("session ID = %s, disconnected; close code = %d%nusers: %s", userSession.getId(),
				reason.getCloseCode().getCode(), userNames);
		System.out.println(text);
	}
}
