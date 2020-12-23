package com.CPREPORT.model;

import java.sql.Timestamp;

public class CpreportVO  implements java.io.Serializable{
	private String cprp_No;            
	private String cprp_State;            
	             
	private String mem_No;                
	private String emp_NO;                         
	private String cp_No;
	                    
	private Timestamp cprp_time;

	public String getCprp_No() {
		return cprp_No;
	}

	public void setCprp_No(String cprp_No) {
		this.cprp_No = cprp_No;
	}

	public String getCprp_State() {
		return cprp_State;
	}

	public void setCprp_State(String cprp_State) {
		this.cprp_State = cprp_State;
	}

	public String getMem_No() {
		return mem_No;
	}

	public void setMem_No(String mem_No) {
		this.mem_No = mem_No;
	}

	public String getEmp_NO() {
		return emp_NO;
	}

	public void setEmp_NO(String emp_NO) {
		this.emp_NO = emp_NO;
	}

	public String getCp_No() {
		return cp_No;
	}

	public void setCp_No(String cp_No) {
		this.cp_No = cp_No;
	}

	public Timestamp getCprp_time() {
		return cprp_time;
	}

	public void setCprp_time(Timestamp cprp_time) {
		this.cprp_time = cprp_time;
	}              
	
	
	 
	
	
}

