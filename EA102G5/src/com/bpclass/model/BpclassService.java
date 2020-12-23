package com.bpclass.model;

import java.util.List;



public class BpclassService {
	private BpclassDAO_interface dao ;
	
	public BpclassService() {
		dao = new BpclassDAO();
	}
	
	
	public BpclassVO addbpclass(String bpcl_name){
		
		BpclassVO bpclassVO = new BpclassVO();
		

		bpclassVO.setBpcl_name(bpcl_name);
		
		dao.insert(bpclassVO);
		
		return bpclassVO;
		
	}

	public BpclassVO updatebpclass(String bpcl_no, String bpcl_name) {

		BpclassVO bpclassVO = new BpclassVO();

		bpclassVO.setBpcl_no(bpcl_no);
		bpclassVO.setBpcl_name(bpcl_name);

		dao.update(bpclassVO);
		
		return bpclassVO;
		
	}
	
	public void delete(String bpcl_no) {
		dao.delete(bpcl_no);
	}
	
	public List<BpclassVO> getAll(){
		return dao.getAll();
	}
	
	public BpclassVO getonebpclass(String bpcl_no) {
		return dao.findByPrimaryKey(bpcl_no);
	}
	
}
