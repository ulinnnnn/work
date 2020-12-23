package com.depo.model;

import java.sql.Timestamp;

public class DepoVO {
	
	private String depo_no;
	private String mem_no;
	private Integer depo_amount;
	private Integer depo_point;
	private Timestamp depo_time;
	private String depo_trans_type;
	private String depo_tok_status;
	
	public String getDepo_no() {
		return depo_no;
	}
	public void setDepo_no(String depo_no) {
		this.depo_no = depo_no;
	}
	public String getMem_no() {
		return mem_no;
	}
	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}
	public Integer getDepo_amount() {
		return depo_amount;
	}
	public void setDepo_amount(Integer depo_amount) {
		this.depo_amount = depo_amount;
	}
	public Integer getDepo_point() {
		return depo_point;
	}
	public void setDepo_point(Integer depo_point) {
		this.depo_point = depo_point;
	}
	public Timestamp getDepo_time() {
		return depo_time;
	}
	public void setDepo_time(Timestamp depo_time) {
		this.depo_time = depo_time;
	}
	public String getDepo_trans_type() {
		return depo_trans_type;
	}
	public void setDepo_trans_type(String depo_trans_type) {
		this.depo_trans_type = depo_trans_type;
	}
	public String getDepo_tok_status() {
		return depo_tok_status;
	}
	public void setDepo_tok_status(String depo_tok_status) {
		this.depo_tok_status = depo_tok_status;
	}
	
	
}
