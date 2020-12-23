package com.Bid_record.model;

import java.sql.Timestamp;

public class Bid_recordVO implements java.io.Serializable {
	private String br_no;
	private String bp_no;
	private String mem_no;
	private Integer b_price;
	private Timestamp b_time;
	private String bo_statusno;
	public String getBr_no() {
		return br_no;
	}
	public void setBr_no(String br_no) {
		this.br_no = br_no;
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
	public Integer getB_price() {
		return b_price;
	}
	public void setB_price(Integer b_price) {
		this.b_price = b_price;
	}
	public Timestamp getB_time() {
		return b_time;
	}
	public void setB_time(Timestamp b_time) {
		this.b_time = b_time;
	}
	public String getBo_statusno() {
		return bo_statusno;
	}
	public void setBo_statusno(String bo_statusno) {
		this.bo_statusno = bo_statusno;
	}
	
	

	
	
	

}
