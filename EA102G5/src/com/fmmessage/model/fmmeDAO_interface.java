package com.fmmessage.model;
import java.util.List;


public interface fmmeDAO_interface {
	
	 public void insert_q(fmmeVO fmmeVO);
	    public void update_a(fmmeVO fmmeVO);
	    public void update(fmmeVO fmmeVO);
	    public void delete(String fmcl_no);
	    public List<fmmeVO> findByfm_no(String fm_no);
	    public List<fmmeVO> findByqmem_no(String qmem_no);
	    public List<fmmeVO> getAll();
    
}

