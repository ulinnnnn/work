package com.Bid_commodity.model;
import java.sql.*;

public class Bid_commodityVO implements java.io.Serializable{

	private String bp_no;//競標商品編號
	private String mem_no;//會員編號	
	private Integer bs_price;//商品起標價格
	private String b_intro;//競標商品介紹
	private Timestamp b_startime;//競標開始時間
	private Timestamp b_endtime;//競標結束時間
	private Integer bplus_price;//競標每次加價金額
	private Integer b_times;//競標出價次數
	private String bc_no;//競標商品類別編號
	private String b_name;//競標商品名稱
	private byte[] b_picture;//競標商品照片
	private byte[] b_picture2;
	private String photo_no;
	private Integer bn_price;
	
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
	public Integer getBs_price() {
		return bs_price;
	}
	public void setBs_price(Integer bs_price) {
		this.bs_price = bs_price;
	}
	public String getB_intro() {
		return b_intro;
	}
	public void setB_intro(String b_intro) {
		this.b_intro = b_intro;
	}
	public Timestamp getB_startime() {
		return b_startime;
	}
	public void setB_startime(Timestamp b_startime) {
		this.b_startime = b_startime;
	}
	public Timestamp getB_endtime() {
		return b_endtime;
	}
	public void setB_endtime(Timestamp b_endtime) {
		this.b_endtime = b_endtime;
	}
	public Integer getBplus_price() {
		return bplus_price;
	}
	public void setBplus_price(Integer bplus_price) {
		this.bplus_price = bplus_price;
	}
	public Integer getB_times() {
		return b_times;
	}
	public void setB_times(Integer b_times) {
		this.b_times = b_times;
	}
	public String getBc_no() {
		return bc_no;
	}
	public void setBc_no(String bc_no) {
		this.bc_no = bc_no;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public byte[] getB_picture() {
		return b_picture;
	}
	public void setB_picture(byte[] b_picture) {
		this.b_picture = b_picture;
	}

	public byte[] getB_picture2() {
		return b_picture2;
	}
	public void setB_picture2(byte[] b_picture2) {
		this.b_picture2 = b_picture2;
	}
	public String getPhoto_no() {
		return photo_no;
	}
	public void setPhoto_no(String photo_no) {
		this.photo_no = photo_no;
	}
	public Integer getBn_price() {
		return bn_price;
	}
	public void setBn_price(Integer bn_price) {
		this.bn_price = bn_price;
	}
	
	
	
	
}
