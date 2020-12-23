package com.cproduct.model;

import java.sql.Timestamp;

public class CproductVO  implements java.io.Serializable{
	private String cp_No;            
	private String cpClass_No;            
	private String cpState;             
	private String mem_No;                
	private String emp_NO;                         
	private String cpname;
	private String cptext;                    
	private Timestamp cpontime;              
	private Timestamp cpofftime;
	private byte[] cpPicture_No1;
	private byte[] cpPicture_No2;
	private byte[] cpPicture_No3;
	private String cpmeetup;
	
	public byte[] getCpPicture_No1() {
		return cpPicture_No1;
	}
	public String getCpmeetup() {
		return cpmeetup;
	}
	public void setCpmeetup(String cpmeetup) {
		this.cpmeetup = cpmeetup;
	}
	public void setCpPicture_No1(byte[] pic) {
		this.cpPicture_No1 = pic;
	}
	public byte[] getCpPicture_No2() {
		return cpPicture_No2;
	}
	public void setCpPicture_No2(byte[] pic2) {
		this.cpPicture_No2 = pic2;
	}
	public byte[] getCpPicture_No3() {
		return cpPicture_No3;
	}
	public void setCpPicture_No3(byte[] pic3) {
		this.cpPicture_No3 = pic3;
	}
	public String getCp_No() {
		return cp_No;
	}
	public void setCp_No(String cp_No) {
		this.cp_No = cp_No;
	}
	public String getCpClass_No() {
		return cpClass_No;
	}
	public void setCpClass_No(String cpClass_No) {
		this.cpClass_No = cpClass_No;
	}
	public String getCpState() {
		return cpState;
	}
	public void setCpState(String cpState_No) {
		this.cpState = cpState_No;
	}
	public String getMem_No() {
		return mem_No;
	}
	public void setMem_No(String mem_No) {
		this.mem_No = mem_No;
	}
	public String getemp_NO() {
		return emp_NO;
	}
	public void setEMP_NO(String emp_NO) {
		this.emp_NO = emp_NO;
	}
	
	public String getCpname() {
		return cpname;
	}
	public void setCpname(String cpname) {
		this.cpname = cpname;
	}
	public String getCptext() {
		return cptext;
	}
	public void setCptext(String cptext) {
		this.cptext = cptext;
	}
	public Timestamp getCpontime() {
		
		return cpontime;
	}
	public void setCpontime(Timestamp cpontime) {
		this.cpontime = cpontime;
	}
	public Timestamp getCpofftime() {
		return cpofftime;
	}
	public void setCpofftime(Timestamp cpofftime) {
		this.cpofftime = cpofftime;
	}
	
	 
	
	
}

