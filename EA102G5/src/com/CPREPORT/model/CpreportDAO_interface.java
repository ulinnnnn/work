package com.CPREPORT.model;

import java.util.List;
import java.util.Set;


public interface CpreportDAO_interface {
	     public void insert(CpreportVO CpreportVO);
        public void update(CpreportVO CpreportVO);
        public void delete(String Cp_No);
	    public List<CpreportVO> getAll();
	      //查詢商品的員工(一對多)(回傳 Set)
	    public CpreportVO findByPrimaryKey(String Cp_No);
		
	    
	      

}
