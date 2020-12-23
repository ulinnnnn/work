package com.serv.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.sql.Date;

public class ServVO implements Serializable {
	private String servNo;
	private String ordNo;
	private String custCont;
	private Timestamp custContTime;
	private String empNo;
	private String resCont;
	private Timestamp resContTime;

	public String getServNo() {
		return servNo;
	}

	public void setServNo(String servNo) {
		this.servNo = servNo;
	}

	public String getOrdNo() {
		return ordNo;
	}

	public void setOrdNo(String ordNo) {
		this.ordNo = ordNo;
	}

	public String getCustCont() {
		return custCont;
	}

	public void setCustCont(String custCont) {
		this.custCont = custCont;
	}

	public Timestamp getCustContTime() {
		return custContTime;
	}

	public void setCustContTime(Timestamp custContTime) {
		this.custContTime = custContTime;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getResCont() {
		return resCont;
	}

	public void setResCont(String resCont) {
		this.resCont = resCont;
	}

	public Timestamp getResContTime() {
		return resContTime;
	}

	public void setResContTime(Timestamp resContTime) {
		this.resContTime = resContTime;
	}

}
