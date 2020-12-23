package com.auth.model;

import java.io.Serializable;

public class AuthVO implements Serializable{
	private String empNo;
	private String empName;
	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getFuncName() {
		return funcName;
	}

	public void setFuncName(String funcName) {
		this.funcName = funcName;
	}

	private String funcNo;
	private String funcName;

	public String getEmpNo() {
		return empNo;
	}
	
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	
	public String getFuncNo() {
		return funcNo;
	}

	public void setFuncNo(String funcNo) {
		this.funcNo = funcNo;
	}
}
