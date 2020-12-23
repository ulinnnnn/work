package com.chat.jedis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mem.model.MemService;
import com.mem.model.MemVO;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

public class JedisHandleMessage {
	private static MemService memSvc=new MemService();

	private static JedisPool pool = JedisPoolUtil.getJedisPool();
	
	public static void saveMessage(String sender, String receiver, String message , String nowChatTime) {
		Map<String, String> historyMsgs=new HashMap();
		MemVO senderVO=memSvc.memSelect(sender);
		MemVO receiverVO=memSvc.memSelect(receiver);
		String senderName=senderVO.getMem_name();
		String receiverName=receiverVO.getMem_name();
		String addSenderMsgs=new StringBuilder(senderName).append(":").append(message).append(":").append(nowChatTime).toString();
		String addReceiverMsgs=new StringBuilder(receiverName).append(":").append(message).append(":").append(nowChatTime).toString();
		historyMsgs.put(receiver, addReceiverMsgs);
		historyMsgs.put(sender,addSenderMsgs);
		Jedis jedis = pool.getResource();
		jedis.auth("123456");
		jedis.hmset(sender, historyMsgs);
		jedis.hmset(receiver, historyMsgs);
		
		jedis.close();
	}
	public static Map<String, String> getMessage(String user) {
		Jedis jedis = null;
		jedis = pool.getResource();
		jedis.auth("123456");
		Map<String, String> historyData = jedis.hgetAll(user);
		jedis.close();
		return historyData;
	}
	
	public static List<String> getHistoryMsg(String sender, String receiver) {
		String key = new StringBuilder(sender).append(":").append(receiver).toString();
		Jedis jedis = null;
		jedis = pool.getResource();
		jedis.auth("123456");
		List<String> historyData = jedis.lrange(key, 0, -1);
		jedis.close();
		return historyData;
	}

	public static void saveChatMessage(String sender, String receiver, String message) {
		
		String senderKey = new StringBuilder(sender).append(":").append(receiver).toString();
		String receiverKey = new StringBuilder(receiver).append(":").append(sender).toString();
		Jedis jedis = pool.getResource();
		jedis.auth("123456");
		jedis.rpush(senderKey, message);
		jedis.rpush(receiverKey,  message);


		jedis.close();
	}

}
