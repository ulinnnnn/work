package com.cpclass.model;
import java.util.List;
import java.util.Set;


	public interface CpclassDAO_interface {
		     public void insert(CpclassVO CpclassVO);
	        public void update(CpclassVO CpclassVO);
	        public void delete(String Cpclass_NO);
		    public List<CpclassVO> getAll();
		      //�d�߰ӫ~�����u(�@��h)(�^�� Set)
		    public CpclassVO findByPrimaryKey(String Cp_No);
			
		    
		      

	}

