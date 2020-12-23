package com.Bid_commodity_Report.model;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

import com.Bid_commodity.model.Bid_commodityVO;
import com.Bid_commodity_Report.model.Bid_commodity_ReportVO;

public class Bid_commodity_ReportService {
	
	private IBid_commodity_Report dao;
	
	public Bid_commodity_ReportService() {
		dao = new Bid_commodity_ReportJDBC();
	}
	public Bid_commodity_ReportVO addreport(String mem_no, String bp_no,String br_project,
			String br_content) {

		Bid_commodity_ReportVO bidVO = new Bid_commodity_ReportVO();
		bidVO.setMem_no(mem_no);
		bidVO.setBp_no(bp_no);
		bidVO.setBr_project(br_project);
		bidVO.setBr_content(br_content);
		dao.insert(bidVO);
		return bidVO;
	}
	public Bid_commodity_ReportVO updateBid(String bre_no, String bap_status) {
		Bid_commodity_ReportVO bidVO = new Bid_commodity_ReportVO();
		bidVO.setBre_no(bre_no);
		bidVO.setBap_status(bap_status);
		dao.update(bidVO);

		return bidVO;
	}
	public List<Bid_commodity_ReportVO> getAll() {
		return dao.getAll();
	}

	public Bid_commodity_ReportVO getOnestatus(String mem_no,Integer bap_status) {
		return dao.findByPrimaryKey(mem_no,bap_status);
	}
	public List<Bid_commodity_ReportVO> findByKey(Integer bap_status) {
		return dao.findByKey(bap_status);
	}



}
