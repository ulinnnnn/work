package com.bpreport.model;

import java.util.List;

import com.bpmessage.model.BpmeVO;
import com.bpreport.model.BprpDAO;
import com.bpreport.model.BprpDAO_interface;

public class BprpService {
	private BprpDAO_interface dao ;
	
	public BprpService() {
		dao = new BprpDAO();
		
	}	 
	
	public BprpVO addbprp(String bp_no , String mem_no , String bprp_project , String bprp_text){
		
		BprpVO  bprpVO = new BprpVO();
		bprpVO.setBp_no(bp_no);
		bprpVO.setMem_no(mem_no);
		bprpVO.setBprp_project(bprp_project);
		bprpVO.setBprp_text(bprp_text);
		
		dao.insert_rp(bprpVO);
		
		return bprpVO;
	}
	
	public BprpVO updatebprp(String bprp_status,String bprp_no) {
		
		BprpVO  bprpVO = new BprpVO();
		bprpVO.setBprp_status(bprp_status);
		bprpVO.setBprp_no(bprp_no);
		
		dao.update_rp(bprpVO);
		
		return bprpVO;
	}
	
	public List<BprpVO> findBybp_no(String mem_no) {
		return dao.getmemrp(mem_no);
	}

	public List<BprpVO> getAll(){
		return dao.getAll();
	}
	
	
}

