package com.bpmessage.model;

import java.util.List;

public class BpmeService {
	private BpmeDAO_interface dao ;
	
	public BpmeService() {
		dao = new BpmeDAO();
		
	}	
	public BpmeVO addbpme(String bp_no,String mem_no,String qmem_no,String qbpme_text){
	
	//Date bp_upt,Date bp_dot,
	BpmeVO  bpmeVO = new BpmeVO();
	
	bpmeVO.setBp_no(bp_no);
	bpmeVO.setMem_no(mem_no);
	bpmeVO.setQmem_no(qmem_no);
	bpmeVO.setQbpme_text(qbpme_text);
	
	dao.insert_q(bpmeVO);

	return bpmeVO;
}	
	public BpmeVO updatebpme(String bpme_text, String bpme_no) {

		BpmeVO bpmeVO = new BpmeVO();

		bpmeVO.setBpme_text(bpme_text);
		bpmeVO.setBpme_no(bpme_no);

		dao.update_a(bpmeVO);
		
		return bpmeVO;
		
	}
	
	public List<BpmeVO> findBybp_no(String bp_no) {
		return dao.findBybp_no(bp_no);
	}
	
	public List<BpmeVO> findByqmem_no(String qmem_no) {
		return dao.findByqmem_no(qmem_no);
	}

	public List<BpmeVO> getAll(){
		return dao.getAll();
	}
	
	

}
