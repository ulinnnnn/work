package com.fmmessage.model;

import java.sql.Date;

public class fmmeVO implements java.io.Serializable{
	
	private String fmme_no;
	private String fm_no;
	private String mem_no;
	private String fmme_text;
	private String qmem_no;
	private String qfmme_text;
	
	
	public String getFmme_no() {
		return fmme_no;
	}
	public void setFmme_no(String fmme_no) {
		this.fmme_no = fmme_no;
	}
	public String getFm_no() {
		return fm_no;
	}
	public void setFm_no(String fm_no) {
		this.fm_no = fm_no;
	}
	public String getMem_no() {
		return mem_no;
	}
	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}
	public String getFmme_text() {
		return fmme_text;
	}
	public void setFmme_text(String fmme_text) {
		this.fmme_text = fmme_text;
	}
	public String getQmem_no() {
		return qmem_no;
	}
	public void setQmem_no(String qmem_no) {
		this.qmem_no = qmem_no;
	}
	public String getQfmme_text() {
		return qfmme_text;
	}
	public void setQfmme_text(String qfmme_text) {
		this.qfmme_text = qfmme_text;
	}
	
	
	
	
}
