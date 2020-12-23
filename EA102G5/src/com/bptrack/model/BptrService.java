package com.bptrack.model;

import java.util.List;

public class BptrService {
	private BptrDAO_interface dao;

	public BptrService() {
		dao = new BptrDAO();

	}

	public BptrVO addbptr(String mem_no , String bp_no) {

		BptrVO bptrVO = new BptrVO();

		bptrVO.setMem_no(mem_no);
		bptrVO.setBp_no(bp_no);

		dao.insert(bptrVO);

		return bptrVO;
	}
	
	
	public void delete(String mem_no, String bp_no) {
		dao.delete(mem_no , bp_no);
	
	}
	
	public List<BptrVO> findBymen_no(String mem_no){
		return dao.findBymen_no(mem_no);
		
	}
	
	public BptrVO findonememtr(String mem_no , String bp_no) {
		return dao.findonememtr( mem_no ,  bp_no);
		
	}
	
	
}
