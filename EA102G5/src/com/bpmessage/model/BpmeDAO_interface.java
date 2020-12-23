package com.bpmessage.model;
import java.util.List;
import com.bpclass.model.BpclassVO;
public interface BpmeDAO_interface {
	
    public void insert_q(BpmeVO bpmeVO);
    public void update_a(BpmeVO bpmeVO);
    public void update(BpmeVO bpmeVO);
    public void delete(String bpcl_no);
    public List<BpmeVO> findBybp_no(String bp_no);
    public List<BpmeVO> findByqmem_no(String qmem_no);
    public List<BpmeVO> getAll();
    
}

