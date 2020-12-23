package com.cproduct.model;

import java.sql.Timestamp;
import java.util.List;

import sun.invoke.empty.Empty;

public class CproductService {

	private CproductDAO_interface dao;

	public CproductService() {
		dao = new CproductDAO();
	}

	public CproductVO addCproduct(String cp_No,String cpClass_No,String cpState,
			String mem_No, String emp_NO, String cpname,String cptext,Timestamp cpontime,Timestamp cpofftime,byte[] pic,byte[] pic2,byte[] pic3,String cpmeetup) {

		CproductVO CproductVO = new CproductVO();

		CproductVO.setCp_No(cp_No);
		CproductVO.setCpClass_No(cpClass_No);
		CproductVO.setCpState(cpState);
		CproductVO.setMem_No(mem_No);
		CproductVO.setEMP_NO(emp_NO);
		CproductVO.setCpname(cpname);
		CproductVO.setCptext(cptext);
		CproductVO.setCpontime(cpontime);
		CproductVO.setCpofftime(cpofftime);
		CproductVO.setCpPicture_No1(pic);
		CproductVO.setCpPicture_No2(pic2);
		CproductVO.setCpPicture_No3(pic3);
		CproductVO.setCpmeetup(cpmeetup);
		

		return dao.insert(CproductVO);
	}

	//預留給 Struts 2 用的
	public void addEmp(CproductVO CproductVO) {
		dao.insert(CproductVO);
	}
	
	public CproductVO updateCproduct(String cp_No,String cpClass_No,String cpState,
			String mem_No, String emp_NO, String cpname,String cptext,Timestamp cpontime,Timestamp cpofftime,byte[] cpPicture_No1,byte[] cpPicture_No2,byte[] cpPicture_No3,String cpmeetup) {

		CproductVO CproductVO = new CproductVO();

		CproductVO.setCp_No(cp_No);
		CproductVO.setCpClass_No(cpClass_No);
		CproductVO.setCpState(cpState);
		CproductVO.setMem_No(mem_No);
		CproductVO.setEMP_NO(emp_NO);
		CproductVO.setCpname(cpname);
		CproductVO.setCptext(cptext);
		CproductVO.setCpontime(cpontime);
		CproductVO.setCpofftime(cpofftime);
		CproductVO.setCpPicture_No1(cpPicture_No1);
		CproductVO.setCpPicture_No2(cpPicture_No2);
		CproductVO.setCpPicture_No3(cpPicture_No3);
		CproductVO.setCpmeetup(cpmeetup);
		dao.update(CproductVO);

		return dao.findByPrimaryKey(cp_No);
	}
	
	//預留給 Struts 2 用的
	public void updateCproduct(CproductVO CproductVO) {
		dao.update(CproductVO);
	}
	
	public void updatemain(CproductVO CproductVO) {
		dao.updatemain(CproductVO);
	}
	
	public void updatepic(CproductVO CproductVO) {
		dao.updatepic(CproductVO);
	}

	public void deleteCproduct(String cp_No) {
		dao.delete(cp_No);
	}

	public CproductVO getOneCproduct(String cp_No) {
		return dao.findByPrimaryKey(cp_No);
	}

	public List<CproductVO> getAll() {
		return dao.getAll();
	}
	public List<CproductVO> getmemCproduct(String mem_No){
		return dao.getmemAll(mem_No);
	}
	
	public void changestate(String Cpstate,String cp_No){
		dao.changestate(Cpstate,cp_No);
	}

}
