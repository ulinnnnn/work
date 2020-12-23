package com.shop_item.model;

public class ItemVO implements java.io.Serializable {
	
	private String item_no;
	private Integer item_quantity;
	private Double prod_price;
	private String ord_no;
	private String prod_no;
	
	public String getItemNo() {
		return item_no;
	}
	public void setItemNo(String item_no) {
		this.item_no = item_no;
	}
	public Integer getItemQuantity() {
		return item_quantity;
	}
	public void setItemQuantity(Integer item_quantity) {
		this.item_quantity = item_quantity;
	}
	public Double getProdPrice() {
		return prod_price;
	}
	public void setProdPrice(Double prod_price) {
		this.prod_price = prod_price;
	}
	public String getOrdNo() {
		return ord_no;
	}
	public void setOrdNo(String ord_no) {
		this.ord_no = ord_no;
	}
	public String getProdNo() {
		return prod_no;
	}
	public void setProdNo(String prod_no) {
		this.prod_no = prod_no;
	}
	
}

