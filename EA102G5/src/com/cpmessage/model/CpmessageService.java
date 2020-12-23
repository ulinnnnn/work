package com.cpmessage.model;

import java.sql.Timestamp;
import java.util.List;

import sun.invoke.empty.Empty;

public class CpmessageService {

	private CpmessageDAO_interface dao;

	public CpmessageService() {
		dao = new CpmessageDAO();
	}

	public CpmessageVO addCpmessage(String cpme_No,String cp_No,String cpreme_No,
			String mem_No, String cpme) {

		CpmessageVO CpmessageVO = new CpmessageVO();

		CpmessageVO.setCp_No(cp_No);
		CpmessageVO.setCpme_No(cpme_No);
		CpmessageVO.setCpreme_No(cpreme_No);
		CpmessageVO.setMem_No(mem_No);
		CpmessageVO.setCpme(cpme);
		
		
		dao.insert(CpmessageVO);

		return CpmessageVO;
	}

	//預留給 Struts 2 用的
	public void addEmp(CpmessageVO CpmessageVO) {
		dao.insert(CpmessageVO);
	}
	
	public CpmessageVO updateCpmessage(String cpme_No,String cp_No,String cpreme_No,
			String mem_No, String cpme) {

		CpmessageVO CpmessageVO = new CpmessageVO();

		CpmessageVO.setCp_No(cp_No);
		CpmessageVO.setCpme_No(cpme_No);
		CpmessageVO.setCpreme_No(cpreme_No);
		CpmessageVO.setMem_No(mem_No);
		CpmessageVO.setCpme(cpme);
		
		
		
		

		dao.update(CpmessageVO);

		return dao.findByPrimaryKey(cp_No);
	}
	
	//預留給 Struts 2 用的
	public void updateCpmessage(CpmessageVO CpmessageVO) {
		dao.update(CpmessageVO);
	}

	public void deleteCpmessage(String cp_No) {
		dao.delete(cp_No);
	}

	public CpmessageVO getOneCpmessage(String cp_No) {
		return dao.findByPrimaryKey(cp_No);
	}

	public List<CpmessageVO> getAll() {
		return dao.getAll();
	}

}
