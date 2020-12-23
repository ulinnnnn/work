package com.Bid_commodity_Report.model;
import java.sql.*;

public class Bid_commodity_ReportVO implements java.io.Serializable{
		private String bre_no;//競標檢舉編號
		private String mem_no;//(提出檢舉)會員編號
		private String bp_no;//競標商品編號
		private String br_project;//競標檢舉項目
		private String br_content;//競標檢舉內容
		private Timestamp br_time;//競標檢舉時間
		private String bap_status;//競標處理狀態
		public String getBre_no() {
			return bre_no;
		}
		public void setBre_no(String bre_no) {
			this.bre_no = bre_no;
		}
		public String getMem_no() {
			return mem_no;
		}
		public void setMem_no(String mem_no) {
			this.mem_no = mem_no;
		}
		public String getBp_no() {
			return bp_no;
		}
		public void setBp_no(String bp_no) {
			this.bp_no = bp_no;
		}
		public String getBr_project() {
			return br_project;
		}
		public void setBr_project(String br_project) {
			this.br_project = br_project;
		}
		public String getBr_content() {
			return br_content;
		}
		public void setBr_content(String br_content) {
			this.br_content = br_content;
		}

		public String getBap_status() {
			return bap_status;
		}
		public void setBap_status(String bap_status) {
			this.bap_status = bap_status;
		}
		public Timestamp getBr_time() {
			return br_time;
		}
		public void setBr_time(Timestamp br_time) {
			this.br_time = br_time;
		}
		
		
}
