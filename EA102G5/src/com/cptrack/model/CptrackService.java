package com.cptrack.model;

import java.sql.Timestamp;
import java.util.List;

import com.cproduct.model.CproductDAO;
import com.cproduct.model.CproductDAO_interface;
import com.cproduct.model.CproductVO;

public class CptrackService {
	private  CptrackDAO_interface dao;

	public CptrackService() {
		dao = new  CptrackDAO();
	}

	public CptrackVO addCptrack(String Cptrack_No,String Cptrack) {

		 CptrackVO  CptrackVO = new  CptrackVO();
		 CptrackVO.setCp_No(Cptrack);
			CptrackVO.setMEM_No(Cptrack_No);
		dao.insert(CptrackVO);

		return CptrackVO;
	}

	//預留給 Struts 2 用的
	public void addCptrack(CptrackVO CptrackVO) {
		dao.insert(CptrackVO);
	}
	
	public List<CptrackVO> updateCptrack(String Cptrack_No,String Cptrack) {

		CptrackVO CptrackVO = new CptrackVO();

		CptrackVO.setCp_No(Cptrack);
		CptrackVO.setMEM_No(Cptrack_No);
		dao.update(CptrackVO);

		return dao.findByPrimaryKey(Cptrack_No);
	}
	
	//預留給 Struts 2 用的
	public void updateCproduct(CptrackVO CptrackVO) {
		dao.update(CptrackVO);
	}

	public void deleteCproduct(String Cp_No,String Mem_No) {
		dao.delete(Cp_No,Mem_No);
	}

	public List<CptrackVO> getOneCproduct(String Cptrack_No) {
		System.out.println("正常2");
		return dao.findByPrimaryKey(Cptrack_No);
	}

	public List<CptrackVO> getAll() {
		return dao.getAll();
	}

	public CptrackVO getone(String Cp_No,String mem_No) {

		return dao.getone(Cp_No,mem_No);

		
	}
}
