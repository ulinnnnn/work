package com.auth.model;

import java.util.List;

public interface AuthDAO_I {
	public void insert(AuthVO authVO);
	public void update(AuthVO authVO);
	public void deleteEmp(String empNo);
	public void deleteEmpFunc(String empNo, String funcNo);
	public List<AuthVO> getOneEmp(String empNo);
	public AuthVO getOneEmpNo(String empNo);
	public List<String> getOneEmpFuncs(String empNo);
	public List<AuthVO> getOneFunc(String funcNo);
	public List<AuthVO> getAll();

}
