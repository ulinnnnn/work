package com.shop_coupon.model;

import java.sql.Timestamp;


public class CoupVO implements java.io.Serializable {
	
	private String coup_no;
	private Double coup_discount;
	private Timestamp coup_date;
	private String coup_status;
	private String mem_no;



	public String getCoupNo() {
		return coup_no;
	}
	public void setCoupNo(String coup_no) {
		this.coup_no = coup_no;
	}
	
	public Double getCoupDiscount() {
		return coup_discount;
	}
	public void setCoupDiscount(Double coup_discount) {
		this.coup_discount = coup_discount;
	}
	
	public Timestamp getCoupDate() {
		return coup_date;
	}
	public void setCoupDate(Timestamp coup_date) {
		this.coup_date = coup_date;
	}
	
	public String getCoupStatus() {
		return coup_status;
	}
	public void setCoupStatus(String coup_status) {
		this.coup_status = coup_status;
	}
	
	public String getMemNo() {
		return mem_no;
	}
	public void setMemNo(String mem_no) {
		this.mem_no = mem_no;
	}
	
}

