package com.other;

/**
 * @System: Online CV System
 * @Version:1.0
 * Copyright @ 2011 by GuangDongOceanUniversity
 * Class:
 * Sumarry:從資料庫讀取二進位制位元組流(byte[])到頁面中生成圖片
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
	

	    /* 方法:  MakeImage
	    * 描述:  從資料庫讀取二進位制位元組流(byte[])到頁面中生成圖片
	    * 輸入:  int userid 使用者ID , OutputStream os 從資料庫讀取的圖片二進位制位元組流
	    * 返回: 
	    * 異常處理:
	    */
	   public MakeImage(String cp_No,OutputStream os,String cpPicture_No1)throws IOException{
	       CproductDAO dao = new CproductDAO();
	       
	       byte[] array = dao.getPicture(cp_No,cpPicture_No1);
	       if (array.length<1024) {
	    	   array=dao.getPicture("7018","1");
	    	   System.out.println("有取代");
	       }
	       System.out.println("-------------------------"+array.length);
	       os.write(array); 
	        os.flush(); 
	        os.close();     
	   }
	   
	}