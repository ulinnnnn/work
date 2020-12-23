package com.serv.model;

import java.sql.Timestamp;
import java.util.List;

public class ServService {
	
	private ServDAO_I dao;
	
	public ServService() {
		dao = new ServDAO();
	}
	
	public ServVO addServ(String ordNo, String custCont, Timestamp custContTime) {
		
		ServVO servVO = new ServVO();
		
		servVO.setOrdNo(ordNo);
		servVO.setCustCont(custCont);
		servVO.setCustContTime(custContTime);
		dao.insert(servVO);
		
		return servVO;
	}
	
	public ServVO reply(String servNo, String empNo , String resCont, Timestamp resContTime) {
		ServVO servVO = new ServVO();
		
		servVO.setServNo(servNo);
		servVO.setEmpNo(empNo);		
		servVO.setResCont(resCont);
		servVO.setResContTime(resContTime);
		dao.reply(servVO);
		
		return servVO;
	}
	
//	public void delete(String servNo) {
//		dao.delete(servNo);
//	}
	
	public ServVO getOne(String servNo) {
		return dao.getOne(servNo);
	}
	
	public List<ServVO> getAll(){
		return dao.getAll();
	}
}
