package com.shop_order.model;

import java.sql.Timestamp;


public class OrdVO implements java.io.Serializable {
	
	private String ord_no;
	private String ord_status;
	private Timestamp ord_date;
	private String mem_no;
	private String emp_no;
	private String ord_price;
	private String ord_name;
	private String ord_phone;
	private String ord_mail;
	private String ord_code;
	private String ord_city;
	private String ord_section;
	private String ord_address;
	private String ord_coup;


	public String getOrdNo() {
		return ord_no;
	}
	public void setOrdNo(String ord_no) {
		this.ord_no = ord_no;
	}
	public String getOrdStatus() {
		return ord_status;
	}
	public void setOrdStatus(String ord_status) {
		this.ord_status = ord_status;
	}
	public Timestamp getOrdDate() {
		return ord_date;
	}
	public void setOrdDate(Timestamp ord_date) {
		this.ord_date = ord_date;
	}
	public String getOrdName() {
		return ord_name;
	}
	public void setOrdName(String ord_name) {
		this.ord_name = ord_name;
	}
	public String getOrdAddress(){
		return ord_address;
	}
	public void setOrdAddress(String ord_address) {
		this.ord_address = ord_address;
	}
	public String getOrdPhone() {
		return ord_phone;
	}
	public void setOrdPhone(String ord_phone) {
		this.ord_phone = ord_phone;
	}
	public String getOrdMail() {
		return ord_mail;
	}
	public void setOrdMail(String ord_mail) {
		this.ord_mail = ord_mail;
	}
	public String getMemNo(){
		return mem_no;
	}
	public void setMemNo(String mem_no) {
		this.mem_no = mem_no;
	}
	public String getEmpNo(){
		return emp_no;
	}
	public void setEmpNo(String emp_no) {
		this.emp_no = emp_no;
	}
	
	public String getOrdPrice() {
		return ord_price;
	}
	public void setOrdPrice(String ord_price) {
		this.ord_price = ord_price;
	}
	public String getOrdCode() {
		return ord_code;
	}
	public void setOrdCode(String ord_code) {
		this.ord_code = ord_code;
	}
	public String getOrdCity() {
		return ord_city;
	}
	public void setOrdCity(String ord_city) {
		this.ord_city = ord_city;
	}
	public String getOrdSection() {
		return ord_section;
	}
	public void setOrdSection(String ord_section) {
		this.ord_section = ord_section;
	}
	public String getOrdCoup() {
		return ord_coup;
	}
	public void setOrdCoup(String ord_coup) {
		this.ord_coup = ord_coup;
	}

	
	
}

