//package com.tool;
//
//import java.text.SimpleDateFormat;
//import java.util.Date;
//import java.util.List;
//import java.util.Set;
//import com.Bid_commodity.model.Bid_commodityVO;
//import com.Bid.websocket.jedis.JedisPoolUtil;
//import com.Bid.websocket.model.ChatMessage;
//import com.Bid_commodity.model.Bid_commodityService;
//import redis.clients.jedis.Jedis;
//import redis.clients.jedis.JedisPool;
//import com.Bid_record.model.Bid_recordService;
//import java.util.Timer;
//import java.util.TimerTask;
//import java.util.stream.Collectors;
//import javax.servlet.ServletContextEvent;
//import javax.servlet.ServletContextListener;
//import javax.servlet.annotation.WebListener;
//import com.google.gson.Gson;
//import com.Bid.websocket.jedis.JedisHandleMessage;
//import com.Bid.websocket.model.ChatMessage;
//import com.Bid.websocket.model.State;
//import org.json.JSONArray;  
//import org.json.JSONObject;  
//
////@WebListener
//public class TimerTest implements ServletContextListener {
//	static Gson gson = new Gson();
//	private static JedisPool pool = JedisPoolUtil.getJedisPool();
//	Timer timer=null;
//	public void contextInitialized(ServletContextEvent sce) {
//		final TimerTask tk;
//		timer = new Timer();
//		tk = new TimerTask() {
//			Bid_recordService recordService = new Bid_recordService();
//			Bid_commodityService bidService = new Bid_commodityService();
//			@Override
//		public void run() {			
//		List<Bid_commodityVO> auction1 = null;
//		List<Bid_commodityVO> auction2 = null;
//		List<Bid_commodityVO> auction3 = null;
//		auction1 = bidService.getAll().stream().filter(e -> e.getB_times().equals(0))
//				.collect(Collectors.toList());
//		auction2 = bidService.getAll().stream().filter(e -> e.getB_times().equals(1))
//				.collect(Collectors.toList());
//		auction3 = bidService.getAll().stream().collect(Collectors.toList());
//	
//		final SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		long starTimeLong = 0;
//		long endTimeLong = 0;
//		Date date = new Date(System.currentTimeMillis());
//		Long currentTimeLong = date.getTime();
//		if(auction1!=null) {
//		for (Bid_commodityVO vo : auction1) {		
//			String startTime = formatter.format(vo.getB_startime());
//			String endTime = formatter.format(vo.getB_endtime());
//			try {
//				Date startTimeD = formatter.parse(startTime);
//				starTimeLong = startTimeD.getTime();
//				Date endTimeD = formatter.parse(endTime);
//				endTimeLong = endTimeD.getTime();
//			} catch (Exception e) {
//			}
//			long expiryTime = currentTimeLong-starTimeLong ;
//			long expiryTime1 = endTimeLong-currentTimeLong ;
//			if (expiryTime >= 0&&expiryTime1>=0) {
//				vo.setB_times(1);
//				bidService.updatetime(vo.getB_times(), vo.getBp_no());
//			}
//		}}
//		for (Bid_commodityVO vo1 : auction2) {
//			String endTime = formatter.format(vo1.getB_endtime());
//			try {
//				Date endTimeD = formatter.parse(endTime);
//				endTimeLong = endTimeD.getTime();
//			} catch (Exception e) {
//			}
//			long expiryTime = endTimeLong - currentTimeLong;
//			if (expiryTime <= 0) {
//				vo1.setB_times(2);
//				bidService.updatetime(vo1.getB_times(), vo1.getBp_no());
//				String highestBid = getBid(vo1.getBp_no());
//				String mem_no = getMemberNo(vo1.getBp_no());
//				Integer memBid = Integer.valueOf(highestBid);
//				if(memBid!=0) {
//				recordService.addBid_record(vo1.getBp_no(),mem_no,memBid);
//				}
//			}
//		}
//		for (Bid_commodityVO vo2 : auction3) {
//			try {
//			Integer nprice=Integer.valueOf(getnewprice(vo2.getBp_no()));
//			if(vo2.getBn_price()<nprice) {
//			bidService.updateprice(nprice, vo2.getBp_no());
//			}}catch(Exception e){}
//		}
//			}
//			
//			};	
//		timer.scheduleAtFixedRate(tk, 0, 5000);
//		
//	}
//	
//	
//    @Override
//	public void contextDestroyed(ServletContextEvent sce) {
//		// TODO Auto-generated method stub
//		timer.cancel();
//	}
//
//
//	public static String getMemberNo(String sender) {
//		
//    	String key = sender;
//    	Jedis jedis = null;
//    	jedis = pool.getResource();
//    	jedis.auth("123456");
//    	String price = jedis.lindex(key,-1);
//    	ChatMessage chatMessage = gson.fromJson(price,ChatMessage.class);
//    	System.out.println(chatMessage.getMem());
//    	jedis.close();
//    	 return chatMessage.getMem();
//	}
//	public static String getnewprice(String sender) {
//    	String key = sender;
//    	Jedis jedis = null;
//    	jedis = pool.getResource();
//    	jedis.auth("123456");
//    	String price = jedis.lindex(key,-1);
//    	ChatMessage chatMessage = gson.fromJson(price,ChatMessage.class);
//    	jedis.close();
//    	String getprice;
//    	getprice=chatMessage.getNprice();
//    	if(getprice==null) {
//    		getprice="0";
//    	}
//    	 return getprice;
//	}
//
//
//public static String getBid(String sender) {
//	String key = sender;
//	Jedis jedis = null;
//	jedis = pool.getResource();
//	jedis.auth("123456");
//	String price = jedis.lindex(key,-1);
//	ChatMessage chatMessage = gson.fromJson(price,ChatMessage.class);
//	jedis.close();
//	String nprice=chatMessage.getNprice();
//	if(chatMessage.getNprice()==null) {
//		price="0";
//	}
//	 return nprice;
//}
//
//}
//
//	
//
