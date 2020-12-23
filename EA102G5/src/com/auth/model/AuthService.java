package com.auth.model;

import java.util.List;

public class AuthService {
	
	private AuthDAO_I dao;
	
	public AuthService() {
		dao = new AuthDAO();
	}
	
	public AuthVO addAuth(String empNo , String funcNo) {
		
		AuthVO authVO = new AuthVO();		
		authVO.setEmpNo(empNo);
		authVO.setFuncNo(funcNo);
		dao.insert(authVO);
		
		return authVO;
	}
	
	public AuthVO updateAuth(String empNo, String empName, String funcNo,String funcName) {
		AuthVO authVO = new AuthVO();
		
		authVO.setEmpNo(empNo);
		authVO.setEmpName(empName);
		authVO.setFuncNo(funcNo);
		authVO.setFuncName(funcName);
		dao.update(authVO);
		
		return authVO;
	}
	
	public void deleteEmp(String empNo) {
		dao.deleteEmp(empNo);
	}
	
	public void deleteEmpFunc(String empNo, String funcNo) {
		dao.deleteEmpFunc(empNo, funcNo);
	}
	
	public List<AuthVO> getOneEmp(String empNo){
		return dao.getOneEmp(empNo);
	}
	
	public AuthVO getOneEmpNo(String empNo) {
		return dao.getOneEmpNo(empNo);
	}
	
	public List<String> getOneEmpFuncs(String empNo){
		return dao.getOneEmpFuncs(empNo);
	}
	
	public List<AuthVO> getOneFunc(String funcNo){
		return dao.getOneFunc(funcNo);
	}
	
	public List<AuthVO> getAll(){
		return dao.getAll();
	}

}
