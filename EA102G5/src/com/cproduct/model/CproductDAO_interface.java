package com.cproduct.model;

import java.util.List;
import java.util.Set;


public interface CproductDAO_interface {
	     public CproductVO insert(CproductVO CproductVO);
        public void update(CproductVO CproductVO);
        public void updatemain(CproductVO CproductVO);
        public void updatepic(CproductVO CproductVO);
        public void delete(String Cp_No);
	    public List<CproductVO> getAll();
	      //查詢商品的員工(一對多)(回傳 Set)
	    public CproductVO findByPrimaryKey(String Cp_No);
	    public List<CproductVO> getmemAll(String mem_No);
	    public void changestate(String Cpstate,String Cp_No);
		
	    
	      

}
