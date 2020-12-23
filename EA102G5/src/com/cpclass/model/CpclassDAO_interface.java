package com.cpclass.model;
import java.util.List;
import java.util.Set;


	public interface CpclassDAO_interface {
		     public void insert(CpclassVO CpclassVO);
	        public void update(CpclassVO CpclassVO);
	        public void delete(String Cpclass_NO);
		    public List<CpclassVO> getAll();
		      //查詢商品的員工(一對多)(回傳 Set)
		    public CpclassVO findByPrimaryKey(String Cp_No);
			
		    
		      

	}

