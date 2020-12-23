package com.CPRECORD.model;

import java.sql.Timestamp;

public class CprecordVO  implements java.io.Serializable{
	private String cpr_No;            
	private String mem_No2;            
	             
	private String mem_No1;                
	private String cp_No2;                         
	private String cp_No1;
	private String cprstate;                    
	public String getCprstate() {
		return cprstate;
	}

	public void setCprstate(String cprstate) {
		this.cprstate = cprstate;
	}

	private Timestamp cpc_time;

	public String getCpr_No() {
		return cpr_No;
	}

	public void setCpr_No(String cpr_No) {
		this.cpr_No = cpr_No;
	}

	public String getMem_No2() {
		return mem_No2;
	}

	public void setMem_No2(String mem_No2) {
		this.mem_No2 = mem_No2;
	}

	

	public String getMem_No1() {
		return mem_No1;
	}

	public void setMem_No1(String mem_No1) {
		this.mem_No1 = mem_No1;
	}

	public String getCp_No1() {
		return cp_No1;
	}

	public void setCp_No1(String cp_No1) {
		this.cp_No1 = cp_No1;
	}

	

	public String getCp_No2() {
		return cp_No2;
	}

	public void setCp_No2(String cp_No2) {
		this.cp_No2 = cp_No2;
	}

	

	public Timestamp getCpc_time() {
		return cpc_time;
	}

	public void setCpc_time(Timestamp cpc_time) {
		this.cpc_time = cpc_time;
	}

	
	
	
	 
	
	
}

