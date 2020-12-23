package com.Bid_content.model;

import java.sql.*;

public class Bid_contentVO implements java.io.Serializable {
	private String bm_no;//競標留言編號
	private String bp_no;//競標商品編號
	private String mem_no;//會員編號
	private String br_content;//競標留言內容
	private Timestamp br_time;//留言時間
	public String getBm_no() {
		return bm_no;
	}
	public void setBm_no(String bm_no) {
		this.bm_no = bm_no;
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
	public String getBr_content() {
		return br_content;
	}
	public void setBr_content(String br_content) {
		this.br_content = br_content;
	}
	public Timestamp getBr_time() {
		return br_time;
	}
	public void setBr_time(Timestamp br_time) {
		this.br_time = br_time;
	}



	
	
	

}
