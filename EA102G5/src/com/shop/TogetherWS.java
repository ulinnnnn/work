package com.shop;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.CloseReason;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/TogetherWS/{mem_no}")
public class TogetherWS {
	
	private static final Set<Session> connectedSessions = Collections.synchronizedSet(new HashSet<>());
	
	@OnOpen
	public void onOpen(@PathParam("mem_no") String mem_no, Session userSession) throws IOException {
		connectedSessions.add(userSession);
		//顯示連線的資訊
		String text = String.format("Session ID = %s, connected; userMem = %s", userSession.getId(), mem_no);
		System.out.println(text);
	}
	
	@OnMessage()
	public void onMessage(Session userSession, String message) {
		for(Session session : connectedSessions) {
			if(session.isOpen()) {
				session.getAsyncRemote().sendText(message);
			}
		}
	}
	
	@OnClose
	public void onClose(Session userSession, CloseReason reason) {
		connectedSessions.remove(userSession);
	}
	
	@OnError()
	public void onError(Session userSession, Throwable e) {
		System.out.print("Error: " +e.toString());
	}
	

}
