package com.CPRECORD.model;

import java.sql.Timestamp;
import java.util.List;

import sun.invoke.empty.Empty;

public class CprecordService {

	private CprecordDAO_interface dao;

	public CprecordService() {
		dao = new CprecordDAO();
	}

	public CprecordVO addCprecord(String cp_No,String cp_No2,
			String mem_No, String mem_NO2,Timestamp cpc_time,String cprstate) {

		CprecordVO CprecordVO = new CprecordVO();

		CprecordVO.setCp_No1(cp_No);
		
		CprecordVO.setCp_No2(cp_No2);
		CprecordVO.setMem_No1(mem_No);
		CprecordVO.setMem_No2(mem_NO2);
		CprecordVO.setCprstate(cprstate);
		CprecordVO.setCpc_time(cpc_time);
		
		dao.insert(CprecordVO);

		return CprecordVO;
	}

	//預留給 Struts 2 用的
	public void addEmp(CprecordVO CprecordVO) {
		dao.insert(CprecordVO);
	}
	
	public List<CprecordVO> updateCprecord(String cpr_No,String cp_No,String cp_No2,
			String mem_No, String mem_NO2,Timestamp cpc_time,String cprstate) {

		CprecordVO CprecordVO = new CprecordVO();

		CprecordVO.setCp_No1(cp_No);
		CprecordVO.setCpr_No(cpr_No);
		CprecordVO.setCp_No2(cp_No2);
		CprecordVO.setMem_No1(mem_No);
		CprecordVO.setMem_No2(mem_NO2);
		CprecordVO.setCprstate(cprstate);
		CprecordVO.setCpc_time(cpc_time);
		
		

		dao.update(CprecordVO);

		return dao.findCprecordByMEM1(mem_No);
	}
	
	//預留給 Struts 2 用的
	public void updateCprecord(CprecordVO CprecordVO) {
		dao.update(CprecordVO);
	}

	public void deleteCprecord(String cp_No) {
		dao.delete(cp_No);
	}

	public List<CprecordVO> findCprecordByMEM1(String mem_No) {		
		return dao.findCprecordByMEM1(mem_No);
	}
	public List<CprecordVO> findCprecordByMEM2(String mem_No2) {		
		return dao.findCprecordByMEM2(mem_No2);
	}
	
	public CprecordVO findCprecordBycpr_No(String cpr_No) {		
		return dao.findCprecordBycpr_no(cpr_No);
	}

	public List<CprecordVO> getAll() {
		return dao.getAll();
	}
	
	public void changestate(String Cpstate,String cpr_No){
		dao.changestate(Cpstate,cpr_No);
	}
	
	public void updateall(String Cpstate,String cp_No){
		dao.updateall(Cpstate,cp_No);
	}

}
