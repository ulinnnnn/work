package com.Bid.websocket.jedis;

import java.util.List;

import org.json.JSONObject;

import com.Bid.websocket.model.ChatMessage;
import com.google.gson.Gson;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

public class JedisHandleMessage {
	static Gson gson = new Gson();
	// 此範例key的設計為(發送者名稱:接收者名稱)，實際應採用(發送者會員編號:接收者會員編號)

	private static JedisPool pool = JedisPoolUtil.getJedisPool();

	public static List<String> getHistoryMsg(String sender) {
		String key = new StringBuilder(sender).toString();
		Jedis jedis = null;
		jedis = pool.getResource();
		jedis.auth("123456");
		List<String> historyData = jedis.lrange(key, 0, -1);
		jedis.close();
		return historyData;
		
	}

	public static void saveChatMessage(String sender,String message) {
		
		String senderKey = new StringBuilder(sender).toString();
		Jedis jedis = pool.getResource();
		jedis.auth("123456");
		try {
		JSONObject jsonbject =new JSONObject(message);
		String price = jedis.lindex(senderKey,-1);		
    	ChatMessage chatMessage = gson.fromJson(price,ChatMessage.class);
    	String getprice=chatMessage.getNprice();
		
    	int nprice=jsonbject.getInt("nprice");
    	String s = String.valueOf(nprice);
    	if(getprice==null) {
		jedis.rpush(senderKey, message);
		}else{
			if(!s.equals(getprice)) {
				jedis.rpush(senderKey, message);
				}			
		}
    	}catch(Exception e) {
			jedis.rpush(senderKey, message);
		}
		jedis.close();
	}

}
