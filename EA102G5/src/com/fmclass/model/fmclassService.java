package com.fmclass.model;

import java.util.List;

public class fmclassService {
	private fmclassDAO_I daoI;
	
	public fmclassService() {
		daoI = new fmclassDAO();
	}
	
	public fmclassVO addfmclass(String fmcl_na) {
		fmclassVO fmclassVO = new fmclassVO();
		
		fmclassVO.setfmcl_na(fmcl_na);
		daoI.insert(fmclassVO);
		
		return fmclassVO;
	}
	
	
	public fmclassVO updatefmclass(String fmcl_na) {
		fmclassVO fmclassVO = new fmclassVO();
		
		fmclassVO.setfmcl_na(fmcl_na);
		daoI.update(fmclassVO);
		
		return fmclassVO;
	}
	
	
	public void deletefmclass(String fmcl_no) {
		daoI.delete(fmcl_no);
	}
	
	
	public fmclassVO getOnefmclass(String fmcl_no) {
		return daoI.getOne(fmcl_no);
	}
	
	
	public List<fmclassVO> getAll() {
		return daoI.getAll();
	}

}
