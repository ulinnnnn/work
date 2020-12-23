package com.other;

/**
 * @System: Online CV System
 * @Version:1.0
 * Copyright @ 2011 by GuangDongOceanUniversity
 * Class:
 * Sumarry:�q��ƮwŪ���G�i���줸�լy(byte[])�쭶�����ͦ��Ϥ�
 * Create: 2011.12.31
 * Update:
 */

import java.io.IOException;
import java.io.OutputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.cproduct.model.CproductDAO;
import com.mysql.jdbc.Blob;
import com.mysql.jdbc.Statement;

import oracle.jdbc.OracleConnection;

public class MakeImage{
	

	    /* ��k:  MakeImage
	    * �y�z:  �q��ƮwŪ���G�i���줸�լy(byte[])�쭶�����ͦ��Ϥ�
	    * ��J:  int userid �ϥΪ�ID , OutputStream os �q��ƮwŪ�����Ϥ��G�i���줸�լy
	    * ��^: 
	    * ���`�B�z:
	    */
	   public MakeImage(String cp_No,OutputStream os,String cpPicture_No1)throws IOException{
	       CproductDAO dao = new CproductDAO();
	       
	       byte[] array = dao.getPicture(cp_No,cpPicture_No1);
	       if (array.length<1024) {
	    	   array=dao.getPicture("7018","1");
	    	   System.out.println("�����N");
	       }
	       System.out.println("-------------------------"+array.length);
	       os.write(array); 
	        os.flush(); 
	        os.close();     
	   }
	   
	}