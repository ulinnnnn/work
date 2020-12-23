package com.cptrack.model;
import java.util.List;
import java.util.Set;


	public interface CptrackDAO_interface {
		     public void insert(CptrackVO CptrackVO);
	        public void update(CptrackVO CptrackVO);
	        public void delete(String Cp_NO,String mem_NO);
		    public List<CptrackVO> getAll();
		      //查詢商品的員工(一對多)(回傳 Set)
		    public List<CptrackVO>findByPrimaryKey(String Cp_No);
		    public CptrackVO getone(String Cp_NO,String mem_NO);
		    
		      

	}

