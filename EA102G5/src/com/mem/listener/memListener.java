package com.mem.listener;

import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class memListener
 *
 */
@WebListener
public class memListener implements ServletContextListener {

    
    public void contextDestroyed(ServletContextEvent sce)  { 
    	ServletContext ctxt=sce.getServletContext();
    	ctxt.removeAttribute("memMap");
    	ctxt.removeAttribute("depoMap");
    }

    public void contextInitialized(ServletContextEvent sce)  { 
    	ServletContext ctxt=sce.getServletContext();
    	Map<String,String> memMap=new HashMap<String,String>();
    	memMap.put("M0", "未驗證");
    	memMap.put("M1", "已驗證");
    	memMap.put("FALSE", "封鎖中");
    	memMap.put("TRUE", "正常");
    	Map<String,String> depoMap=new HashMap<String,String>();
    	depoMap.put("TYPE0","初始值");
    	depoMap.put("TYPE1","儲值");
    	depoMap.put("TYPE2","提領");
    	depoMap.put("TYPE3","賣出商品");
    	depoMap.put("TYPE4","買入商品");
    	depoMap.put("0","可使用");
    	depoMap.put("1","提領審核中");
    	depoMap.put("2","審核通過，將於三天內匯入您的戶頭。");
    	
    	ctxt.setAttribute("memMap",memMap);
    	ctxt.setAttribute("depoMap",depoMap);
    }
	
}
