package com.emp.model;

import java.util.List;

public class EmpService {
	private EmpDAO_I dao;
	
	public EmpService() {
		dao = new EmpDAO();
	}
	
	public EmpVO addEmp(String empName, String empPsd, String empPhone, String empEmail, byte[] empPicByte) {
		EmpVO empVO = new EmpVO();
		
		empVO.setEmpName(empName);
		empVO.setEmpPsd(empPsd);
		empVO.setEmpPhone(empPhone);
		empVO.setEmpEmail(empEmail);
		empVO.setEmpPicByte(empPicByte);
		dao.insert(empVO);
		
		return empVO;		
	}
	
	public EmpVO updateEmp(String empNo ,String empName, String empPsd, String empPhone, String empEmail, byte[] empPicByte) {
		EmpVO empVO = new EmpVO();
		
		empVO.setEmpNo(empNo);
		empVO.setEmpName(empName);
		empVO.setEmpPsd(empPsd);
		empVO.setEmpPhone(empPhone);
		empVO.setEmpEmail(empEmail);
		empVO.setEmpPicByte(empPicByte);
		dao.update(empVO);
		
		return empVO;
	}
	
	public void deleteEmp(String empNo) {
		dao.delete(empNo);
	}
	
	public EmpVO getOneEmp(String empNo) {
		return dao.getOne(empNo);
	}
	
	public List<EmpVO> getAll() {
		return dao.getAll();
	}
	
	public EmpVO showPic(String empNo) {
		return dao.showPic(empNo);
	}
	
	public EmpVO updateEmpPsd(String empNo ,String empPsd) {
		EmpVO empVO = new EmpVO();
		empVO.setEmpNo(empNo);	
		empVO.setEmpPsd(empPsd);
		
		dao.updateEmpPsd(empVO);
		
		return empVO;
	}

}
