package com.func.model;

import java.util.List;

public class FuncService {
	private FuncDAO_I dao;
	
	public FuncService() {
		dao = new FuncDAO();
	}
	
	public FuncVO addFunc(String funcName, String funcDesc) {
		FuncVO funcVO = new FuncVO();
		
		funcVO.setFuncName(funcName);
		funcVO.setFuncDesc(funcDesc);
		dao.insert(funcVO);
		
		return funcVO;
	}
	
	
	public FuncVO updateFunc(String funcNo, String funcName, String funcDesc) {
		FuncVO funcVO = new FuncVO();
		
		funcVO.setFuncNo(funcNo);
		funcVO.setFuncName(funcName);
		funcVO.setFuncDesc(funcDesc);
		dao.update(funcVO);
		
		return funcVO;
	}
	
	
	public void deleteFunc(String funcNo) {
		dao.delete(funcNo);
	}
	
	
	public FuncVO getOneFunc(String funcNo) {
		return dao.getOne(funcNo);
	}
	
	
	public List<FuncVO> getAll() {
		return dao.getAll();
	}

}
