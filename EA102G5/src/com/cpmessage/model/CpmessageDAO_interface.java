package com.cpmessage.model;

import java.util.List;
import java.util.Set;


public interface CpmessageDAO_interface {
	     public void insert(CpmessageVO CpmessageVO);
        public void update(CpmessageVO CpmessageVO);
        public void delete(String Cpme_No);
	    public List<CpmessageVO> getAll();
	      //�d�߰ӫ~�����u(�@��h)(�^�� Set)
	    public CpmessageVO findByPrimaryKey(String Cp_No);
		
	    
	      

}
