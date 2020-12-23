package com.cpmessage.model;

import java.util.List;
import java.util.Set;


public interface CpmessageDAO_interface {
	     public void insert(CpmessageVO CpmessageVO);
        public void update(CpmessageVO CpmessageVO);
        public void delete(String Cpme_No);
	    public List<CpmessageVO> getAll();
	      //查詢商品的員工(一對多)(回傳 Set)
	    public CpmessageVO findByPrimaryKey(String Cp_No);
		
	    
	      

}
