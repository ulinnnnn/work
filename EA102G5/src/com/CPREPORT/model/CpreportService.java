package com.CPREPORT.model;

import java.sql.Timestamp;
import java.util.List;

import sun.invoke.empty.Empty;

public class CpreportService {

	private CpreportDAO_interface dao;

	public CpreportService() {
		dao = new CpreportDAO();
	}

	public CpreportVO addCpreport(String cprp_No,String cp_No,String cprp_State,
			String mem_No, String emp_NO,Timestamp cprp_time) {

		CpreportVO CpreportVO = new CpreportVO();

		CpreportVO.setCp_No(cp_No);
		CpreportVO.setCprp_No(cprp_No);
		CpreportVO.setCprp_State(cprp_State);
		CpreportVO.setMem_No(mem_No);
		CpreportVO.setEmp_NO(emp_NO);
		
		CpreportVO.setCprp_time(cprp_time);
		
		dao.insert(CpreportVO);

		return CpreportVO;
	}

	//預留給 Struts 2 用的
	public void addEmp(CpreportVO CpreportVO) {
		dao.insert(CpreportVO);
	}
	
	public CpreportVO updateCpreport(String cprp_No,String cp_No,String cprp_State,
			String mem_No, String emp_NO,Timestamp cprp_time) {

		CpreportVO CpreportVO = new CpreportVO();

		CpreportVO.setCp_No(cp_No);
		CpreportVO.setCprp_No(cprp_No);
		CpreportVO.setCprp_State(cprp_State);
		CpreportVO.setMem_No(mem_No);
		CpreportVO.setEmp_NO(emp_NO);
		
		CpreportVO.setCprp_time(cprp_time);
		
		

		dao.update(CpreportVO);

		return dao.findByPrimaryKey(cp_No);
	}
	
	//預留給 Struts 2 用的
	public void updateCpreport(CpreportVO CpreportVO) {
		dao.update(CpreportVO);
	}

	public void deleteCpreport(String cp_No) {
		dao.delete(cp_No);
	}

	public CpreportVO getOneCpreport(String cp_No) {
		return dao.findByPrimaryKey(cp_No);
	}

	public List<CpreportVO> getAll() {
		return dao.getAll();
	}

}
