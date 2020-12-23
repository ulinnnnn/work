package com.cpclass.model;

import java.sql.Timestamp;
import java.util.List;

import com.cproduct.model.CproductDAO;
import com.cproduct.model.CproductDAO_interface;
import com.cproduct.model.CproductVO;

public class CpclassService {
	private CpclassDAO_interface dao;

	public CpclassService() {
		dao = new CpclassDAO();
	}

	public CpclassVO addCpclass(String cpClass_No,String cpClass) {

		CpclassVO CpclassVO = new CpclassVO();

		CpclassVO.setCpClass(cpClass);
		CpclassVO.setCpClass_No(cpClass_No);
		dao.insert(CpclassVO);

		return CpclassVO;
	}

	//預留給 Struts 2 用的
	public void addCpclass(CpclassVO CpclassVO) {
		dao.insert(CpclassVO);
	}
	
	public CpclassVO updateCpclass(String cpClass_No,String cpClass) {

		CpclassVO CpclassVO = new CpclassVO();

		CpclassVO.setCpClass(cpClass);
		CpclassVO.setCpClass_No(cpClass_No);
		dao.update(CpclassVO);

		return dao.findByPrimaryKey(cpClass_No);
	}
	
	//預留給 Struts 2 用的
	public void updateCproduct(CpclassVO CpclassVO) {
		dao.update(CpclassVO);
	}

	public void deleteCproduct(String Cpclass_No) {
		dao.delete(Cpclass_No);
	}

	public CpclassVO getOneCproduct(String Cpclass_No) {
		return dao.findByPrimaryKey(Cpclass_No);
	}

	public List<CpclassVO> getAll() {
		return dao.getAll();
	}


}
