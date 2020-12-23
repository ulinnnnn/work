package com.bpreport.model;
import java.sql.Date;

public class BprpVO implements java.io.Serializable{
	private String bprp_no;
	private String bp_no;
	private String mem_no;
	private String bprp_text;
	private String bprp_project;
	private Date bprp_time;
	private String bprp_status;
	
	
	public String getBprp_no() {
		return bprp_no;
	}
	public void setBprp_no(String bprp_no) {
		this.bprp_no = bprp_no;
	}
	public String getBp_no() {
		return bp_no;
	}
	public void setBp_no(String bp_no) {
		this.bp_no = bp_no;
	}
	public String getMem_no() {
		return mem_no;
	}
	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}
	public String getBprp_text() {
		return bprp_text;
	}
	public void setBprp_text(String bprp_text) {
		this.bprp_text = bprp_text;
	}
	public String getBprp_project() {
		return bprp_project;
	}
	public void setBprp_project(String bprp_project) {
		this.bprp_project = bprp_project;
	}
	public Date getBprp_time() {
		return bprp_time;
	}
	public void setBprp_time(Date bprp_time) {
		this.bprp_time = bprp_time;
	}
	public String getBprp_status() {
		return bprp_status;
	}
	public void setBprp_status(String bprp_status) {
		this.bprp_status = bprp_status;
	}
	
	
	
	
	
}
