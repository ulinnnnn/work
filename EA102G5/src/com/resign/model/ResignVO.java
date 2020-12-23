package com.resign.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class ResignVO implements Serializable{
	private String empNo;
	private byte[] signPicByte;
	private Timestamp resignTime;
	
	public ResignVO() {
		
	}
	
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public byte[] getSignPicByte() {
		return signPicByte;
	}

	public void setSignPicByte(byte[] signPicByte) {
		this.signPicByte = signPicByte;
	}

	public Timestamp getResignTime() {
		return resignTime;
	}
	public void setResignTime(Timestamp resignTime) {
		this.resignTime = resignTime;
	}
	
}
