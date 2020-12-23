package com.cpmessage.model;

import java.sql.Timestamp;

public class CpmessageVO  implements java.io.Serializable{
	private String cpme_No;            
	private String cpme;            
	             
	private String mem_No;                
	private String cpreme_No;                         
	public String getCpme_No() {
		return cpme_No;
	}
	public void setCpme_No(String cpme_No) {
		this.cpme_No = cpme_No;
	}
	public String getCpme() {
		return cpme;
	}
	public void setCpme(String cpme) {
		this.cpme = cpme;
	}
	public String getMem_No() {
		return mem_No;
	}
	public void setMem_No(String mem_No) {
		this.mem_No = mem_No;
	}
	public String getCpreme_No() {
		return cpreme_No;
	}
	public void setCpreme_No(String cpreme_No) {
		this.cpreme_No = cpreme_No;
	}
	public String getCp_No() {
		return cp_No;
	}
	public void setCp_No(String cp_No) {
		this.cp_No = cp_No;
	}
	private String cp_No;
	                    
	
	
	
	 
	
	
}

