package com.fmclass.model;

import java.io.Serializable;
import java.sql.Date;

public class fmclassVO implements Serializable {
	private String fmcl_no;
	private String fmcl_na;
	
	public String getfmcl_no() {
		return fmcl_no;
	}
	public void setfmcl_no(String fmcl_no) {
		this.fmcl_no = fmcl_no;
	}
	public String getfmcl_na() {
		return fmcl_na;
	}
	public void setfmcl_na(String fmcl_na) {
		this.fmcl_na = fmcl_na;
	}
}
