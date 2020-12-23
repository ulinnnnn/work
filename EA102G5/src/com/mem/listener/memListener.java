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
    	memMap.put("M0", "������");
    	memMap.put("M1", "�w����");
    	memMap.put("FALSE", "���ꤤ");
    	memMap.put("TRUE", "���`");
    	Map<String,String> depoMap=new HashMap<String,String>();
    	depoMap.put("TYPE0","��l��");
    	depoMap.put("TYPE1","�x��");
    	depoMap.put("TYPE2","����");
    	depoMap.put("TYPE3","��X�ӫ~");
    	depoMap.put("TYPE4","�R�J�ӫ~");
    	depoMap.put("0","�i�ϥ�");
    	depoMap.put("1","����f�֤�");
    	depoMap.put("2","�f�ֳq�L�A�N��T�Ѥ��פJ�z�����Y�C");
    	
    	ctxt.setAttribute("memMap",memMap);
    	ctxt.setAttribute("depoMap",depoMap);
    }
	
}
