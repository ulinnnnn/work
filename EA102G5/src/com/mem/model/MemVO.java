package com.mem.model;

import java.io.InputStream;
import java.sql.Date;

public class MemVO {
	private String mem_no;
	private String mem_name;
	private String mem_account;
	private String mem_pwd;
	private String mem_phone;
	private String mem_email;
	private String mem_sex;
	private Date mem_born;
	private String mem_level;
	private Integer mem_creScore;
	private Date mem_add_date;
	private String mem_status;
	private String mem_verification_code;
	private Integer mem_abandon; 
	private String mem_type;
	private String mem_bank;
	private String mem_addr;
	private String mem_addr1;
	private String mem_addr2;
	private String mem_addr3;
	private byte[] mem_pic;
	private String base_mem_pic;
	
	public String getMem_verification_code() {
		return mem_verification_code;
	}
	public void setMem_verification_code(String mem_verification_code) {
		this.mem_verification_code = mem_verification_code;
	}
	public String getMem_addr1() {
		return mem_addr1;
	}
	public void setMem_addr1(String mem_addr1) {
		this.mem_addr1 = mem_addr1;
	}
	public String getMem_addr2() {
		return mem_addr2;
	}
	public void setMem_addr2(String mem_addr2) {
		this.mem_addr2 = mem_addr2;
	}
	public String getMem_addr3() {
		return mem_addr3;
	}
	public void setMem_addr3(String mem_addr3) {
		this.mem_addr3 = mem_addr3;
	}
	public String getMem_no() {
		return mem_no;
	}
	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_account() {
		return mem_account;
	}
	public void setMem_account(String mem_account) {
		this.mem_account = mem_account;
	}
	public String getMem_pwd() {
		return mem_pwd;
	}
	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}
	public String getMem_phone() {
		return mem_phone;
	}
	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public Date getMem_born() {
		return mem_born;
	}
	public void setMem_born(Date mem_born) {
		this.mem_born = mem_born;
	}
	public String getMem_sex() {
		return mem_sex;
	}
	public void setMem_sex(String mem_sex) {
		this.mem_sex = mem_sex;
	}
	public String getMem_addr() {
		return mem_addr;
	}
	public void setMem_addr(String mem_addr) {
		this.mem_addr = mem_addr;
	}
	public String getMem_bank() {
		return mem_bank;
	}
	public void setMem_bank(String mem_bank) {
		this.mem_bank = mem_bank;
	}
	public String getMem_level() {
		return mem_level;
	}
	public void setMem_level(String mem_level) {
		this.mem_level = mem_level;
	}
	public Integer getMem_creScore() {
		return mem_creScore;
	}
	public void setMem_creScore(Integer mem_creScore) {
		this.mem_creScore = mem_creScore;
	}
	public Date getMem_add_date() {
		return mem_add_date;
	}
	public void setMem_add_date(Date mem_add_date) {
		this.mem_add_date = mem_add_date;
	}
	public String getMem_status() {
		return mem_status;
	}
	public void setMem_status(String mem_status) {
		this.mem_status = mem_status;
	}
	public Integer getMem_abandon() {
		return mem_abandon;
	}
	public void setMem_abandon(Integer mem_abandon) {
		this.mem_abandon = mem_abandon;
	}
	public byte[] getMem_pic() {
		return mem_pic;
	}
	public void setMem_pic(byte[] mem_pic) {
		this.mem_pic = mem_pic;
	}
	public String getMem_type() {
		return mem_type;
	}
	public void setMem_type(String mem_type) {
		this.mem_type = mem_type;
	}
	public String getBase_mem_pic() {
		return base_mem_pic;
	}
	public void setBase_mem_pic(String base_mem_pic) {
		this.base_mem_pic = base_mem_pic;
	}
	
		
}