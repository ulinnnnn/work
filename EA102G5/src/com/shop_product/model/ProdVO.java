package com.shop_product.model;

import java.sql.Timestamp;


public class ProdVO implements java.io.Serializable {
	
	private String prod_no;
	private String prod_name;
	private Double prod_price;
	private String prod_brand;
	private Timestamp prod_date;
	private String prod_intro;
	private String category_no;
	private String prod_status;
	private byte[] prod_photo;
	
	public String getProdNo() {
		return prod_no;
	}
	public void setProdNo(String prod_no) {
		this.prod_no = prod_no;
	}
	public String getProdName() {
		return prod_name;
	}
	public void setProdName(String prod_name) {
		this.prod_name = prod_name;
	}
	public Double getProdPrice() {
		return prod_price;
	}
	public void setProdPrice(Double prod_price) {
		this.prod_price = prod_price;
	}
	public String getProdBrand() {
		return prod_brand;
	}
	public void setProdBrand(String prod_brand) {
		this.prod_brand = prod_brand;
	}
	public Timestamp getProdDate() {
		return prod_date;
	}
	public void setProdDate(Timestamp prod_date) {
		this.prod_date = prod_date;
	}
	public String getProdIntro() {
		return prod_intro;
	}
	public void setProdIntro(String prod_intro) {
		this.prod_intro = prod_intro;
	}
	public String getCategoryNo() {
		return category_no;
	}
	public void setCategoryNo(String category_no) {
		this.category_no = category_no;
	}
	public String getProdStatus() {
		return prod_status;
	}
	public void setProdStatus(String prod_status) {
		this.prod_status = prod_status;
	}
	public byte[] getProdPhoto() {
		return prod_photo;
	}
	public void setProdPhoto(byte[] prod_photo) {
		this.prod_photo = prod_photo;
	}
	
}

