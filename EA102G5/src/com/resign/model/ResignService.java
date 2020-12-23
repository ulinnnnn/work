package com.resign.model;

import java.sql.Timestamp;
import java.util.List;

import com.emp.model.EmpVO;

public class ResignService {
	
	private ResignDAO_I dao;
	
	public ResignService() {
		dao = new ResignDAO();
	}

	public ResignVO addResign(String empNo, byte[] signPicByte,Timestamp resignTime) {
		
		ResignVO resignVO = new ResignVO();
		resignVO.setEmpNo(empNo);
		resignVO.setSignPicByte(signPicByte);
		resignVO.setResignTime(resignTime);
		dao.insert(resignVO);
		
		return resignVO;
	}
	
	public byte[] addSignPic(byte[] signPic) {		
		dao.insertPic(signPic);
		return signPic;
	}
	
	public ResignVO showPic(String empNo) {
		return dao.showPic(empNo);
	}
	
	public List<ResignVO> getAll(){
		return dao.getAll();
	}
	
}
