package com.CPRECORD.model;

import java.util.List;
import java.util.Set;


public interface CprecordDAO_interface {
	     public void insert(CprecordVO CprecordVO);
        public void update(CprecordVO CprecordVO);
        public void delete(String Cp_No);
	    public List<CprecordVO> getAll();
	      //查詢商品的員工(一對多)(回傳 Set)
	    public List<CprecordVO> findCprecordByMEM2(String MEM_No);
	    public List<CprecordVO> findCprecordByMEM1(String MEM_No);
	    public CprecordVO findCprecordBycpr_no(String cpr_no);
	    public void changestate(String Cprstate,String cpr_No);
	    public void updateall(String Cprstate,String cp_No);
	      

}
