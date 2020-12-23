package com.emp.model;
import java.io.Serializable;
import java.sql.Blob;

public class EmpVO implements Serializable{
	private String empNo;
	private String empName;
	private String empPsd;
	private String empPhone;
	private String empEmail;
	private byte[] empPicByte;
	
	
	public EmpVO(){
		
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getEmpPsd() {
		return empPsd;
	}

	public void setEmpPsd(String empPsd) {
		this.empPsd = empPsd;
	}

	public String getEmpPhone() {
		return empPhone;
	}

	public void setEmpPhone(String empPhone) {
		this.empPhone = empPhone;
	}

	public String getEmpEmail() {
		return empEmail;
	}

	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}
	
	public byte[] getEmpPicByte() {
		return empPicByte;
	}

	public void setEmpPicByte(byte[] empPicByte) {
		this.empPicByte = empPicByte;
	}
	
}
