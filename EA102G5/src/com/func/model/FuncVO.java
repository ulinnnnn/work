package com.func.model;

import java.io.Serializable;
import java.sql.Date;

public class FuncVO implements Serializable {
	private String funcNo;
	private String funcName;
	private String funcDesc;
	
		
	public String getFuncNo() {
		return funcNo;
	}
	public void setFuncNo(String funcNo) {
		this.funcNo = funcNo;
	}
	public String getFuncName() {
		return funcName;
	}
	public void setFuncName(String funcName) {
		this.funcName = funcName;
	}
	public String getFuncDesc() {
		return funcDesc;
	}
	public void setFuncDesc(String funcDesc) {
		this.funcDesc = funcDesc;
	}
	
}
