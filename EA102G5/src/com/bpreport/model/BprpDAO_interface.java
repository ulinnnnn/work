package com.bpreport.model;

import java.util.List;
import com.bpmessage.model.BpmeVO;

public interface BprpDAO_interface {
	
    public void insert_rp(BprpVO bprpVO);
    public void update_rp(BprpVO bprpVO);
    public List<BprpVO> getAll();
    public List<BprpVO> getmemrp(String mem_no);
	
}
